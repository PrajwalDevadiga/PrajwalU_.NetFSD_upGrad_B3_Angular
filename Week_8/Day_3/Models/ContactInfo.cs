using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class ContactInfo
{
    public int ContactId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string EmailId { get; set; }
    public long MobileNo { get; set; }
    public string Designation { get; set; }

    [ForeignKey("Company")]
    public int CompanyId { get; set; }

    [ForeignKey("Department")]
    public int DepartmentId { get; set; } 

    public Company Company { get; set; }
    public Department Department { get; set; }
}