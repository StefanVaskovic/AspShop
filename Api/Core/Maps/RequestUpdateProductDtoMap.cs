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
    public class RequestUpdateProductDtoMap : IMap<UpdateProductDto, RequestUpdateProductDto>
    {
        private readonly IMapper _mapper;

        public RequestUpdateProductDtoMap(IMapper mapper)
        {
            _mapper = mapper;
        }

        public UpdateProductDto Map(RequestUpdateProductDto dto)
        {
            var updateProductDto = _mapper.Map<UpdateProductDto>(dto);

            foreach (var item in dto.ProductColorSizes)
            {
                var obj = JsonConvert.DeserializeObject<ProductColorSizesDto>(item);
                updateProductDto.ProductColorSizes.Add(obj);
            }

            return updateProductDto;
        }
    }
}
