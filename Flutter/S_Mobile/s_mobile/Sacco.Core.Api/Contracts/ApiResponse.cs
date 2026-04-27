namespace Sacco.Core.Api.Contracts;

public sealed class ApiResponse<T>
{
    public int Code { get; init; }
    public string Desc { get; init; } = string.Empty;
    public T? Contents { get; init; }

    public static ApiResponse<T> Success(T? contents, string desc = "Successful") =>
        new() { Code = 0, Desc = desc, Contents = contents };

    public static ApiResponse<T> Failure(string desc) =>
        new() { Code = -1, Desc = desc };
}
