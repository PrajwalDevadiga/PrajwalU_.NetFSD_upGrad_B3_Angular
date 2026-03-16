namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BankAccount account = new BankAccount();
            account.BankAccountNumber = 101;

            account.Deposit(5000);
            account.Withdraw(2000);
        }
    }
}
