using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class added_likedAt_in_likedcomment_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "LikedAt",
                table: "LikedComment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LikedAt",
                table: "LikedComment");
        }
    }
}
