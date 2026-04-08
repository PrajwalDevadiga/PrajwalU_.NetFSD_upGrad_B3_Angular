namespace WebApplication2.DataAccess
{
    public interface IContactRepository
    {
        Task<IEnumerable<ContactInfo>> GetAllContactsAsync();
        Task<ContactInfo> GetContactByIdAsync(int id);
        Task<ContactInfo> AddContactAsync(ContactInfo contact);
        Task<bool> UpdateContactAsync(int id, ContactInfo contact);
        Task<bool> DeleteContactAsync(int id);
    }
}
