﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace GlowingTemplate.Models
{
    public class Slider
    {
        public int Id { get; set; }
        [MaxLength(15)]
        public string Title { get; set; }
        [MaxLength(20)]
        public string Description { get; set; }
        public string? ImageUrl { get; set; }
        [NotMapped]
        public IFormFile? ImageFile { get; set; }

    }
}