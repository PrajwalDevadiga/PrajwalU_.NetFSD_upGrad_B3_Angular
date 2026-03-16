namespace ConsoleApp3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            double electronics = 20000;

            double clothes = 30000;

            Product e = new Electronics();
            e.Name = "TV";
            e.Price = electronics;

            Product c = new Clothing();
            c.Name = "Shirt";
            e.Price = clothes;



            Console.WriteLine("Product is " + e.Name);
            Console.WriteLine("Final Price after 5% discount = " + e.CalculateDiscount());

            Console.WriteLine("Cloth is " + c.Name);
            Console.WriteLine("Final Price after 15% discount = " + c.CalculateDiscount());

        }
    }
}
