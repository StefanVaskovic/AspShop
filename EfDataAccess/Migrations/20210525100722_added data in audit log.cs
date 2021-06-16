using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class addeddatainauditlog : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Data",
                table: "AuditLogs",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Data",
                table: "AuditLogs");
        }
    }
}
