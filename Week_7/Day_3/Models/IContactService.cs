using System.Collections.Generic;
using WebApplication1.Models;

public interface IContactService
{
    List<ContactInfo> GetAllContacts();
    ContactInfo GetContactById(int id);
    void AddContact(ContactInfo contact);
}