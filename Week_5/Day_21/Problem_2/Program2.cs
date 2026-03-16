
namespace ConsoleApp2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double baseSalary = 50000;

            Employee manager = new Manager();
            manager.Name = "Abhay";
            manager.BaseSalary = baseSalary;

            Employee developer = new Developer();
            developer.Name = "Bhavan";
            developer.BaseSalary = baseSalary;

            Console.WriteLine("Manager Name is " + manager.Name);
            Console.WriteLine("Manager Salary is " + manager.CalculateSalary());
            ConsoleApp2.WriteLine("Developer Salary is " +  developer.Name);
            Console.WriteLine("Developer Salary is " + developer.CalculateSalary());
        }
    }
}
