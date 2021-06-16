using Application.DataTransfer.Cart;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface IAddToCartCommand : ICommand<ICollection<CartDto>>
    {
    }
}
