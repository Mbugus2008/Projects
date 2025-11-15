using System;
using System.IO;

namespace S_Mobile.Logs
{
    public class Logger
    {
        private static string _baseLogPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Logs");
        private string _currentLogPath;

        /// <summary>
        /// Gets or sets the base log path for all logger instances
        /// </summary>
        public static string BaseLogPath
        {
            get { return _baseLogPath; }
            set
            {
                _baseLogPath = value;
                EnsureDirectoryExists(_baseLogPath);
            }
        }

        /// <summary>
        /// Gets or sets the current log path for this logger instance
        /// </summary>
        public string CurrentLogPath
        {
            get { return _currentLogPath ?? _baseLogPath; }
            set
            {
                _currentLogPath = value;
                EnsureDirectoryExists(_currentLogPath);
            }
        }

        /// <summary>
        /// Creates a new logger instance with optional custom path
        /// </summary>
        /// <param name="customPath">Custom log path relative to base path or absolute path</param>
        public Logger(string customPath = null)
        {
            if (!string.IsNullOrEmpty(customPath))
            {
                // Check if it's an absolute path
                if (Path.IsPathRooted(customPath))
                {
                    _currentLogPath = customPath;
                }
                else
                {
                    // Treat as relative to base path
                    _currentLogPath = Path.Combine(_baseLogPath, customPath);
                }
                EnsureDirectoryExists(_currentLogPath);
            }
        }

        /// <summary>
        /// Logs an informational message
        /// </summary>
        public void LogInfo(string message)
        {
            WriteLog("INFO", message);
        }

        /// <summary>
        /// Logs an error message
        /// </summary>
        public void LogError(string message, Exception ex = null)
        {
            string errorMessage = message;
            if (ex != null)
            {
                errorMessage += $"\nException: {ex.Message}\nStackTrace: {ex.StackTrace}";
            }
            WriteLog("ERROR", errorMessage);
        }

        /// <summary>
        /// Logs a warning message
        /// </summary>
        public void LogWarning(string message)
        {
            WriteLog("WARNING", message);
        }

        /// <summary>
        /// Logs a debug message
        /// </summary>
        public void LogDebug(string message)
        {
            WriteLog("DEBUG", message);
        }

        /// <summary>
        /// Writes the log entry to file
        /// </summary>
        private void WriteLog(string level, string message)
        {
            try
            {
                string logPath = CurrentLogPath;
                string fileName = $"Log_{DateTime.Now:yyyyMMdd}.txt";
                string filePath = Path.Combine(logPath, fileName);

                string logEntry = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [{level}] {message}\n";

                File.AppendAllText(filePath, logEntry);
            }
            catch (Exception ex)
            {
                // Fallback logging to event log or console if file logging fails
                Console.WriteLine($"Failed to write to log file: {ex.Message}");
            }
        }

        /// <summary>
        /// Ensures the directory exists
        /// </summary>
        private static void EnsureDirectoryExists(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }

        /// <summary>
        /// Creates a logger for a specific controller
        /// </summary>
        /// <param name="controllerName">Name of the controller</param>
        /// <returns>Logger instance configured for the controller</returns>
        public static Logger ForController(string controllerName)
        {
            return new Logger(Path.Combine("Controllers", controllerName));
        }
    }
}
