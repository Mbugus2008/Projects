using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Client_Service.Controllers
{
    public class LogRequestAndResponseHandler : DelegatingHandler
    {
        protected override async Task<HttpResponseMessage> SendAsync(
            HttpRequestMessage request, CancellationToken cancellationToken)
        {
            if (request.Content != null)
            {
                // log request body
                string requestBody = await request.Content.ReadAsStringAsync();
             Logging.Logging.LogEntryOnFile(string.Format("Request {0} {1} {2}",System.DateTime.Now,request.RequestUri,requestBody));
            }
            // let other handlers process the request
            var result = await base.SendAsync(request, cancellationToken);

            if (result.Content != null)
            {
                // once response body is ready, log it
                var responseBody = await result.Content.ReadAsStringAsync();
                Logging.Logging.LogEntryOnFile(string.Format("Response {0} \n {1}\n", System.DateTime.Now, responseBody));
                //Trace.WriteLine(responseBody);
            }

            return result;
        }
    }
}
