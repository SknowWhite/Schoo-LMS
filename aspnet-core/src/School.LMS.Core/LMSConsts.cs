using School.LMS.Debugging;

namespace School.LMS
{
    public class LMSConsts
    {
        public const string LocalizationSourceName = "LMS";

        public const string ConnectionStringName = "Default";

        public const bool MultiTenancyEnabled = true;


        /// <summary>
        /// Default pass phrase for SimpleStringCipher decrypt/encrypt operations
        /// </summary>
        public static readonly string DefaultPassPhrase =
            DebugHelper.IsDebug ? "gsKxGZ012HLL3MI5" : "c4da5b92efba4a3fb084ed3e0227a9bb";
    }
}
