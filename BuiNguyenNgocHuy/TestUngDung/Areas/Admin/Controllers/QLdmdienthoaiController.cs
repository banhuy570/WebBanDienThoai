using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TestUngDung.DAO;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class QLdmdienthoaiController : Controller
    {
        // GET: Admin/QLdmdienthoai
        private BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }
        [HttpPost]
        public ActionResult Index(string searchStringCategory)
        {
            var category = new CategoryDao();
            var model = category.ListWhereAll(searchStringCategory);
            ViewBag.SearchCategory = searchStringCategory;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "ID,Name,Description")] Category category)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (String.IsNullOrEmpty(category.ID.ToString()))
                    {
                        return View();
                    }
                    db.Categories.Add(category);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Category", "Create-Post", ex.ToString());
            }
            return View();
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID = new SelectList("ID", "Name");
            return View(category);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Description")] Category category)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (String.IsNullOrEmpty(category.ID.ToString()))
                    {
                        return View();
                    }
                    BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();
                    db.Entry(category).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Category", "Create-Post", ex.ToString());
            }
            return View();
        }
        ////////////
        // GET: Admin/QLDMDienthoai/Delete/5
        public ActionResult Delete(int id)
        {
            var dao = new CategoryDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}