// Decodes SHA-256-hashed MSISDNs in M-Pesa receiver logs (S_Mobile Wrapper / trimline.co.ke:4001).
// The feed logs `"MSISDN": "<64-hex>"` where the hex is SHA-256 of the plain number in 254XXXXXXXXX format.
// Brute-forces the whole 254 + 9-digit Kenyan space and writes:
//   <log>-decoded.csv      one row per transaction with the decoded phone
//   <log>-msisdn-map.txt   phone <-> hash mapping
using System.Collections.Concurrent;
using System.Diagnostics;
using System.Security.Cryptography;

var input = args.Length > 0 ? args[0] : @"c:\Users\mbugu\OneDrive\Desktop\2026927.txt";
var outCsv = Path.ChangeExtension(input, null) + "-decoded.csv";
var outMap = Path.ChangeExtension(input, null) + "-msisdn-map.txt";

// ── 1. Collect target hashes from the log ──────────────────────────────
var targets = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
foreach (var line in File.ReadLines(input))
{
    var i = line.IndexOf("\"MSISDN\": \"", StringComparison.Ordinal);
    if (i < 0 || line.Length < i + 11 + 64) continue;
    var hex = line.Substring(i + 11, 64);
    var ok = true;
    foreach (var c in hex) if (!Uri.IsHexDigit(c)) { ok = false; break; }
    if (ok) targets.Add(hex);
}
Console.WriteLine($"Target MSISDNs: {targets.Count}");

// ── 2. Lookup by first 8 bytes (fast path) ─────────────────────────────
var lookup = new Dictionary<ulong, (byte[] full, string hex)>();
foreach (var hex in targets)
{
    var b = Convert.FromHexString(hex);
    lookup[BitConverter.ToUInt64(b, 0)] = (b, hex);
}

// ── 3. Brute force all 254XXXXXXXXX numbers (1000 chunks of 1M) ────────
var found = new ConcurrentDictionary<string, string>(StringComparer.OrdinalIgnoreCase);
if (File.Exists(outMap))
{
    foreach (var l in File.ReadLines(outMap))
    {
        var sp = l.IndexOf(' ');
        if (sp > 0) found[l.Substring(sp + 1).Trim()] = l.Substring(0, sp).Trim();
    }
    Console.WriteLine($"Loaded {found.Count} cached mappings from {outMap}");
}
var sw = Stopwatch.StartNew();
if (found.Count == 0)
{
long doneChunks = 0;
Parallel.For(0, 1000,
    new ParallelOptions { MaxDegreeOfParallelism = Environment.ProcessorCount },
    chunk =>
    {
        Span<byte> buf = stackalloc byte[12];
        Span<byte> dest = stackalloc byte[32];
        long lo = (long)chunk * 1_000_000L;
        var digits = (lo).ToString("D9").ToCharArray();
        for (long n = lo; n < lo + 1_000_000L; n++)
        {
            buf[0] = (byte)'2'; buf[1] = (byte)'5'; buf[2] = (byte)'4';
            for (int k = 0; k < 9; k++) buf[3 + k] = (byte)digits[k];
            SHA256.HashData(buf, dest);
            var key = BitConverter.ToUInt64(dest);
            if (lookup.TryGetValue(key, out var t) && dest.SequenceEqual(t.full))
                found[t.hex] = "254" + new string(digits);
            for (int k = 8; k >= 0; k--)
            {
                if (digits[k] == '9') digits[k] = '0';
                else { digits[k]++; break; }
            }
        }
        var c = Interlocked.Increment(ref doneChunks);
        if (c % 100 == 0)
            Console.WriteLine($"  {c}/1000 chunks, decoded {found.Count}, {sw.Elapsed.TotalSeconds:F0}s");
    });
Console.WriteLine($"Decoded {found.Count} of {targets.Count} in {sw.Elapsed.TotalSeconds:F1}s");
}

// ── 4. Write mapping file ──────────────────────────────────────────────
using (var m = new StreamWriter(outMap))
    foreach (var kv in found.OrderBy(k => k.Value, StringComparer.Ordinal))
        m.WriteLine($"{kv.Value} {kv.Key}");

// ── 5. Write decoded CSV of every transaction ──────────────────────────
static bool TryField(string line, string name, out string value)
{
    value = null;
    var key = "\"" + name + "\": \"";
    var i = line.IndexOf(key, StringComparison.Ordinal);
    if (i < 0) return false;
    var s = i + key.Length;
    var e = line.IndexOf('"', s);
    if (e < 0) return false;
    value = line.Substring(s, e - s);
    return true;
}

var map = new Dictionary<string, string>(found, StringComparer.OrdinalIgnoreCase);
using (var w = new StreamWriter(outCsv))
{
    w.WriteLine("TransID,TransTime,TransAmount,BusinessShortCode,BillRefNumber,FirstName,Phone");
    string f1 = null, f2 = null, f3 = null, f4 = null, f5 = null;
    string pendingPhone = null;
    int rows = 0, unmapped = 0;
    foreach (var line in File.ReadLines(input))
    {
        if (TryField(line, "TransID", out var v1))
        {
            // Fallback flush if a record had no FirstName line
            if (pendingPhone != null)
            {
                w.WriteLine($"{f1},{f2},{f3},{f4},\"{(f5 ?? "").Trim()}\",\"\",{pendingPhone}");
                rows++; pendingPhone = null; f1 = f2 = f3 = f4 = f5 = null;
            }
            f1 = v1;
        }
        else if (TryField(line, "TransTime", out var v2)) f2 = v2;
        else if (TryField(line, "TransAmount", out var v3)) f3 = v3;
        else if (TryField(line, "BusinessShortCode", out var v4)) f4 = v4;
        else if (TryField(line, "BillRefNumber", out var v5)) f5 = v5;
        else if (TryField(line, "MSISDN", out var vh) && vh.Length == 64)
        {
            map.TryGetValue(vh, out var phone);
            if (phone == null) unmapped++;
            pendingPhone = phone ?? "";
        }
        else if (TryField(line, "FirstName", out var v6) && pendingPhone != null)
        {
            w.WriteLine($"{f1},{f2},{f3},{f4},\"{(f5 ?? "").Trim()}\",\"{v6}\",{pendingPhone}");
            rows++; pendingPhone = null; f1 = f2 = f3 = f4 = f5 = null;
        }
    }
    Console.WriteLine($"Rows: {rows}, unmapped: {unmapped}");
}
Console.WriteLine($"CSV: {outCsv}");
Console.WriteLine($"Map: {outMap}");
