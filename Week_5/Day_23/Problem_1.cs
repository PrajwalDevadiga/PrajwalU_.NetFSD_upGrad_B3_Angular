namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            List<string> tasks = new List<string>();
            bool flag = true;

            while (flag == true)
            {

                Console.WriteLine("To-Do List Manager:");
                Console.WriteLine("1.Add Task");
                Console.WriteLine("2.View Tasks");
                Console.WriteLine("3.Remove Tasks");
                Console.WriteLine("4.Exit");
                Console.WriteLine();

                Console.WriteLine("Choose an Option:");
                string select = Console.ReadLine();

                switch (select)
                {
                    case "1":
                        AddTasks(tasks);
                        break;

                    case "2":
                        ViewTasks(tasks);
                        break;

                    case "3":
                        RemoveTasks(tasks);
                        break;

                    case "4":
                        flag = false;
                        Console.WriteLine("Exitting...");
                        break;

                    default:
                        Console.WriteLine("Invalid Task Operation");
                        break;
                }

            }  
        }

        static void AddTasks(List<string> tasks)
        {
            Console.WriteLine("Enter task:");
            string add = Console.ReadLine();

            if (string.IsNullOrEmpty(add))
            {
                throw new Exception("Invalid Task");
            }
            else
            {
                tasks.Add(add);
                Console.WriteLine("Task Added");
                Console.WriteLine();
            }

        }

        static void ViewTasks(List<string> tasks)
        {
            if (tasks.Count == 0)
            {
                Console.WriteLine("No Taks to Show");
                Console.WriteLine();
            }
            else
            {
                Console.WriteLine("Tasks:");
                for (int i = 0; i < tasks.Count; i++)
                {
                    Console.WriteLine($"{i+1}. {tasks[i]}");
                    
                }
                Console.WriteLine();

            }
        }

        static void RemoveTasks(List<string> tasks)
        {
            if (tasks.Count == 0)
            {
                Console.WriteLine("No tasks to Remove");
                Console.WriteLine();
            }
            else
            {
                Console.WriteLine("Enter task number to remove:");
                int remove;
                int.TryParse(Console.ReadLine(),out remove);

                if (remove > 0 && remove <= tasks.Count)
                {
                    string removed = tasks[remove - 1];
                    tasks.RemoveAt(remove - 1);
                    Console.WriteLine($"Removed: {removed}");
                    Console.WriteLine();
                }
                else
                {
                    Console.WriteLine("Invalid Task Number");
                    Console.WriteLine();
                }
            }
        }
    }
}
