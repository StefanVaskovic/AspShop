using Application.DataTransfer.User;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetUsersQuery : IQuery<SearchUsersDto, ICollection<UserDto>>
    {
    }
}
