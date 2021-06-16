using Application;
using Application.Commands;
using Application.DataTransfer.Size;
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
    public class SizesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public SizesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<CategoriesController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchSizesDto dto,
                [FromServices] IGetSizesQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // GET api/<CategoriesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(
            int id,
            [FromServices] IGetSizeQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<CategoriesController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] RequestCreateSizeDto dto,
            [FromServices] ICreateSizeCommand command
            )
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<CategoriesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id,
            [FromBody] SizeDto dto,
            [FromServices] IUpdateSizeCommand command
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
            [FromServices] IDeleteSizeCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
