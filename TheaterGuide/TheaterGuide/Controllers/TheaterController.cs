using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.Web.WebPages.OAuth;
using TheaterGuide.Filters;
using TheaterGuide.Models;

namespace TheaterGuide.Controllers
{
    public class TheaterController : Controller
    {
        private UsersContext db = new UsersContext();

        private IQueryable<TheaterModels> search(string searchString = null)
        {
            var theaters = from m in db.Theaters
                           select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                theaters = theaters.Where(s => s.Name.Contains(searchString));
            }

            return theaters.OrderByDescending(s => s.TheaterId);
        }

        // search by admin
        [Authorize(Roles = "admin")]
        public ActionResult Theaters(string searchString=null)
        {
            return View(search(searchString));
        }

        // search by customers
        public ActionResult SearchTheaters(string searchString = null)
        {
            return View(search(searchString));
        }

        //
        // GET: /Theater/Details/5
        [Authorize(Roles = "admin")]
        public ActionResult Details(int id = 0)
        {
            TheaterModels theatermodels = db.Theaters.Find(id);
            if (theatermodels == null)
            {
                return HttpNotFound();
            }
            return View(theatermodels);
        }

        //
        // GET: /Theater/Create
        [Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Theater/Create
        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Create(TheaterModels theatermodels)
        {
            if (ModelState.IsValid)
            {
                db.Theaters.Add(theatermodels);
                db.SaveChanges();
                return RedirectToAction("Theaters");
            }

            return View(theatermodels);
        }

        //
        // GET: /Theater/Edit/5
        [Authorize(Roles = "admin")]
        public ActionResult Edit(int id = 0)
        {
            TheaterModels theatermodels = db.Theaters.Find(id);
            if (theatermodels == null)
            {
                return HttpNotFound();
            }
            return View(theatermodels);
        }

        //
        // POST: /Theater/Edit/5
        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Edit(TheaterModels theatermodels)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theatermodels).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Theaters");
            }
            return View(theatermodels);
        }

        //
        // GET: /Theater/Delete/5
        [Authorize(Roles = "admin")]
        public ActionResult Delete(int id = 0)
        {
            TheaterModels theatermodels = db.Theaters.Find(id);
            if (theatermodels == null)
            {
                return HttpNotFound();
            }
            return View(theatermodels);
        }

        //
        // POST: /Theater/Delete/5
        [Authorize(Roles = "admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            TheaterModels theatermodels = db.Theaters.Find(id);
            db.Theaters.Remove(theatermodels);
            db.SaveChanges();
            return RedirectToAction("Theaters");
        }
    }
}