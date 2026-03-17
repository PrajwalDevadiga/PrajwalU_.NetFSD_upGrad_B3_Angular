namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {  
                BankAccount acc = new BankAccount(3000);
                acc.Withdraw(5000);
            }
            
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e.Message);
            }
            
            finally
            {
                Console.WriteLine("Transaction Finished");
            }

        }
    }
}
