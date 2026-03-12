using System.ComponentModel;

namespace ConsoleApp1
{
    class Student
    {

        public int CalculateAverage(int m1, int m2, int m3)
        {
            double average = m1 + m2 + m3 / 3;
            return average;
        }

    }

    internal class Program
    {
        static void Main(string[] args)
        {
            Student s = new Student();

            int x,y, z;
            string grade;

            Console.WriteLine("Enter Subject 1 Marks:");
            if (!int.TryParse(Console.ReadLine(), out x))
            {
                Console.WriteLine("Invalid Type");
            }

            Console.WriteLine("Enter Subject 2 Marks:");
            int.TryParse(Console.ReadLine(), out y);

            Console.WriteLine("Enter Subject 3 Marks:");
            int.TryParse(Console.ReadLine(), out z);

            int result = s.CalculateAverage(x, y, z);

            Console.WriteLine("Average is:" + result);
            if (result >= 0 && result <= 100)
            {
                if (result >= 80)
                {
                    grade = 'A';
                }
                else if (result >= 60 && result <= 79)
                {
                    grade = 'B';
                }
                else if (result >= 40 && result <= 59)
                {
                    grade = 'C';
                }
                else
                {
                    grade = 'Fail';
                }
            }
            else
            {
                Console.WriteLine("Invalid Average");
            }

            Console.WriteLine("Grade" + grade);
            Console.ReadLine();
        }
    }
}
