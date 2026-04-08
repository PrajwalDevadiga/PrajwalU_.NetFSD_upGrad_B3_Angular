using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApplication2.DataAccess;

namespace WebApplication2.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private readonly IContactRepository _repository;

        public ContactsController(IContactRepository repository)
        {
            _repository = repository;
        }

        [HttpGet] 
        public async Task<IActionResult> getAll()
        {
            var contacts = await _repository.GetAllContactsAsync();
            return Ok(contacts);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var contact = await _repository.GetContactByIdAsync(id);

            if (contact == null)
            {
                return NotFound();
            }

            return Ok(contact);
        }

        [HttpPost]
        public async Task<IActionResult> Create(ContactInfo contact)
        {
            if (contact == null)
                return BadRequest("Invalid data");

            var result = await _repository.AddContactAsync(contact);

            return Ok(result);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, ContactInfo contact)
        {
            var result = await _repository.UpdateContactAsync(id, contact);

            if (!result)
                return NotFound();

            return Ok("Updated Successfully");
        }

        
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _repository.DeleteContactAsync(id);

            if (!result)
                return NotFound();

            return Ok("Deleted Successfully");
        }
    }
}

