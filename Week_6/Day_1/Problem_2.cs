namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Product Name:");
            string Name = Console.ReadLine();

            Console.WriteLine("Enter Product Price:");
            int Price = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter Discount Percentage");
            if (!int.TryParse(Console.ReadLine(), out int discount) || discount < 0 || discount > 100)
            {
                Console.WriteLine("Discount must be between 0 and 100!");
                return;
            }


            try
            {
                var result = Price - (Price * Discount) / 100;
                Console.WriteLine("FinalPrice: " + result);
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("Cannot Divide By Zero");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error :" + ex.Message);
            }
        }
        
    }
}
