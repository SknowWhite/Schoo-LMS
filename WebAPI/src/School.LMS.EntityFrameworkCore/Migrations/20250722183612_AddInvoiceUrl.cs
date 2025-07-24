using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace School.LMS.Migrations
{
    /// <inheritdoc />
    public partial class AddInvoiceUrl : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "InvoiceLastUpdate",
                table: "StudentInstallments",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "InvoiceUrl",
                table: "StudentInstallments",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "TransactionId",
                table: "StudentInstallments",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "InvoiceLastUpdate",
                table: "StudentInstallments");

            migrationBuilder.DropColumn(
                name: "InvoiceUrl",
                table: "StudentInstallments");

            migrationBuilder.DropColumn(
                name: "TransactionId",
                table: "StudentInstallments");
        }
    }
}
