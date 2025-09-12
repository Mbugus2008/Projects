
namespace Eproc.Services
{
    public interface Ibids
    {
        Task<List<ReleasedBids.EProcReleasedBids>> GetReleasedBids(); 
        Task<List<AppliedBids.EProcAppliedBids>> GetappliedBids(string taxno);
 Task  Bidsubmision(string taxRegNo, string bidNo, string categoryCode);

    }
}