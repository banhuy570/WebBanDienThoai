using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelEF.Model;

namespace TestUngDung.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
     
        public ActionResult Gioithieu()
        {           
            return View();
        }
    }
}