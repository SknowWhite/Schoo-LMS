using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using School.LMS.Authorization.Roles;
using School.LMS.Authorization.Users;
using School.LMS.MultiTenancy;
using School.LMS.Models;

namespace School.LMS.EntityFrameworkCore
{
    public class LMSDbContext : AbpZeroDbContext<Tenant, Role, User, LMSDbContext>
    {
        /* Define a DbSet for each entity of the application */
        // Students
        public DbSet<Student> Students { get; set; }

        // Educational Fee Plans
        public DbSet<EducationalFeePlan> EducationalFeePlans { get; set; }
        public DbSet<EducationalInstallment> EducationalInstallments { get; set; }

        // Student Educational Payments
        public DbSet<StudentEducationalPayment> StudentEducationalPayments { get; set; }

        // Bus Fee Plans
        public DbSet<BusFeePlan> BusFeePlans { get; set; }
        public DbSet<BusInstallment> BusInstallments { get; set; }

        // Student Bus Subscriptions and Payments
        public DbSet<StudentBusSubscription> StudentBusSubscriptions { get; set; }
        public DbSet<StudentBusPayment> StudentBusPayments { get; set; }

        public LMSDbContext(DbContextOptions<LMSDbContext> options)
            : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Optional: Configure any specific relationships or constraints here
            builder.Entity<EducationalInstallment>()
                .HasIndex(i => new { i.EducationalFeePlanId, i.Order })
            .IsUnique();

            builder.Entity<BusInstallment>()
                .HasIndex(i => new { i.BusFeePlanId, i.Order })
                .IsUnique();
        }
    }
}
