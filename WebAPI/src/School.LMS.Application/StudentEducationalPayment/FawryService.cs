using Newtonsoft.Json;
using System;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using System.Net;
using System.IO;
using System.Linq;

namespace School.LMS.StudentEducationalPayment
{
    public class FawryService
    {
        private  HttpClient _httpClient;
        private readonly string _username;
        private readonly string _password;
        private readonly string _loginUrl;
        private readonly string _invoiceUrl;
        private readonly string _invoiceCheckUrl;

        private (string token, string refreshToken) _accessToken;
        public FawryService(IHttpClientFactory httpClientFactory, IConfiguration config)
        {

            _httpClient = httpClientFactory.CreateClient("Fawry");
            _username = config["Fawry:Username"];
            _password = config["Fawry:Password"];
            _loginUrl = config["Fawry:Login"];
            _invoiceUrl = config["Fawry:InvoiceUrl"];
            _invoiceCheckUrl = config["Fawry:InvoiceCheck"];
        }

        public async Task<(string invoiceNumber,string businessReference)> CreatePaymentLinkAsync(string studentName, string studentId, string mobile, double amount, string description)
        {
            _httpClient = CreateHttpClient();


            AppContext.SetSwitch("System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", false);
            AppContext.SetSwitch("System.Net.Http.SocketsHttpHandler.Http2Support", false);
            // Ensure TLS 1.2+

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            System.Diagnostics.Trace.Listeners.Add(new System.Diagnostics.TextWriterTraceListener(Console.Out));
            System.Diagnostics.Trace.AutoFlush = true;
            if (  string.IsNullOrEmpty(_accessToken.token) )
                 _accessToken = await GetAccessTokenAsync();


            return await CreateLink(studentName, studentId, mobile, amount, description, _accessToken.token);
        }

        private async Task<(string invoiceNumber, string businessReference)> CreateLink(string studentName, string studentId, string mobile, double amount, string description, string token)
        {

            try
            {
                var now = DateTime.UtcNow;
                var businessReference = $"EDU3-{studentId}-{Guid.NewGuid():N}";

                var payload = new
                {
                    customer = new
                    {
                        name = studentName,
                        email = $"mail{studentId}@realmail.com",  // not @example.com
                        mobile = mobile             // local format
                    },
                    amount = amount,
                    sendingDate = "2025-06-25",
                    expiryDate = "2025-06-29T13:19:17.000Z",
                    releaseDate = "2025-06-25T13:16:50.668Z",
                    businessReference = businessReference,
                    note =description,
                    communicationLang = "ar-eg",
                    communicationMethod = "SMS",
                    alertMerchantUponExpiry = false,
                    items = new[]
    {
        new
        {
            itemCode = "item001",
            purchasedQuantity = 1,
            price = amount,
            nameEn = description,
            nameAr = description,
            discount = new
            {
                value = 0,
                type = "FLAT"
            }
        }
    },
                    paymentType = "PUSH_TO_CUSTOMER",
                    taxes = 0,
                    preferredPaymentMethod = "CARD"
                };


                string jsonInputString = JsonConvert.SerializeObject(payload);
           
                string responseData = PostJson(_invoiceUrl, jsonInputString, token);

                 if (!string.IsNullOrEmpty(responseData))
                {
                    return (responseData, businessReference);
                }
                
                return (null,null);
            }
            catch (Exception ex)
            {

                throw ex;
            }
          

        }


        private async Task<(string token, string refreshToken)> GetAccessTokenAsync()
        {
            var loginPayload = new { userIdentifier = _username, password = _password };
            var request = new HttpRequestMessage(HttpMethod.Post, _loginUrl);
            request.Content = new StringContent(JsonConvert.SerializeObject(loginPayload), Encoding.UTF8, "application/json");
            request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            var response = await _httpClient.SendAsync(request);
            var json = await response.Content.ReadAsStringAsync();
            dynamic result = JsonConvert.DeserializeObject(json);

            return (result?.token, result?.refreshToken);
        }
        string NormalizeEgyptianMobile(string mobile)
        {
            if (mobile.StartsWith("01") && mobile.Length == 11)
                return "+2" + mobile; // Convert to international format
            return mobile;
        }
    
