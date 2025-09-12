

namespace Eproc.Services
{
    public interface IFilesManager
    {
        Task<bool> UploadFileChunk(FileChunkDto fileChunkDto);
        Task<List<string>> GetFileNames();
    }
}
