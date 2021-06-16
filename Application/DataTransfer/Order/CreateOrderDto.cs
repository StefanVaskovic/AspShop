using Application.DataTransfer.Cart;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Order
{
    public class CreateOrderDto
    {
        public ICollection<GetCartDto> GetCartDtos { get; set; } = new List<GetCartDto>();
        public RequestOrderDto RequestOrderDto { get; set; }
    }
}
