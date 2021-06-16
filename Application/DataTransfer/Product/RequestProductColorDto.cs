using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class RequestProductColorDto : Dto
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int ColorId { get; set; }
    }
}
