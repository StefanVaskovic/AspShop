using Application;
using Application.Commands;
using Application.DataTransfer.User;
using Application.Queries;
using Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UsersController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UserController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchUsersDto dto,
                [FromServices] IGetUsersQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id,
            [FromBody] UserDto dto,
            [FromServices] IUpdateUserCommand command
            )
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(
            int id,
            [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
