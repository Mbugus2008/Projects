namespace Matatu_Dashboard.Models;

public class BusinessCentralDashboardViewModel
{
    public DateTime RetrievedAt { get; set; }
    public string? ErrorMessage { get; set; }
    public string SelectedRange { get; set; } = "today";
    public List<DashboardSectionViewModel> Sections { get; set; } = [];
}

public class DashboardSectionViewModel
{
    public string Title { get; set; } = string.Empty;
    public string ServiceUrl { get; set; } = string.Empty;
    public string? FilterDescription { get; set; }
    public int TotalRecords { get; set; }
    public string? ErrorMessage { get; set; }
    public TransactionManagementViewModel? Management { get; set; }
    public List<DashboardMetricViewModel> Metrics { get; set; } = [];
    public List<DashboardChartViewModel> Charts { get; set; } = [];
    public List<DashboardHighlightViewModel> Highlights { get; set; } = [];
    public List<string> Columns { get; set; } = [];
    public List<Dictionary<string, string>> Rows { get; set; } = [];
}

public class DashboardMetricViewModel
{
    public string Label { get; set; } = string.Empty;
    public string Value { get; set; } = string.Empty;
    public string? Note { get; set; }
}

public class DashboardChartViewModel
{
    public string Id { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public string Type { get; set; } = "doughnut";
    public List<string> Labels { get; set; } = [];
    public List<int> Values { get; set; } = [];
}

public class DashboardHighlightViewModel
{
    public string Label { get; set; } = string.Empty;
    public string Title { get; set; } = string.Empty;
    public string Value { get; set; } = string.Empty;
}

public class TransactionManagementViewModel
{
    public List<DashboardMetricViewModel> Overview { get; set; } = [];
    public DashboardChartViewModel? CollectionsTrendChart { get; set; }
    public DashboardChartViewModel? TopMatatusChart { get; set; }
    public DashboardChartViewModel? AgentPerformanceChart { get; set; }
    public DashboardChartViewModel? TypeMixChart { get; set; }
    public List<ManagementRankingItemViewModel> TopMatatus { get; set; } = [];
    public List<ManagementRankingItemViewModel> BottomMatatus { get; set; } = [];
    public List<AgentPerformanceItemViewModel> AgentPerformance { get; set; } = [];
    public List<ManagementExceptionViewModel> Exceptions { get; set; } = [];
    public List<Dictionary<string, string>> RecentTransactions { get; set; } = [];
}

public class ManagementRankingItemViewModel
{
    public string Label { get; set; } = string.Empty;
    public string Value { get; set; } = string.Empty;
    public string Note { get; set; } = string.Empty;
}

public class AgentPerformanceItemViewModel
{
    public string Agent { get; set; } = string.Empty;
    public string TotalAmount { get; set; } = string.Empty;
    public string TransactionCount { get; set; } = string.Empty;
    public string AverageTicket { get; set; } = string.Empty;
}

public class ManagementExceptionViewModel
{
    public string Severity { get; set; } = "low";
    public string Title { get; set; } = string.Empty;
    public string Value { get; set; } = string.Empty;
    public string Detail { get; set; } = string.Empty;
}
