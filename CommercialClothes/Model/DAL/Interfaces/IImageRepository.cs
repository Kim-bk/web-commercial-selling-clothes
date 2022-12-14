using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CommercialClothes.Models.DTOs.Responses;

namespace CommercialClothes.Models.DAL.Repositories
{
    public interface IImageRepository : IRepository<Image>
    {
        Task<List<Image>> GetImageByItemId(int idItem);
        Task<List<Image>> GetImageByShopId(int idShop);
        Task<Image> GetImage(int idItem);
    }
}