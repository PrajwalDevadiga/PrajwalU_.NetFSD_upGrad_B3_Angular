/* Level-2 Problem 2: Vehicle Rental System
Scenario:
A vehicle rental company wants a system where different vehicle types calculate rental charges differently.
Requirements:
1. Create a base class Vehicle with properties Brand and RentalRatePerDay.
2. Create derived classes Car and Bike.
3. Override CalculateRental(int days) method.
4. Car adds insurance charge of 500 per rental.
5. Bike offers 5% discount on total rental.
Technical Constraints:
• Use encapsulation with proper access modifiers.
• Apply runtime polymorphism.
• Validate number of rental days.
Expectations:
• Use base class reference to call overridden methods.
• Implement clean class hierarchy.
• Display final rental cost.
Learning Outcome:
• Master inheritance and polymorphism.
• Implement real-world OOP scenarios.
• Improve object-oriented design skills.
Sample Input: 
Car RentalRatePerDay = 2000, Days = 3
Sample Output: 
Total Rental = 6500
*/

using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp4
{
    internal class Vehicle
    {
        public string Brand {  get; set; }

        public double RentalPerDay { get; set; }

        public virtual double CalculateRental(int days)
        {
            if (days <= 0)
            {
                throw new ArgumentException("Invalid rental days");
            }
            return RentalPerDay * days; 
        }
    }

    class Car : Vehicle
    {
        public override double CalculateRental(int days)
        {
            return (RentalPerDay * days) + 500;
        }
    }

    class Bike : Vehicle
    {
        public override double CalculateRental(int days)
        {
            double total = RentalPerDay * days;
            return total - (total * 0.05);
        }
    }
}
