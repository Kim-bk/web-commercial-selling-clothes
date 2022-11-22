using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CommercialClothes.Models;
using CommercialClothes.Models.DAL;
using CommercialClothes.Models.DAL.Repositories;
using CommercialClothes.Models.DTOs;
using CommercialClothes.Models.DTOs.Requests;
using CommercialClothes.Models.DTOs.Response;
using CommercialClothes.Services.Base;
using CommercialClothes.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using AutoMapper;

namespace CommercialClothes.Services
{
    public class CategoryService : BaseService, ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;
        private readonly IImageRepository _imageRepository;
        private readonly IUserRepository _userRepository;
        private readonly IMapper _map;
        public CategoryService(ICategoryRepository categoryRepository ,IUnitOfWork unitOfWork
                , IMapperCustom mapper, IImageRepository imageRepository, IMapper map, IUserRepository userRepository) : base(unitOfWork, mapper)
        {
            _categoryRepository = categoryRepository;
            _imageRepository = imageRepository;
            _map = map;
            _userRepository = userRepository;
        }

        public async Task<CategoryDTO> AddCategory(CategoryRequest req, int idAccount)
        {
            try
            {
                var findCategory = await _categoryRepository.FindAsync(ca => ca.Name == req.Name);
                var account = await _userRepository.FindAsync(us => us.Id == idAccount);
                if (findCategory != null)
                {
                    return new CategoryDTO
                    {
                        IsSuccess = false,
                        ErrorMessage = "Category has exists",
                    };
                }
                await _unitOfWork.BeginTransaction(); 
                var categories = new Category
                {
                    ParentId = req.ParentId,
                    ShopId = account.ShopId.Value,
                    Name = req.Name,
                    Description = req.Description,
                    Gender = req.Gender,
                };   
                // await _categoryRepository.AddAsync(categories);
                var img = new Image{
                    Path = req.ImagePath,
                    CategoryId = categories.Id
                };
                categories.Image = img;
                await _categoryRepository.AddAsync(categories);
                await _unitOfWork.CommitTransaction();
                    return new CategoryDTO
                    {
                        IsSuccess = true,
                        ErrorMessage = "Add category success",
                    };            }
            catch (Exception ex)
            {
                ex = new Exception(ex.Message);
                throw ex;
            }
        }

        public async Task<CategoryResponse> AddParentCategory(CategoryRequest req, int accountId)
        {
            try
            {
                var findCategory = await _categoryRepository.FindAsync(ca => ca.Name == req.Name);
                if (findCategory != null)
                {
                    return new CategoryResponse{
                        IsSuccess = false,
                        ErrorMessage = "Category not found!!"
                    };
                }
                await _unitOfWork.BeginTransaction(); 
                var categories = new Category
                {
                    Name = req.Name,
                    Description = req.Description,
                    Gender = req.Gender,
                    // Image = req.ImagePath,
                };  
                var img = new Image{
                    Path = req.ImagePath,
                    CategoryId = categories.Id
                };
                categories.Image = img;
                await _categoryRepository.AddAsync(categories);
                await _unitOfWork.CommitTransaction();
                return new CategoryResponse{
                    IsSuccess = true,
                    ErrorMessage = "Add Category Success!!"
                };       
            }
            catch (Exception ex)
            {
                return new CategoryResponse{
                    IsSuccess = false,
                    ErrorMessage = ex.Message,
                };
            }
        }

        public async Task<List<CategoryDTO>> GetAllCategpry()
        {
            var listCategoryDTO = await _categoryRepository.GetAll();
            var categoryDTO = new List<CategoryDTO>();

            foreach (var item in listCategoryDTO)
            {
                if((item.ParentId == null)&&(item.ShopId==null)){
                    var category = new CategoryDTO()
                    {
                        Id = item.Id,
                        ParentId = item.ParentId,
                        ShopId = item.ShopId,
                        Name = item.Name,
                        Gender = item.Gender,
                        Description = item.Description,
                        ImagePath = item.Image.Path,
                    };
                    categoryDTO.Add(category);
                }   
            }
            return categoryDTO;
        }

        public async Task<CategoryDTO> GetCategoryAndItemByParentId(int idCategory)
        {
            var categories = await _categoryRepository.ListCategory(idCategory);
            var categoryDetail = await _categoryRepository.GetCategory(idCategory);
            
            var resultHead = new CategoryDTO
            {
                // IsSuccess = true,
                Id = categoryDetail.Id,
                Name = categoryDetail.Name,
                ParentId = categoryDetail.ParentId,
                Description = categoryDetail.Description,
                Gender  = categoryDetail.Gender,
                Categories = new List<CategoryDTO>()
            };
            if(resultHead.ParentId != null)
            {
                var categoryParent = await _categoryRepository.GetCategory(resultHead.ParentId.Value);
                resultHead.NameParent = categoryParent.Name;
            }
            foreach (var i in categories)
            {
                // Add third category to second category
                var categorySecond = _map.Map<Category, CategoryDTO>(i);
                var childCategorySecond = await _categoryRepository.ListCategory(i.Id);

                foreach (var j in childCategorySecond)
                {
                    var categoryThird = _map.Map<Category, CategoryDTO>(j);
                    categorySecond.Categories = new List<CategoryDTO>
                    {
                        categoryThird
                    };
                }
                
                // Add second category to head category
                resultHead.Categories.Add(categorySecond);
            }
            return resultHead;
        }

