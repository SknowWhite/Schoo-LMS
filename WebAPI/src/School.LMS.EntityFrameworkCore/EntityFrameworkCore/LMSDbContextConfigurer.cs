using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace School.LMS.EntityFrameworkCore
{
    public static class LMSDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<LMSDbContext> builder, string connectionString)
        {
            builder.UseSqlServer(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<LMSDbContext> builder, DbConnection connection)
        {
            builder.UseSqlServer(connection);
        }
    }
}
