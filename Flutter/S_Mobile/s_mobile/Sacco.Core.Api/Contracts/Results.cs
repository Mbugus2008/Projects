namespace Sacco.Core.Api.Contracts;

public sealed class Results<T>
{
    public int Code { get; set; }

    public string Desc { get; set; } = "Successful";

    public T? Contents { get; set; }

    public static Results<T> Success(T? contents, string desc = "Successful") =>
        new() { Code = 0, Desc = desc, Contents = contents };

    public static Results<T> Failure(string desc) =>
        new() { Code = -1, Desc = desc, Contents = default };
}