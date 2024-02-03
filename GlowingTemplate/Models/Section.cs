using System.ComponentModel.DataAnnotations.Schema;

namespace GlowingTemplate.Models
{
    public class Section
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string? ImageUrl { get; set; }
        [NotMapped]
        public IFormFile? ImageFile { get; set; }
    }
}
