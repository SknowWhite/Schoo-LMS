using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace School.LMS.Migrations
{
    /// <inheritdoc />
    public partial class AddNewLogicForDynamicInstallement : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "InstallmentTemplates",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Type = table.Column<int>(type: "int", nullable: false),
                    TotalAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    StartDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EndDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InstallmentTemplates", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "InstallmentBreakdowns",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    InstallmentTemplateId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Label = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_InstallmentBreakdowns", x => x.Id);
                    table.ForeignKey(
                        name: "FK_InstallmentBreakdowns_InstallmentTemplates_InstallmentTemplateId",
                        column: x => x.InstallmentTemplateId,
                        principalTable: "InstallmentTemplates",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentInstallments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    StudentId = table.Column<int>(type: "int", nullable: false),
                    InstallmentTemplateId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    Notes = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DueDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Status = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentInstallments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StudentInstallments_InstallmentTemplates_InstallmentTemplateId",
                        column: x => x.InstallmentTemplateId,
                        principalTable: "InstallmentTemplates",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StudentInstallments_Students_StudentId",
                        column: x => x.StudentId,
                        principalTable: "Students",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StudentInstallmentPayments",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    StudentInstallmentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PaidAmount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    PaymentDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    PaymentReference = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StudentInstallmentPayments", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StudentInstallmentPayments_StudentInstallments_StudentInstallmentId",
                        column: x => x.StudentInstallmentId,
                        principalTable: "StudentInstallments",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_InstallmentBreakdowns_InstallmentTemplateId",
                table: "InstallmentBreakdowns",
                column: "InstallmentTemplateId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentInstallmentPayments_StudentInstallmentId",
                table: "StudentInstallmentPayments",
                column: "StudentInstallmentId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentInstallments_InstallmentTemplateId",
                table: "StudentInstallments",
                column: "InstallmentTemplateId");

            migrationBuilder.CreateIndex(
                name: "IX_StudentInstallments_StudentId",
                table: "StudentInstallments",
                column: "StudentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "InstallmentBreakdowns");

            migrationBuilder.DropTable(
                name: "StudentInstallmentPayments");

            migrationBuilder.DropTable(
                name: "StudentInstallments");

            migrationBuilder.DropTable(
                name: "InstallmentTemplates");
        }
    }
}
