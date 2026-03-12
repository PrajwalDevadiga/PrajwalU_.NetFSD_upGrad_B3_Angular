using System.ComponentModel;

namespace ConsoleApp1
{
    class Calculator
    {

        public int Add(int a, int b ) 
        { 
            return a + b;
        }

        public int Subtract(int a, int b ) {
            return a - b;
        }

    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Calculator c = new Calculator();

            int x, y;

            Console.WriteLine("Enter First Number:");
            int.TryParse(Console.ReadLine(), out x);

            Console.WriteLine("Enter Second Number:");
            int.TryParse(Console.ReadLine(), out y);

            int result1 = c.Add(x, y);
            int resuult2 = c.Subtract(x, y);



            Console.WriteLine("Addition is: " + result1);
            Console.WriteLine("Subtraction is: " + resuult2);
        }
    }
}
