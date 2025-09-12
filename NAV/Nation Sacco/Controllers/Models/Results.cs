namespace Nation_Sacco.Controllers.Models
{
    public partial class Results<T>
    {
        /// <inheritdoc/>
        /// <summary>
        /// O = successfull
        /// -1 = Unsucessful
        /// </summary>
        public int result_code { set; get; } = 0;

        /// <inheritdoc/>
        /// <summary>
        /// Error Description if code is -1
        /// </summary>
        public string result_message { set; get; } = "Success";
        public T data { get; set; }
        public string Date_Time { get; set; } = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    }
    public partial class Results
    {
        /// <inheritdoc/>
        /// <summary>
        /// O = successfull
        /// -1 = Unsucessful
        /// </summary>
        public int result_code { set; get; } = 0;

        /// <inheritdoc/>
        /// <summary>
        /// Error Description if code is -1
        /// </summary>
        public string result_message { set; get; } = "Success";
        public object data { get; set; }
        public string Date_Time { get; set; } = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    }
}
