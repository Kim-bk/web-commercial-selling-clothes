﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CommercialClothes.Models.DTOs.Requests
{
    public class CredentialRequest
    {
        [Required]
        public int RoleId { get; set; }
        [Required]
        public int UserGroupId { get; set; }
        public bool IsActive { get; set; }
    }
}
