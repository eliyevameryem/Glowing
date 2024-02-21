﻿using GlowingTemplate.Models.Entity;

namespace GlowingTemplate.Models
{
    public class BasketItem : BaseEntity
    {
        public int ProductId { get; set; }
        public Product Product { get; set; }
        public int Count { get; set; }
        public string AppUserId { get; set; }
        public AppUser AppUser { get; set; }
        public decimal Price { get; set; }
        public int? OrderId { get; set; }
        public Order? Order { get; set; }
    }
}
