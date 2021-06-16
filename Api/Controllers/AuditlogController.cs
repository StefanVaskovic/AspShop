using Application;
using Application.Searches;
using EfDataAccess;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuditlogController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AuditlogController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        // GET: api/<AuditlogController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchLogsDto dto,
                [FromServices] IGetLogsQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

    }
}
