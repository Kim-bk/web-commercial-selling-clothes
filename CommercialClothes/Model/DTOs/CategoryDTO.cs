using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CommercialClothes.Models.DTOs.Responses.Base;

namespace CommercialClothes.Models.DTOs
{
    public class CategoryDTO : GeneralResponse
    {
        public int Id { get; set; }
        public int? ParentId { get; set; }
        public int? ShopId { get; set; }
        public string? Name { get; set; }
        public string? NameParent { get; set; }
        public string? Description { get; set; }
        public bool Gender { get; set; }
        public virtual List<ItemDTO>? Items { get; set; }
        public virtual List<CategoryDTO>? Categories{ get; set; }
        public string? ImagePath { get; set; }
    }
}