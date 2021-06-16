using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class User : Entity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public virtual ICollection<UserUseCase> UserUseCases { get; set; } = new HashSet<UserUseCase>();
        public virtual ICollection<Order> Orders { get; set; } = new HashSet<Order>();
        //public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<Cart> Carts { get; set; } = new HashSet<Cart>();
        //public virtual ICollection<LikedComment> LikedComments { get; set; } = new HashSet<LikedComment>();
    }
}
