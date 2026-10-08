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

    // Deliberately NO UseHsts(): HSTS applies to the whole host, not just this port. Sending it
    // from the dashboard pinned every browser that opened it to HTTPS on services.trimline.co.ke,
    // which broke the plain-HTTP services on that machine (the :8093 binding itself, and the
    // Business Central OData endpoints on :9992/:9993) for 30 days with a redirect to an HTTP-only
    // port - the browser then fails with ERR_SSL_PROTOCOL_ERROR. The redirect below still sends
    // visitors to the HTTPS copy of this site.
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
    name: "loading",
    pattern: "loading/{range?}",
    defaults: new { controller = "Home", action = "Loading" });

app.MapControllerRoute(
    name: "loading-vehicles",
    pattern: "loading/vehicles/{range?}",
    defaults: new { controller = "Home", action = "LoadingVehicles" });

app.MapControllerRoute(
    name: "admin",
    pattern: "admin/{action=Index}/{id?}",
    defaults: new { controller = "Home" });

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
