using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using CommercialClothes.Commons.CustomAttribute;
using CommercialClothes.Models.DTOs.Requests;
using CommercialClothes.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CommercialClothes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    [Permission("MANAGE_STATISTICS")]
    public class StatisticalController : Controller
    {
        private readonly IStatisticalService _statisticalService;

        public StatisticalController(IStatisticalService statisticService)
        {
            _statisticalService = statisticService;
        }

        [HttpGet("{idShop:int}")]
        public async Task<IActionResult> GetStatistical(int idShop)
        {
            var res = await _statisticalService.ListItemsSold(idShop);
            return Ok(res);
        }

        [HttpGet("item/{idShop:int}/{dateTime}")]
        public async Task<IActionResult> GetStatisticalByDateTime(int idShop,string dateTime)
        {
            var res = await _statisticalService.ListItemsSoldByDate(idShop,dateTime);
            if(res.ToArray().Length == 0){
                return BadRequest("Wrong date format!");
            }
            return Ok(res);
        }

        [HttpGet]
        public async Task<IActionResult> GetStatisticalInterval([FromQuery] StatisticalRequest req)
        {
            var res = await _statisticalService.ListItemSoldByInterval(req);
            return Ok(res);
        }

        [HttpGet("shop")]
        public async Task<IActionResult> GetStatistical([FromQuery] string type)
        {
            var userId = Convert.ToInt32(User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
            var res = await _statisticalService.ListItemSoldBy7Days(type,userId);
            if(res.IsSuccess)
            {
                return Ok(res);
            }
            else
            {
                return BadRequest(res.ErrorMessage);
            }
        }

        [HttpGet("shopcancel")]
        public async Task<IActionResult> GetStatisticalCancel([FromQuery] string type)
        {
            var userId = Convert.ToInt32(User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
            var res = await _statisticalService.ListIntervalCancelOrder(type,userId);
            if(res.IsSuccess)
            {
                return Ok(res);
            }
            else
            {
                return BadRequest(res.ErrorMessage);
            }
        }

        [HttpGet("shop-countorder")]
        public async Task<IActionResult> GetStatisticalCountOrder([FromQuery] string type)
        {
            var userId = Convert.ToInt32(User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
            var res = await _statisticalService.CountOrders(type,userId);
            if(res.IsSuccess)
            {
                return Ok(res);
            }
            else
            {
                return BadRequest(res.ErrorMessage);
            }
        }
        
        [HttpGet("shop-ordercancel")]
        public async Task<IActionResult> GetStatisticalCountOrderCancel([FromQuery] string type)
        {
            var userId = Convert.ToInt32(User.FindFirst(ClaimTypes.NameIdentifier)?.Value);
            var res = await _statisticalService.CountOrdersCancel(type,userId);
            if(res.IsSuccess)
            {
                return Ok(res);
            }
            else
            {
                return BadRequest(res.ErrorMessage);
            }
        }
    }
}