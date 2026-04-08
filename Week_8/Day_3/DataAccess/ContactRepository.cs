using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography.X509Certificates;

namespace WebApplication2.DataAccess
{
    public class ContactRepository : IContactRepository
    {
        public static List<ContactInfo> contacts = new List<ContactInfo>()
        {
            new ContactInfo { ContactId = 1, FirstName = "Prajwal", LastName = "Devadiga", EmailId = "prajwal@gmail.com", MobileNo = 9876543210, Designation = "Developer", CompanyId = 1, DepartmentId = 1 },
            new ContactInfo { ContactId = 2, FirstName = "Abhay", LastName = "Kumar", EmailId = "ravi@gmail.com", MobileNo = 9123456780, Designation = "Tester", CompanyId = 2, DepartmentId = 2 }
        };

        public async Task<IEnumerable<ContactInfo>> GetAllContactsAsync()
        {
            return await Task.FromResult(contacts);
        }

        public async Task<ContactInfo> GetContactByIdAsync(int id)
        {
            var contact = contacts.FirstOrDefault(contact => contact.ContactId == id);
            return await Task.FromResult(contact);
        }

        public async Task<ContactInfo> AddContactAsync(ContactInfo contact)
        {
            contact.ContactId = contacts.Count() + 1;
            contacts.Add(contact);

            return await Task.FromResult(contact);
        }

        public async Task<bool> UpdateContactAsync(int id, ContactInfo contact)
        {
            var result = contacts.FirstOrDefault(contact => contact.ContactId == id);

            if (result == null)
            {
                return await Task.FromResult(false);
            }

            result.FirstName = contact.FirstName;
            result.LastName = contact.LastName;
            result.EmailId = contact.EmailId;
            result.MobileNo = contact.MobileNo;
            result.Designation = contact.Designation;
            result.CompanyId = contact.CompanyId;
            result.DepartmentId = contact.DepartmentId;

            return await Task.FromResult(true);
        }

        public async Task<bool> DeleteContactAsync(int id)
        {
            var contact = contacts.FirstOrDefault(contact=> contact.ContactId == id);

            if (contact == null)
                return await Task.FromResult(false);

            contacts.Remove(contact);
            return await Task.FromResult(true);
        }
    }
}
