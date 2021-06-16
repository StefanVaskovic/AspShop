using Application;
using Application.Commands;
using Application.DataTransfer.Categories;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using Domain;
using EfDataAccess;
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
    public class CategoriesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CategoriesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<CategoriesController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchCategoriesDto dto,
                [FromServices] IGetCategoriesQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // GET api/<CategoriesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(
            int id,
            [FromServices] IGetCategoryQuery getter
            )
        {
            return Ok(_executor.ExecuteQuery(getter, id));
        }

        // POST api/<CategoriesController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] RequestCreateCategoryDto dto,
            [FromServices] ICreateCategoryCommand command
            )
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<CategoriesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id, 
            [FromBody] CategoryDto dto,
            [FromServices] IUpdateCategoryCommand command
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
            [FromServices] IDeleteCategoryCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(204);
        }
    }
}
