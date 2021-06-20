using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ModelEF.Model;
namespace TestUngDung.DAO
{
    public class UserAccoutDao
    {
        private BuiNguyenNgocHuyContext db;
        public UserAccoutDao()
        {
            db = new BuiNguyenNgocHuyContext();
        }
        ///////////////////
        public List<UserAccount> ListAll()
        {
            return db.UserAccounts.ToList();
        }

        ///////////Tim kiem
        public IEnumerable<UserAccount> ListWhereAll(string keysearchuser)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(keysearchuser))
            {
                model = model.Where(x => x.UserName.Contains(keysearchuser));
            }
            return model.OrderBy(x => x.UserName);
        }

        ///////////////////
        public UserAccount FindId(int id)
        {
            return db.UserAccounts.Find(id);
        }

        /////////////////////
        public int Insert(UserAccount user)
        {
            db.UserAccounts.Add(user);
            db.SaveChanges();
            return user.ID;
        }

        ///////////////////
        public bool Delete(int id)
        {
            try
            {
                var user = db.UserAccounts.Find(id);
                db.UserAccounts.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}