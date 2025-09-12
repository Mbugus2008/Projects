namespace S_Mobile.Models
{
    public interface Ismsrepository
    {
        Logging.Results sendsms(ref BulkSm sms);
    }
}