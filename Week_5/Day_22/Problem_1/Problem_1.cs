using static System.Net.Mime.MediaTypeNames;

namespace ConsoleApp1
{
    internal class Program
    {
        public record Student(int RollNumber, string Name, string Course, int Marks);
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Number of Students");

            int n = int.Parse(Console.ReadLine());

            Student[] arr = new Student[n];

            Console.WriteLine("Enter Student Details");

            for (int i = 0; i < arr.Length; i++)
            {

                Console.WriteLine("Roll Number: ");
                int roll = int.Parse(Console.ReadLine());

                Console.WriteLine("Name: ");
                string name = Console.ReadLine();

                Console.WriteLine("Course: ");
                string course = Console.ReadLine();

                Console.WriteLine("Marks: ");
                int marks = int.Parse(Console.ReadLine());

                Console.WriteLine();

                arr[i] = new Student(roll, name, course, marks);
            }

            Console.WriteLine("Student Details");
            foreach (var i in arr)
            {
                Console.WriteLine($"Roll No: {i.RollNumber} | Name: {i.Name} | Course: {i.Course} | Marks: {i.Marks}");
            }

                Console.WriteLine("Enter roll number to Search");
                int search = int.Parse(Console.ReadLine());

                bool flag = false;

                foreach (var j in arr)
                {
                    if (j.RollNumber == search)
                    {
                        Console.WriteLine("Student Found:");
                        Console.WriteLine($"Roll No: {j.RollNumber} | Name: {j.Name} | Course: {j.Course} | Marks: {j.Marks}");
                        flag = true;
                        break;
                    }
                }
                if (flag == false)
                {
                    Console.WriteLine("Details Not Found.");
                }
            }
        }
}
