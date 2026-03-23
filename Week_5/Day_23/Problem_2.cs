using System.Collections;
using System.ComponentModel.DataAnnotations;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace ConsoleApp1
{
    internal class Program
    {
        internal class Product
        {
            public int ProCode { get; set; }

            public string ProName { get; set; }

            public string ProCategory { get; set; }

            public double ProMrp { get; set; }

            public List<Product> GetProducts()
            {
                return new List<Product>
            {
                new Product{ProCode=1001,ProName="Colgate-100gm",ProCategory="FMCG",ProMrp=55 },
                 new Product{ProCode=1002,ProName="Colgate-50gm",ProCategory="FMCG",ProMrp=30 },
                 new Product{ProCode=1009,ProName="DaburRed-100gm",ProCategory="FMCG",ProMrp=50 },
                 new Product{ProCode=1006,ProName="DaburRed-50gm",ProCategory="FMCG",ProMrp=28 },
                 new Product{ProCode=1008,ProName="Himalaya Neem Face Wash",ProCategory="FMCG",ProMrp=70 },
                 new Product{ProCode=1007,ProName="Niviea Face Wash",ProCategory="FMCG",ProMrp=120 },
                 new Product{ProCode=1010,ProName="Daawat-Basmati",ProCategory="Grain",ProMrp=130 },
                  new Product{ProCode=1011,ProName="Delhi Gate-Basmati",ProCategory="Grain",ProMrp=120 },
                  new Product{ProCode=1014,ProName="Saffola-Oil",ProCategory="Edible-Oil",ProMrp=160 },
                   new Product{ProCode=1016,ProName="Fortune-Oil",ProCategory="Edible-Oil",ProMrp=150 },
                   new Product{ProCode=1018,ProName="Nescafe",ProCategory="FMCG",ProMrp=70 },
                   new Product{ProCode=1019,ProName="Bru",ProCategory="FMCG",ProMrp=90},
                    new Product{ProCode=1015,ProName="Parachut",ProCategory="Edible-Oil",ProMrp=60}
            };

            }
        }

        
        static void Main(string[] args)
        {
            Product product = new Product();
            List<Product> products = product.GetProducts();


            //1.Write a LINQ query to search and display all products with category “FMCG”.
            var res1 = products.Where(p => p.ProCategory == "FMCG");

            foreach(var p in res1)
            {
                Console.WriteLine(p.ProName);
            }

            //2.Write a LINQ query to search and display all products with category “Grain”.
            var res2 = products.Where(p => p.ProCategory == "Grain");

            foreach(var p in res2)
            {
                Console.WriteLine(p.ProName);
            }

            //3.Write a LINQ query to sort products in ascending order by product code.
            var res3 = products.OrderBy(p => p.ProCode);

            //4.Write a LINQ query to sort products in ascending order by product Category.
            var res4 = products.OrderBy(p => p.ProCategory);

            //5.Write a LINQ query to sort products in ascending order by product Mrp.
            var res5 = products.OrderBy(p => p.ProMrp);

            //6.Write a LINQ query to sort products in descending order by product Mrp.
            var res6 = products.OrderByDescending(p => p.ProMrp);

            //7.Write a LINQ query to display products group by product Category.
            var res7 = products.GroupBy(p => p.ProCategory);
            foreach (var p in res7)
            {
                Console.WriteLine("Category:" + p.Key);
                foreach (var p2 in p)
                {
                    Console.WriteLine(p2.ProName);
                }
            }

            //8.Write a LINQ query to display products group by product Mrp.
            var res8 = products.GroupBy(p => p.ProMrp);
            foreach (var p in res8)
            {
                Console.WriteLine("Price: " + p.Key);
                foreach(var p2 in p)
                {
                    Console.WriteLine(p2.ProName);
                }
            }

            //9.Write a LINQ query to display product detail with highest price in FMCG category.
            var res9 = products.Where(p => p.ProCategory == "FMCG").OrderByDescending(p => p.ProMrp).First();
            Console.WriteLine("9: " + res9.ProName + " - " + res9.ProMrp);

            //10.Write a LINQ query to display count of total products.
            var res10 = products.Count();
            Console.WriteLine("10: " + res10);

            //11.Write a LINQ query to display count of total products with category FMCG.
            var res11 = products.Count(p => p.ProCategory == "FMCG");
            Console.WriteLine("11: " + res11);

            //12.Write a LINQ query to display Max price.
            var res12 = products.Max(p => p.ProMrp);
            Console.WriteLine("12: " + res12);

            //13.Write a LINQ query to display Min price.
            var res13 = products.Min(p => p.ProMrp);
            Console.WriteLine("13: " + res13);

            //14.Write a LINQ query to display whether all products are below Mrp Rs.30 or not.
            var res14 = products.All(p => p.ProMrp < 30);
            Console.WriteLine("14: " + res14);

            //15.Write a LINQ query to display whether any products are below Mrp Rs.30 or not.
            var res15 = products.Any(p => p.ProMrp < 30);
            Console.WriteLine("15: " + res15);
               
        }

    }
}
