using Application.DataTransfer.User;
using Application.Queries;
using Application.Searches;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetUsersQuery : UseCaseBase, IGetUsersQuery
    {
        public GetUsersQuery(ShopContext context) : base(context)
        {
        }

        public int Id => 30;

        public string Name => "Get users using EF";

        public ICollection<UserDto> Execute(SearchUsersDto request)
        {
            return _context.Users.Select(u => new UserDto
            {
                Id = u.Id,
                FirstName = u.FirstName,
                LastName = u.LastName,
                Email = u.Email,
                UseCaseIds = u.UserUseCases.Select(uuc => uuc.UseCaseId).ToList()
            }).ToList();
        }
    }
}
