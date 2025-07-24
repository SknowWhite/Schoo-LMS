using Abp.Zero.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using School.LMS.Authorization.Roles;
using School.LMS.Authorization.Users;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using School.LMS.MultiTenancy;

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

        // NEW: Installment Management
        public DbSet<InstallmentTemplate> InstallmentTemplates { get; set; }
        public DbSet<InstallmentBreakdown> InstallmentBreakdowns { get; set; }
        public DbSet<StudentInstallment> StudentInstallments { get; set; }
        public DbSet<StudentInstallmentPayment> StudentInstallmentPayments { get; set; }

        public LMSDbContext(DbContextOptions<LMSDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Existing unique constraints
            builder.Entity<EducationalInstallment>()
                .HasIndex(i => new { i.EducationalFeePlanId, i.Order })
                .IsUnique();

            builder.Entity<BusInstallment>()
                .HasIndex(i => new { i.BusFeePlanId, i.Order })
                .IsUnique();

            // NEW: Optional constraints and relationships

            builder.Entity<InstallmentBreakdown>()
                .HasOne(b => b.InstallmentTemplate)
                .WithMany(t => t.Breakdowns)
                .HasForeignKey(b => b.InstallmentTemplateId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentInstallment>()
                .HasOne(s => s.Student)
                .WithMany(st => st.StudentInstallments)
                .HasForeignKey(s => s.StudentId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentInstallment>()
                .HasOne(s => s.InstallmentTemplate)
                .WithMany(t => t.StudentInstallments)
                .HasForeignKey(s => s.InstallmentTemplateId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.Entity<StudentInstallmentPayment>()
                .HasOne(p => p.StudentInstallment)
                .WithMany(s => s.Payments)
                .HasForeignKey(p => p.StudentInstallmentId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }

}
