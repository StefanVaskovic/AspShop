using Application;
using Domain;
using EfDataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Loggers
{
    public class DatabaseUseCaseLogger : IUseCaseLogger
    {
        private readonly ShopContext _context;

        public DatabaseUseCaseLogger(ShopContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            if(actor.Id != 0)
            {
                _context.AuditLogs.Add(new AuditLog
                {
                    UseCaseId = useCase.Id,
                    UserId = actor.Id,
                    ExecutedAt = DateTime.UtcNow,
                    Data = JsonConvert.SerializeObject(useCaseData)
                });

                _context.SaveChanges();
            }
            
        }
    }
}
