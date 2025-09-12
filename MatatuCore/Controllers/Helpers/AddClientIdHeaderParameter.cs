using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
namespace MatatuCore.Controllers.Helpers
{
    public class AddClientIdHeaderParameter : IOperationFilter
    {
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            if (operation.Parameters == null)
                operation.Parameters = new List<OpenApiParameter>();

            operation.Parameters.Add(new OpenApiParameter
            {
                Name = "X-Client-Identifier",
                In = ParameterLocation.Header,
                Required = true, // or false depending on your needs
                Schema = new OpenApiSchema
                {
                    Type = "string"
                },
                Description = "Client Identifier header"
            });
        }
    }
}
