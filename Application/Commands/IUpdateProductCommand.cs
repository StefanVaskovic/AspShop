using Application.DataTransfer.Product;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface IUpdateProductCommand : ICommand<UpdateProductDto>
    {
    }
}
