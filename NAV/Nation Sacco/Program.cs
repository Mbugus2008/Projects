
using Microsoft.AspNetCore.Diagnostics;

using Microsoft.OpenApi.Models; // Add this using directive for OpenAPI/Swagger support
using Microsoft.AspNetCore.Authentication.JwtBearer; // Add this using directive for JWT Bearer authentication
using Microsoft.IdentityModel.Tokens; // Add this using directive for TokenValidationParameters
using Serilog; // Add this using directive for Serilog


using System.Text;
using System.Text.Json;
using Serilog.Events;
var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy =>
        {
            policy.AllowAnyOrigin()
                  .AllowAnyMethod()
                  .AllowAnyHeader();
        });
});
builder.Services.AddSwaggerGen(options =>
{
    // Add Bearer token authorization
    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "Enter 'Bearer' [space] and then your token.",
    });
  


    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {

        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = builder.Configuration["JwtSettings:Issuer"],// "YourIssuer", // Replace with your issuer
        ValidAudience = builder.Configuration["JwtSettings:Audience"],// "YourAudience", // Replace with your audience
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["JwtSettings:SecretKey"])) // Replace with your secret key
    };
});

var logFilePath = System.IO.Path.Combine(AppContext.BaseDirectory, "logs", ".log");
builder.Services.AddAuthorization();
Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Debug() // Set the minimum log level
    .MinimumLevel.Override("Microsoft", LogEventLevel.Information) // Override for Microsoft logs
    .Enrich.FromLogContext() // Enrich logs with contextual information
    .WriteTo.Console() // Log to the console
    .WriteTo.File(logFilePath, rollingInterval: RollingInterval.Day) // Log to a file
    .CreateLogger();

builder.Host.UseSerilog();

var app = builder.Build();
app.UseStaticFiles();
// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment() || app.Environment.IsProduction())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
        c.RoutePrefix = "swagger"; // Sets the URL path
        c.ConfigObject.DisplayRequestDuration = true;
    });
    app.UseExceptionHandler("/error");
}

app.UseHttpsRedirection();
app.UseMiddleware<RequestResponseLoggingMiddleware>();
app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