        public async Task<List<CategoryDTO>> GetCategoryByParentId(int idCategory)
        {
            var category = await _categoryRepository.ListCategory(idCategory);
            var listCategories = _mapper.MapCategories(category);
            var parentId = await _categoryRepository.GetCategory(idCategory);
            foreach (var listCategory in listCategories)
            {
                listCategory.NameParent = parentId.Name;  
            }
            return listCategories;
        }

        public async Task<CategoryDTO>  GetCategory(int idCategory)
        {
            // 1. Find category
            var category = await _categoryRepository.FindAsync(p => p.Id == idCategory);
            if (category == null)
            {
                return new CategoryDTO
                {
                    IsSuccess = false,
                    ErrorMessage = "Category not found!!!!!!!",
                };
            }
            var listCategoryDTO = new List<CategoryDTO>();
            var listItemsDTO = new List<ItemDTO>();
            if(category.ParentId != null)
            {
                var findCategory = await GetCategoryByParentId(category.Id);
                if(findCategory.Count != 0)
                {
                    foreach (var i in findCategory)
                    {
                        listItemsDTO.AddRange(i.Items);
                    }
                    return new CategoryDTO
                    {
                        IsSuccess = true,
                        Id = category.Id,
                        Name = category.Name,
                        Description = category.Description,
                        Gender  = category.Gender,
                        Items = listItemsDTO,
                        ImagePath = category.Image.Path,
                    };
                }
            }
            // 2. Check if category parent
            if(category.ParentId == null)
            {
                var findCategory = new List<CategoryDTO>();
                // 3. Get all info child category
                listCategoryDTO = await GetCategoryByParentId(category.Id);

                foreach (var categoryDTO in listCategoryDTO)
                {
                    findCategory = await GetCategoryByParentId(categoryDTO.Id);
                    foreach (var item in findCategory)
                    {
                        listItemsDTO.AddRange(item.Items);
                    }
                    // // 4. Save items
                    // listItemsDTO.AddRange(categoryDTO.Items);
                }
                // 5. Return information of parent category
                return new CategoryDTO
                {
                    IsSuccess = true,
                    Id = category.Id,
                    Name = category.Name,
                    Description = category.Description,
                    Gender  = category.Gender,
                    Items = listItemsDTO,
                    ImagePath = category.Image.Path,
                };
            }

            var parentId = await _categoryRepository.GetCategory(category.ParentId.Value);
            // 6. Return all information of child category
            return new CategoryDTO
            {
                IsSuccess = true,
                Id = category.Id,
                ParentId = category.ParentId,
                Name = category.Name,
                ShopId = category.ShopId,
                NameParent = parentId.Name,
                Description = category.Description,
                Items = _mapper.MapItems(category.Items.ToList()),
                ImagePath = category.Image.Path,
            };
        }

        public async Task<CategoryResponse> RemoveParentCategory(int idCategory)
        {
            try
            {
                var findParent = await _categoryRepository.ListCategory(idCategory);
                var findCategory = await _categoryRepository.FindAsync(it => it.Id == idCategory);
                if(findCategory == null)
                {

                    return new CategoryResponse{
                        IsSuccess = false,
                        ErrorMessage = "Category not found!!"
                    };
                    // throw new Exception("Item not found!!");
                }
                await _unitOfWork.BeginTransaction();
                _categoryRepository.Delete(findCategory);
                foreach (var category in findParent)
                {
                    category.ParentId = null;
                }
                await _unitOfWork.CommitTransaction();
                
                return new CategoryResponse
                {
                    IsSuccess = true,
                };
                
            }
            catch (Exception ex)
            {
                return new CategoryResponse
                {
                    IsSuccess = false,
                    ErrorMessage = ex.Message,
                };
            }
        }

        public async Task<CategoryResponse> UpdateCategoryByCategoryId(CategoryRequest req, int idAccount)
        {
            try
            {
                var account = await _userRepository.FindAsync(us => us.Id == idAccount);
                var categoryReq = await _categoryRepository.FindAsync(it => it.Id == req.Id);
                if(categoryReq == null)
                {
                    return new CategoryResponse
                    {
                        IsSuccess = false,
                        ErrorMessage = "Category not found!!"
                    };
                }
                await _unitOfWork.BeginTransaction();
                categoryReq.ParentId = req.ParentId;
                categoryReq.ShopId = account.ShopId.Value;
                categoryReq.Name = req.Name;
                categoryReq.Description = req.Description;
                categoryReq.Image.Path = req.ImagePath;
                _categoryRepository.Update(categoryReq);
                await _unitOfWork.CommitTransaction();
                return new CategoryResponse{
                    IsSuccess = true,
                };
            }
            catch (Exception ex)
            {
                return new CategoryResponse
                {
                    IsSuccess = false,
                    ErrorMessage = ex.Message,
                };
            }
        }
    }
}