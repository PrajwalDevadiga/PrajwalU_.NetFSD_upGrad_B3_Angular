
using System.Threading.Tasks;  
namespace ConsoleApp1
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine("Application Started");

            var log1 = Task.Run(() => VerifyPaymentAsync());
            var log2 = Task.Run(() => CheckInventoryAsync());
            var log3 = Task.Run(() => ConfirmOrderAsync());

            Console.WriteLine("Application Ended");

            await Task.WhenAll(log1, log2, log3);
            

            Console.WriteLine("All tasks are done");
        }

        public static async Task VerifyPaymentAsync()
        {
            Console.WriteLine("Started Verifying Payment");
            await Task.Delay(6000);
            Console.WriteLine("Completed Verifying Payment");
        }

        public static async Task CheckInventoryAsync()
        {
            Console.WriteLine("Started Inventory Checking");
            await Task.Delay(2000);
            Console.WriteLine("Completed Inventory Checking");
        }

        public static async Task ConfirmOrderAsync()
        {
            Console.WriteLine("Started Confirming Order");
            await Task.Delay(4000);
            Console.WriteLine("Completed Confirming Order");
        }
        
    }
}
