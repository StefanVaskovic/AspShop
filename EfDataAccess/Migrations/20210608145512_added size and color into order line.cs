using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class addedsizeandcolorintoorderline : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Size",
                table: "OrderLines",
                newName: "SizeId");

            migrationBuilder.AddColumn<int>(
                name: "ColorId",
                table: "OrderLines",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_OrderLines_ColorId",
                table: "OrderLines",
                column: "ColorId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderLines_SizeId",
                table: "OrderLines",
                column: "SizeId");

            migrationBuilder.AddForeignKey(
                name: "FK_OrderLines_Colors_ColorId",
                table: "OrderLines",
                column: "ColorId",
                principalTable: "Colors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_OrderLines_Sizes_SizeId",
                table: "OrderLines",
                column: "SizeId",
                principalTable: "Sizes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_OrderLines_Colors_ColorId",
                table: "OrderLines");

            migrationBuilder.DropForeignKey(
                name: "FK_OrderLines_Sizes_SizeId",
                table: "OrderLines");

            migrationBuilder.DropIndex(
                name: "IX_OrderLines_ColorId",
                table: "OrderLines");

            migrationBuilder.DropIndex(
                name: "IX_OrderLines_SizeId",
                table: "OrderLines");

            migrationBuilder.DropColumn(
                name: "ColorId",
                table: "OrderLines");

            migrationBuilder.RenameColumn(
                name: "SizeId",
                table: "OrderLines",
                newName: "Size");
        }
    }
}
