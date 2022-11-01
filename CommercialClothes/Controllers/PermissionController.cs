﻿using System.Threading.Tasks;
using CommercialClothes.Commons.CustomAttribute;
using CommercialClothes.Models.DTOs.Requests;
using CommercialClothes.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ComercialClothes.Controllers
{
    [Authorize]
    [Permission("MANAGE_PERMISSION")]
    [Route("api/[controller]")]
    [ApiController]
    public class PermissionController : Controller
    {
        private readonly IPermissionService _permissionService;
        public PermissionController(IPermissionService permissionService)
        {
            _permissionService = permissionService;
        }

        [HttpPost("credential")]
        // api/permission/credential
        public async Task<IActionResult> AddCredential(CredentialRequest req)
        {
            var rs = await _permissionService.AddCredential(req);
            if (!rs.IsSuccess)
            {
                return BadRequest(rs.ErrorMessage);
            }

            return Ok();
        }
       
        [HttpDelete("credential")]
        // api/permission/credential
        public async Task<IActionResult> RemoveCredential(CredentialRequest req)
        {
            var rs = await _permissionService.RemoveCredential(req);
            if (!rs.IsSuccess)
            {
                return BadRequest(rs.ErrorMessage);
            }

            return Ok();
        }
    }
}
