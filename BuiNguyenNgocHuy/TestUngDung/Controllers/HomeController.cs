using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelEF.Model;


namespace TestUngDung.Controllers
{
    public class HomeController : Controller
    {
        BuiNguyenNgocHuyContext db = new BuiNguyenNgocHuyContext();
        public ActionResult Index()
        {
            var model = db.Categories.Where(c => c.Products.Count>4).ToList();
            return View(model);
        }
        public ActionResult Search(){
            var name = Request["term"];

            var data = db.Products
                .Where(d => d.Name.Contains(name))
                .Select(d => d.Name).ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Contact()
        {        
            return View();
        }
        public ActionResult Category()
        {
            var model = db.Categories;
            return PartialView("_Category",model);
        }
        /// <summary>
        /// //Lấy về sản phẩm có giá khuyến mại > 20tr; Guid để khi refresh nó ra sp khác
        /// </summary>
        /// <returns></returns>
        public ActionResult SaleOff()
        {
            var model = db.Products.Where(d=>d.UnitCost>2000000).OrderBy(d=>Guid.NewGuid()).Take(2);
            return PartialView("_SaleOff", model);
        }

        public ActionResult Special()
        {
            var model = db.Products.Where(d => d.UnitCost<19900000).Take(5);
            return PartialView("_BestSeller", model);
        }

    }
}