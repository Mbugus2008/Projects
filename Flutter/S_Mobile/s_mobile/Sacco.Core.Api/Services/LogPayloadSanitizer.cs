using System.Text.Json;
using System.Text.Json.Nodes;

namespace Sacco.Core.Api.Services;

public static class LogPayloadSanitizer
{
    private static readonly HashSet<string> SensitiveKeys = new(StringComparer.OrdinalIgnoreCase)
    {
        "pin",
        "password",
        "start pin",
        "pin_encrypted",
        "pinencrypted",
        "token",
        "authorization",
    };

    public static string ForLog(string? payload, int maxLength = 2000)
    {
        if (string.IsNullOrWhiteSpace(payload))
        {
            return "<empty>";
        }

        try
        {
            var node = JsonNode.Parse(payload);
            if (node is not null)
            {
                RedactInPlace(node);
                return Truncate(node.ToJsonString(), maxLength);
            }
        }
        catch (JsonException)
        {
            // Not JSON; log as plain text with truncation.
        }

        if (IsLikelyBinary(payload))
        {
            return $"<binary payload omitted; length={payload.Length}>";
        }

        return Truncate(payload, maxLength);
    }

    private static void RedactInPlace(JsonNode node)
    {
        if (node is JsonObject obj)
        {
            foreach (var kvp in obj.ToList())
            {
                if (kvp.Value is null)
                {
                    continue;
                }

                if (SensitiveKeys.Contains(kvp.Key))
                {
                    obj[kvp.Key] = "***";
                    continue;
                }

                RedactInPlace(kvp.Value);
            }

            return;
        }

        if (node is JsonArray arr)
        {
            foreach (var item in arr)
            {
                if (item is not null)
                {
                    RedactInPlace(item);
                }
            }
        }
    }

    private static string Truncate(string value, int maxLength)
    {
        if (value.Length <= maxLength)
        {
            return value;
        }

        return value[..maxLength] + "...<truncated>";
    }

    private static bool IsLikelyBinary(string value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return false;
        }

        var replacementCharCount = 0;
        var controlCount = 0;

        foreach (var c in value)
        {
            if (c == '\uFFFD')
            {
                replacementCharCount++;
            }

            if (char.IsControl(c) && c != '\r' && c != '\n' && c != '\t')
            {
                controlCount++;
            }
        }

        return replacementCharCount > 5 || controlCount > Math.Max(5, value.Length / 50);
    }
}