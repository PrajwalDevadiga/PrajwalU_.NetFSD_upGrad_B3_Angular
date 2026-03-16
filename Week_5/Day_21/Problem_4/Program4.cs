namespace ConsoleApp4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double carRent = 2000;
            int days = 3;

            Vehicle car = new Car();
            car.Brand = "Toyota";
            car.RentalPerDay = carRent;

            Console.WriteLine("Car Brand is " + car.Brand);
            Console.WriteLine("Total Rental " + car.CalculateRental(days));
        }
    }
}
