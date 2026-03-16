/* 
 *Level-1 Problem 1: Bank Account Management System
Scenario:
A bank wants to develop a simple console-based application to manage customer bank accounts. The system should protect account balance information and allow controlled access using properties.
Requirements:
1. Create a BankAccount class with private fields for account number and balance.
2. Use properties to allow controlled access to account number and balance.
3. Implement Deposit and Withdraw methods with proper validation.
4. Prevent withdrawal if balance is insufficient.
Technical Constraints:
• Use private fields with public properties.
• Apply encapsulation and data hiding.
• No direct access to balance field from outside the class.
Expectations:
• Demonstrate correct use of access modifiers.
• Validate negative deposit or withdrawal amounts.
• Display updated balance after each transaction.
Learning Outcome:
• Understand encapsulation using properties.
• Apply data hiding effectively.
• Implement validation logic inside class methods.
Sample Input: 
Deposit = 5000, Withdraw = 2000
Sample Output: 
Current Balance = 3000

*/

using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1
{
    internal class BankAccount
    {
        private int _accountNumber;
        private decimal _balance;


        public int BankAccountNumber
        {
            get { return _accountNumber; }
            set { _accountNumber = value; }
        }

        public decimal Balance
        {
            get { return _balance; }  
        }

        public void Deposit(decimal amount) 
        {
            if (amount < 0)
            {
                throw new ArgumentOutOfRangeException("Invalid Amount");
            }
            else
            {
                _balance += amount;
                Console.WriteLine("Money Credited Succesfully");
                Console.WriteLine($"Total Available Balance is Rs.{_balance.ToString("F2")}");
            }

        }

        public void Withdraw(decimal amount)
        {
            if (amount <= 0)
            {
                throw new ArgumentOutOfRangeException("Invalid Amount");
            }
            else if (amount > _balance)
            {
                throw new ArgumentException("Invalid Balance");
            }
            else
            {
                _balance -= amount;
                Console.WriteLine("Money Debited Succesfully");
                Console.WriteLine($"Total Available Balance is Rs.{_balance.ToString("F2")}");
            }
        }

    }
}
