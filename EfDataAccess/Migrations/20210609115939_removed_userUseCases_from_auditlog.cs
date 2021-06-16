using Microsoft.EntityFrameworkCore.Migrations;

namespace EfDataAccess.Migrations
{
    public partial class removed_userUseCases_from_auditlog : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AuditLogs_UserUseCase_UserUseCaseId",
                table: "AuditLogs");

            migrationBuilder.DropIndex(
                name: "IX_AuditLogs_UserUseCaseId",
                table: "AuditLogs");

            migrationBuilder.DropColumn(
                name: "UserUseCaseId",
                table: "AuditLogs");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "UserUseCaseId",
                table: "AuditLogs",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AuditLogs_UserUseCaseId",
                table: "AuditLogs",
                column: "UserUseCaseId");

            migrationBuilder.AddForeignKey(
                name: "FK_AuditLogs_UserUseCase_UserUseCaseId",
                table: "AuditLogs",
                column: "UserUseCaseId",
                principalTable: "UserUseCase",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
