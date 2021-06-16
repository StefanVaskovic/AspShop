using Application.DataTransfer.User;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IRegisterUserCommand : ICommand<RegisterUserDto>
    {
    }
}
