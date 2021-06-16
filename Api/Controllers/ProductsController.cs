using Api.Core.Maps;
using Application;
using Application.Commands;
using Application.DataTransfer.Color;
using Application.DataTransfer.Product;
using Application.DataTransfer.Size;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using Domain;
using EfDataAccess;
using Implementation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
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
    public class ProductsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly RequestCreateProductDtoMap _createProductDtoMapper;
        private readonly RequestUpdateProductDtoMap _updateProductDtoMapper;
        private readonly ShopContext _context;

        public ProductsController(UseCaseExecutor executor, RequestCreateProductDtoMap mapper, ShopContext context, RequestUpdateProductDtoMap updateProductDtoMapper)
        {
            _executor = executor;
            _createProductDtoMapper = mapper;
            _context = context;
            _updateProductDtoMapper = updateProductDtoMapper;
        }

        // GET: api/<ProductsController>
        [HttpGet]
        public IActionResult Get(
                [FromQuery] SearchProductsDto dto,
                [FromServices] IGetProductsQuery query
            )
        {
            return Ok(_executor.ExecuteQuery(query, dto));
        }

        // GET api/<ProductsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(
            int id,
            [FromServices] IGetProductQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<ProductsController>
        [HttpPost]
        public IActionResult Post(
            [FromForm] RequestCreateProductDto dto,
            [FromServices] ICreateProductCommand command
            )
        {
            CreateProductDto createProductDto = _createProductDtoMapper.Map(dto);
            _executor.ExecuteCommand(command, createProductDto);
            return StatusCode(StatusCodes.Status201Created);
        }
        
        // PUT api/<ProductsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(
            int id,
            [FromForm] RequestUpdateProductDto dto,
            [FromServices] IUpdateProductCommand command
            )
        {
            var product = _context.Products.Find(id);

            if (product == null)
                throw new EntityNotFoundException(id, typeof(Product));

            UpdateProductDto updateProductDto = _updateProductDtoMapper.Map(dto);
            updateProductDto.Id = id;

            //product.AsCreateProductDto();

            _executor.ExecuteCommand(command, updateProductDto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        [HttpPut("colors/{id}")]
        public IActionResult Put(
            int id,
            [FromBody] RequestProductColorDto dto,
            [FromServices] IUpdateProductColorCommand command
            )
        {
            var productColor = _context.ProductColors.Find(dto.Id);

            if (productColor == null)
                throw new EntityNotFoundException(dto.Id, typeof(ProductColor));

            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE api/<ProductsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(
            int id,
            [FromServices] IDeleteProductCommand command
            )
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
