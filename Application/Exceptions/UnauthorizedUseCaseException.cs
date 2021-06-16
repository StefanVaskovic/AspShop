using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            :base($"Actor '{actor.Id} - {actor.Identity}' tried to execute command '{useCase.Name}'")
        {

        }
    }
}
