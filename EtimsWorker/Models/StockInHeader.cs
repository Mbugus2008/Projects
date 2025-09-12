using System;
using System.Collections.Generic;

namespace EtimsWorker.Models;

public partial class StockInHeader
{
    public string? Pin { get; set; }

    public string? BranchId { get; set; }

    public int StoredReleasedNo { get; set; }

    public int? OriginalStoredReleasedNo { get; set; }

    public string? StockIoTypeCode { get; set; }

    public string? Remark { get; set; }

    public string? CreatedBy { get; set; }

    public bool? Sync { get; set; }
}
