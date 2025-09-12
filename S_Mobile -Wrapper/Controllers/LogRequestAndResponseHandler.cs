using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace S_Mobile.Controllers
{
    public class LogRequestAndResponseHandler : DelegatingHandler
    {
        protected override async Task<HttpResponseMessage> SendAsync(
            HttpRequestMessage request, CancellationToken cancellationToken)
        {
            var headers = request.Headers;
            if (headers.Contains("X-Client-Identifier"))
            {
                WebApiApplication.client = headers.GetValues("X-Client-Identifier").FirstOrDefault();
                if (WebApiApplication.client != null)
                {
                    if (WebApiApplication.s2.nav.Count > 0)
                    {
                        WebApiApplication.currentclient = WebApiApplication.s2.nav.FirstOrDefault(o => o.Name == WebApiApplication.client);
                        if (WebApiApplication.currentclient != null)
                            Logging.Logging.logpath = WebApiApplication.currentclient.logpath;
                    }
                }
            }
            if (request.Content != null)
            {
                // log request body
                string requestBody = await request.Content.ReadAsStringAsync();
                Logging.Logging.LogEntryOnFile(string.Format("Request {0} {1}\n{2}", System.DateTime.Now, request.RequestUri, requestBody));
            }
            // let other handlers process the request
            var result = await base.SendAsync(request, cancellationToken);

            if (result.Content != null)
            {
                // once response body is ready, log it
                var responseBody = await result.Content.ReadAsStringAsync();
                Logging.Logging.LogEntryOnFile(string.Format("Response {0} {1}\n {2}\n", System.DateTime.Now, request.RequestUri, responseBody));
                //Trace.WriteLine(responseBody);
            }

            return result;
        }
    }
}