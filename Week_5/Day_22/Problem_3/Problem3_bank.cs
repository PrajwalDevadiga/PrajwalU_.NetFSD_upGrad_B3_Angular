using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp2
{
    class BankAccount 
    {
        private double _balance;

        public double Balance
        {
            get { return _balance; }
        }

        public BankAccount(double balance)
        {
            _balance = balance;
        }

        public void Withdraw(double amount)
        {
            if (amount > Balance)
            {
                throw new ArgumentException("Withrawal amount is more than balance");
            }

            _balance -= amount;
            Console.WriteLine("Remaining Balance: " + Balance);
        }
    }
}
