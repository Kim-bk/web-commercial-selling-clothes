using CommercialClothes.Models.DTOs.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ComercialClothes.Models;
using CommercialClothes.Models.DAL.Interfaces;

using Microsoft.EntityFrameworkCore;
using System.ComponentModel;

namespace CommercialClothes.Models.DAL.Repositories
{
    public class ItemRepository : Repository<Item>, IItemRepository
    {
        public ItemRepository(DbFactory dbFactory) : base(dbFactory)
        {
        }

        public async Task<Item> GetItemById(int idItem)
        {
            return await GetQuery(it => it.Id == idItem).FirstAsync();
        }

        public async Task<List<Item>> GetItemsByShop(int idShop)
        {
            return await GetQuery(it => it.ShopId == idShop).ToListAsync();
        }

        public async Task<List<Item>> SearchItem(string keyword)
        {
            return await GetQuery(it => it.Name.ToLower().Contains(keyword.ToLower())).ToListAsync();
        }
    }
}