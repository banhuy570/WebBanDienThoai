using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ModelEF.Model;
using System.Web.Mvc;
using System.Net;
using System.Data.Entity;
using TestUngDung.DAO;
using PagedList;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class QLDienThoaiController : Controller
    {
        private BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();

        // GET: Admin/QLDienThoai
        public ActionResult Index(int page = 1,int pagesize = 5)
        {
           var product = db.Products.Include(d => d.Category);
            var model = product.OrderBy(x => x.UnitCost).OrderByDescending(y => y.Quantity);
            return View(model.ToPagedList(page,pagesize));
        }

        // GET: Admin/QLDienThoai/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/QLDienThoai/Create
        public ActionResult Create()
        {
            ViewBag.IDDM = new SelectList(db.Categories, "ID", "Name");
            return View();
        }

        // POST: Admin/QLDienThoai/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,IDDM,Name,UnitCost,Quantity,Image,IDDM,Descripton,status")] Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Products.Add(product);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Category", "Create-Post", ex.ToString());
            }

            ViewBag.madm = new SelectList(db.Categories, "ID", "Name", product.IDDM);
            return View(product);
        }

        // GET: Admin/QLDienThoai/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDDM = new SelectList(db.Categories, "ID", "Name", product.IDDM);
            return View(product);
        }

        // POST: Admin/QLDienThoai/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,IDDM,Name,UnitCost,Quantity,Image,IDDM,Descripton,status")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDDM = new SelectList(db.Categories, "ID", "Name", product.IDDM);
            return View(product);
        }

        // GET: Admin/QLDienThoai/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/QLDienThoai/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}