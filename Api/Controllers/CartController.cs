using Application;
using Application.Commands;
using Application.DataTransfer.Cart;
using Application.DataTransfer.Order;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using Domain;
using EfDataAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
    public class CartController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CartController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<CartController>
        [HttpGet]
        public IActionResult Get(
            [FromServices] IGetCartQuery query,
            [FromQuery] SearchCartDto search
            )
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // POST api/<CartController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] ICollection<CartDto> dtos,
            [FromServices] IAddToCartCommand command
            )
        {
            _executor.ExecuteCommand(command, dtos);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<CartController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id, 
            [FromBody] CartDto dto,
            [FromServices] IUpdateCartCommand command
            )
        {

            dto.Id = id;

            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<CartController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(
            int id,
            [FromServices] IDeleteCartCommand command)
        {
            
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        [HttpGet("orders") ]
        public IActionResult GetOrders(
            [FromQuery] SearchOrdersDto dto,
            [FromServices] IGetOrdersQuery query)
        {

            return Ok(_executor.ExecuteQuery(query, dto));
        }

        [HttpGet("orders/{id}")]
        public IActionResult GetOrderLines(
            int id,
            [FromQuery] SearchOrderLinesDto search,
            [FromServices] IGetOrderLinesQuery query
            )
        {
            var getOrderLinesDto = new GetOrderLinesDto();
            getOrderLinesDto.SearchOrderLinesDto = search;
            getOrderLinesDto.OrderId = id;

            return Ok(_executor.ExecuteQuery(query, getOrderLinesDto));
        }


        [HttpPost("orders")]
        public IActionResult PostOrder(
            [FromBody] RequestOrderDto requestDto,
            [FromServices] IGetCartQuery query,
            [FromServices] IAddOrderCommand command
            )
        {

            var dtos = (this.Get(query, null) as ObjectResult).Value as ICollection<GetCartDto>;

            if(!dtos.Any())
            {
                return BadRequest("You cart is empty!");
            }

            var orderDto = new CreateOrderDto
            {
                GetCartDtos = dtos,
                RequestOrderDto = requestDto
            };

            _executor.ExecuteCommand(command, orderDto);

            return StatusCode(StatusCodes.Status201Created);
        }
    }
}