            private async Task<string> RefreshAccessTokenAsync(string refreshToken)
        {
            using (var client = new HttpClient())
            {
                var payload = new { refreshToken = refreshToken };
                var content = new StringContent(JsonConvert.SerializeObject(payload), Encoding.UTF8, "application/json");
                var response = await client.PostAsync("https://atfawry.fawrystaging.com/user-api/auth/token/refresh", content);
                var responseContent = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                    throw new Exception($"Fawry token refresh failed: {response.StatusCode} - {responseContent}");

                dynamic result = JsonConvert.DeserializeObject(responseContent);
                string newToken = result?.token;

                if (string.IsNullOrEmpty(newToken))
                    throw new Exception("Fawry token refresh succeeded but no token was returned.");

                return newToken;
            }
        }

        private HttpClient CreateHttpClient()
        {
            var handler = new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator,
                AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate
            };

            var client = new HttpClient(handler);
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return client;
        }
        private string PostJson(string uri, string payload, string token)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(payload);
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(uri);
            httpWebRequest.Method = "POST";
            httpWebRequest.ContentLength = bytes.Length;
            httpWebRequest.Headers.Add("Authorization", "Bearer " + token);
            httpWebRequest.ContentType = "application/json"; // fix: "application/json" not "text/json"

            using (Stream requestStream = httpWebRequest.GetRequestStream())
            {
                requestStream.Write(bytes, 0, bytes.Length);
            }

            using (var httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse())
            using (var reader = new StreamReader(httpWebResponse.GetResponseStream()))
            {
                string result = reader.ReadToEnd();

                if (httpWebResponse.StatusCode != HttpStatusCode.OK && httpWebResponse.StatusCode != HttpStatusCode.Created)
                {
                    throw new ApplicationException($"POST failed. Received HTTP {httpWebResponse.StatusCode}. Response: {result}");
                }

                return (result);
            }
        }
        public async Task<FawryInvoiceStatusDto> GetInvoiceStatusAsync(string invoiceNumber)
        {
            _httpClient = CreateHttpClient();


            AppContext.SetSwitch("System.Net.Http.SocketsHttpHandler.Http2UnencryptedSupport", false);
            AppContext.SetSwitch("System.Net.Http.SocketsHttpHandler.Http2Support", false);
            // Ensure TLS 1.2+

            System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
            System.Diagnostics.Trace.Listeners.Add(new System.Diagnostics.TextWriterTraceListener(Console.Out));
            System.Diagnostics.Trace.AutoFlush = true;
            if (string.IsNullOrEmpty(_accessToken.token))
                _accessToken = await GetAccessTokenAsync();
            var url = $"{_invoiceCheckUrl}{invoiceNumber}/details";

            var response = GetJson(url,_accessToken.token);
           
            return JsonConvert.DeserializeObject<FawryInvoiceStatusDto>(response);
        }

        private string GetJson(string uri,string AccessToken)
        {
            var httpWebRequest = (HttpWebRequest)WebRequest.Create(uri);
            httpWebRequest.Method = "Get";
            httpWebRequest.Headers.Add("Authorization", "Bearer " + AccessToken);//The token you obtained from the login API
            httpWebRequest.ContentType = "text/json";
         
            var httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            if (httpWebResponse.StatusCode != HttpStatusCode.OK)
            {
                string message = String.Format("Get failed. Received HTTP {0}", httpWebResponse.StatusCode);
                throw new ApplicationException(message);
            }
            using (var reader = new StreamReader(httpWebResponse.GetResponseStream()))
            {
                string result = reader.ReadToEnd();
                // Process the result as needed
                Console.WriteLine(result);
                return result;
            }
        }

    }
    public class FawryInvoiceStatusDto
    {
        public string number { get; set; } // Invoice Number
        public string paymentUrl { get; set; }
        public PaymentStatusDto paymentStatus { get; set; }
        public string businessReference { get; set; }
        public decimal? paidAmount { get; set; }
        public InvoiceDataDto data { get; set; }
    }

    public class PaymentStatusDto
    {
        public int id { get; set; }
        public string code { get; set; } // e.g., PAID, UNPAID
        public string nameEn { get; set; }
        public string nameAr { get; set; }
    }

    public class InvoiceDataDto
    {
        public string status { get; set; } // NOT_STARTED, ACTIVE, etc.
    }



}



