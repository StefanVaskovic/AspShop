using Application;
using Application.Commands;
using Application.DataTransfer.Color;
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
    public class ColorsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ColorsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<CategoriesController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchColorsDto dto,
                [FromServices] IGetColorsQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // GET api/<CategoriesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(
            int id,
            [FromServices] IGetColorQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<CategoriesController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] RequestCreateColorDto dto,
            [FromServices] ICreateColorCommand command
            )
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<CategoriesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id,
            [FromBody] ColorDto dto,
            [FromServices] IUpdateColorCommand command
            )
        {
            dto.Id = id;

            _executor.ExecuteCommand(command, dto);
            return StatusCode(204);
        }

        // DELETE api/<CategoriesController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(
            int id,
            [FromServices] IDeleteColorCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
