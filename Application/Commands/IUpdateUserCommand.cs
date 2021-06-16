using Application.DataTransfer.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands
{
    public interface IUpdateUserCommand : ICommand<UserDto>
    {
    }
}
