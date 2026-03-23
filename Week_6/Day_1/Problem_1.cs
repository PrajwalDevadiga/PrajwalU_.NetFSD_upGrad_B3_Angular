namespace ConsoleApp1
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Application Started");
            var log1 = WriteLogAsync("User Logging In");
            var log2 = WriteLogAsync("Uploading files");
            var log3 = WriteLogAsync("Files Uploaded");

            await Task.WhenAll(log1, log2, log3);
            Console.WriteLine("Application Ended");

            Console.WriteLine("All logs Stored");
        }

        public static async Task WriteLogAsync(string message)
        {
            Console.WriteLine($"writing logs: { message}");
            
            await Task.Delay(5000);

            Console.WriteLine($"Finished logs: {message} ");
        }
    }
}
