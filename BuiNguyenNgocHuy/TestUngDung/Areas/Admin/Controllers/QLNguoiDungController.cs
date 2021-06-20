using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Common;
using TestUngDung.DAO;
using PagedList;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class QLNguoiDungController : Controller
    {
        // GET: Admin/QLNguoiDung
        private BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            var dao = new UserDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
            

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "ID,UserName,Password,Status")] UserAccount userAccount)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (String.IsNullOrEmpty(userAccount.ID.ToString()))
                    {
                        return View();
                    }
                    var encryptedMd5Pas = Encryptor.MD5Hash(userAccount.Password);
                    userAccount.Password = encryptedMd5Pas;
                    db.UserAccounts.Add(userAccount);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("UserAccount", "Create-Post", ex.ToString());
            }
            return View();
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserAccount user = db.UserAccounts.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID = new SelectList("ID", "Name", "Password", "Status");
            return View(user);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserName,Password,Status")] UserAccount user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (String.IsNullOrEmpty(user.ID.ToString()))
                    {
                        return View();
                    }
                    BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();
                    var encryptedMd5Pas = Encryptor.MD5Hash(user.Password);
                    user.Password = encryptedMd5Pas;
                    db.Entry(user).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("UserAccount", "Create-Post", ex.ToString());
            }
            return View();
        }
        ////////////
        // GET: Admin/QLNguoiDung/Delete/5
        public ActionResult Delete(int id)
        {
            var dao = new UserAccoutDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}
