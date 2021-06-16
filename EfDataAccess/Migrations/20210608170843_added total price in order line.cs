using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class addedtotalpriceinorderline : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "TotalPrice",
                table: "OrderLines",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TotalPrice",
                table: "OrderLines");
        }
    }
}
