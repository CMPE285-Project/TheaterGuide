using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheaterGuide.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            MovieController mc = new MovieController();
            ViewBag.TheaterLst = mc.GetDropDown();

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
