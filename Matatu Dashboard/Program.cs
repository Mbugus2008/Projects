using Matatu_Dashboard.Services;
using Microsoft.AspNetCore.StaticFiles;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddMemoryCache();
builder.Services.AddControllersWithViews();
builder.Services.Configure<BusinessCentralDashboardOptions>(builder.Configuration.GetSection("BusinessCentral"));
builder.Services.AddScoped<BusinessCentralDashboardService>();
builder.Services.AddHostedService<ShareDashboardWarmService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

// Serve raw files (e.g. APK downloads) from wwwroot with correct MIME type
var staticProvider = new FileExtensionContentTypeProvider();
staticProvider.Mappings[".apk"] = "application/vnd.android.package-archive";
app.UseStaticFiles(new StaticFileOptions { ContentTypeProvider = staticProvider });

app.MapStaticAssets();

app.MapControllerRoute(
    name: "share-root",
    pattern: "",
    defaults: new { controller = "Home", action = "Share" });

app.MapControllerRoute(
    name: "share-root-range",
    pattern: "{range:regex(^(today|yesterday|week|month)$)}",
    defaults: new { controller = "Home", action = "Share" });

app.MapControllerRoute(
    name: "share",
    pattern: "d/{range?}",
    defaults: new { controller = "Home", action = "Share" });

app.MapControllerRoute(
    name: "fuel",
    pattern: "fuel/{range?}",
    defaults: new { controller = "Home", action = "Fuel" });

app.MapControllerRoute(
    name: "fuelsummary",
    pattern: "fuelsummary/{range?}",
    defaults: new { controller = "Home", action = "FuelSummary" });

app.MapControllerRoute(
    name: "dispatchsummary",
    pattern: "dispatchsummary/{range?}",
    defaults: new { controller = "Home", action = "DispatchSummary" });

app.MapControllerRoute(
    name: "admin",
    pattern: "admin/{action=Index}/{id?}",
    defaults: new { controller = "Home" });

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
