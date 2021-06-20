using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using ModelEF.Model;
using PagedList;

namespace TestUngDung.DAO
{
    public class UserDao
    {
        BuiNguyenNgocHuyContext db = null;
        public UserDao()
        {
            db = new BuiNguyenNgocHuyContext();
        }
        public UserAccount GetById(string userName)
        {
            return db.UserAccounts.SingleOrDefault(x => x.UserName == userName);
        }
        public int Insert(UserAccount entity)
        {
            db.UserAccounts.Add(entity);
            try
            {
                db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var entityValidationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in entityValidationErrors.ValidationErrors)
                    {
                        HttpContext.Current.Response.Write("Property: " + validationError.PropertyName + " Error: " + validationError.ErrorMessage);
                    }
                }
            }
            return entity.ID;
        }


        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var result = db.UserAccounts.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                        if (result.Status == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (result.Password == passWord)
                                return 1;
                            else
                                return -2;
                        }
                    
                    
                 }
             }
            return -3;
        }
        public bool CheckUserName(string userName)
        {
            return db.UserAccounts.Count(x => x.UserName == userName) > 0;
        }
        public IEnumerable<UserAccount> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString));
            }

            return model.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        public IEnumerable<Product> ListAllPaging1(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
                        return model.OrderBy(x => x.UnitCost).OrderByDescending(y => y.Quantity).ToPagedList(page, pageSize);
        }
    }
}