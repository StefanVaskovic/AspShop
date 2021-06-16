using Application;
using Application.DataTransfer.Product;
using AutoMapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Maps
{
    public class RequestCreateProductDtoMap : IMap<CreateProductDto, RequestCreateProductDto>
    {
        private readonly IMapper _mapper;

        public RequestCreateProductDtoMap(IMapper mapper)
        {
            _mapper = mapper;
        }

        public CreateProductDto Map(RequestCreateProductDto dto)
        {
            var createProductDto = _mapper.Map<CreateProductDto>(dto);

            foreach (var item in dto.SizesColorsQuantities)
            {
                var obj = JsonConvert.DeserializeObject<SizeColorsQuantitiesDto>(item);
                createProductDto.SizesColorsQuantities.Add(obj);
            }

            return createProductDto;
        }
    }
}
