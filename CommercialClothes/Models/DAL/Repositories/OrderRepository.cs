using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;
using CommercialClothes.Models;
using CommercialClothes.Models.DAL;
using CommercialClothes.Models.DAL.Repositories;

namespace PBL6.pbl6_web_commercial_sales.CommercialClothes.Models.DAL.Repositories
{
    public class OrderRepository : Repository<Order>, IOrderRepository
    {
        public OrderRepository(DbFactory dbFactory) : base(dbFactory)
        {
        }

        public async Task<List<Order>> GetCart(int userId)
        {
            return await GetQuery(ord => ord.AccountId == userId && ord.IsBought == false).ToListAsync();
        }

        public async Task<List<Order>>  GetOrdersByDate(string dateTime) 
        {
            if(dateTime.Length == 10)
            {
                return await GetQuery(or => or.DateCreate.ToString().Substring(0,10).Equals(dateTime) && or.IsBought == true && or.StatusId != 4).ToListAsync();
            }
            if(dateTime.Length == 7)
            {
                return await GetQuery(or => or.DateCreate.ToString().Substring(0,7).Equals(dateTime) && or.IsBought == true && or.StatusId != 4).ToListAsync();
            }
            if(dateTime.Length == 4)
            {
                return await GetQuery(or => or.DateCreate.ToString().Substring(0,4).Equals(dateTime) && or.IsBought == true && or.StatusId != 4).ToListAsync();
            }
            return null;
        }
    }
}