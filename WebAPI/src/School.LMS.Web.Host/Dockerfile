FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src
COPY ["src/School.LMS.Web.Host/School.LMS.Web.Host.csproj", "src/School.LMS.Web.Host/"]
COPY ["src/School.LMS.Web.Core/School.LMS.Web.Core.csproj", "src/School.LMS.Web.Core/"]
COPY ["src/School.LMS.Application/School.LMS.Application.csproj", "src/School.LMS.Application/"]
COPY ["src/School.LMS.Core/School.LMS.Core.csproj", "src/School.LMS.Core/"]
COPY ["src/School.LMS.EntityFrameworkCore/School.LMS.EntityFrameworkCore.csproj", "src/School.LMS.EntityFrameworkCore/"]
WORKDIR "/src/src/School.LMS.Web.Host"
RUN dotnet restore 

WORKDIR /src
COPY ["src/School.LMS.Web.Host", "src/School.LMS.Web.Host"]
COPY ["src/School.LMS.Web.Core", "src/School.LMS.Web.Core"]
COPY ["src/School.LMS.Application", "src/School.LMS.Application"]
COPY ["src/School.LMS.Core", "src/School.LMS.Core"]
COPY ["src/School.LMS.EntityFrameworkCore", "src/School.LMS.EntityFrameworkCore"]
WORKDIR "/src/src/School.LMS.Web.Host"
RUN dotnet publish -c Release -o /publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0
EXPOSE 80
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT ["dotnet", "School.LMS.Web.Host.dll"]
