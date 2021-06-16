using Application.DataTransfer.Cart;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface IUpdateCartCommand : ICommand<CartDto>
    {
    }
}
