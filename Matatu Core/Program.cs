var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Configuration.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
var configuration = builder.Configuration;
builder.Services.AddSingleton(configuration);
var app = builder.Build();

builder.Services.AddLogging(builder =>
{
    builder.AddConsole(); // Add console logging
    builder.AddDebug();   // Add debug window logging
    
});


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


builder.Services.ConfigureSwaggerGen(options =>{options.CustomSchemaIds(x=>x.FullName);});
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
