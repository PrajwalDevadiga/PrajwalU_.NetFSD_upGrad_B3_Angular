
using System.Threading.Tasks;  
namespace ConsoleApp1
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Application Started");

            var log1 = Task.Run(() => GenerateSalesReport());
            var log2 = Task.Run(() => GenerateInventoryReport());
            var log3 = Task.Run(() => GenerateCustomerReport());

            Console.WriteLine("Application Ended");

            await Task.WhenAll(log1, log2, log3);
            

            Console.WriteLine("All tasks are done");
        }

        public static async Task GenerateSalesReport() 
        {
            Console.WriteLine("Started Sales Report");
            await Task.Delay(2000);
            Console.WriteLine("Completed Sales Report");
        }

        public static async Task GenerateInventoryReport()
        {
            Console.WriteLine("Started Inventory Report");
            await Task.Delay(2000);
            Console.WriteLine("Completed Inventory Report");
        }

        public static async Task GenerateCustomerReport()
        {
            Console.WriteLine("Started Customer Report");
            await Task.Delay(2000);
            Console.WriteLine("Completed Customer Report");
        }
        
    }
}
