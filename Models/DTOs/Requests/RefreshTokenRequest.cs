﻿using System.ComponentModel.DataAnnotations;

namespace CommercialClothes.Models.DTOs.Requests
{
    public class RefreshTokenRequest
    {
        [Required]
        public string Token { get; set; }
    }
}
