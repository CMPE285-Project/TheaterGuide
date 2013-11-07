using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;
using TheaterGuide.Filters;
using TheaterGuide.Models;

namespace TheaterGuide.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class MovieController : Controller
    {
        private UsersContext db = new UsersContext();
        private DateTime defaultTime = new DateTime(1900, 1, 1);

        public List<SelectListItem> GetDropDown()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            var theaters = from m in db.Theaters
                           orderby m.Name, m.Adress
                           select m;

            foreach (var t in theaters)
            {
                lst.Add(new SelectListItem()
                {
                    Text = t.Name + "@" + t.Adress,
                    Value = t.TheaterId.ToString()
                });
            }
            return lst;
        }

        private IQueryable<MovieModels> search(int id = 0, string searchString = null, DateTime? date = null)
        {
            var movies = from m in db.Movies
                         select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                movies = movies.Where(s => s.Name.Contains(searchString));
            }
            if (id != 0)
            {
                movies = movies.Where(s => s.TheaterId == id);
            }
            if (date != null)
            {
                movies = movies.Where(s => s.Date.Equals((DateTime)date));
            }
            return movies;
        }
        //
        // GET: /Movie/
        // Search by admin via theater information management
        public ActionResult SearchMovie(int id=0)
        {
            return View(search(id));
        }

        // Search by costomers via home page
        public ActionResult SearchResult(int id = 0, string searchString = null, DateTime? date = null)
        {
            return View(search(id, searchString, date));
        }
        
        // Search by admin via movie information management
        public ActionResult Movies(int id = 0, string searchString = null)
        {
            ViewBag.TheaterLst = GetDropDown();
            return View(search(id, searchString));
        }

        //
        // GET: /Movie/Details/5

        public ActionResult Details(int id = 0)
        {
            MovieModels moviemodels = db.Movies.Find(id);
            if (moviemodels == null)
            {
                return HttpNotFound();
            }
            return View(moviemodels);
        }

        //
        // GET: /Movie/Create

        public ActionResult Create()
        {
            ViewBag.TheaterLst = GetDropDown();
            return View();
        }

        //
        // POST: /Movie/Create

        [HttpPost]
        public ActionResult Create(MovieModels moviemodels)
        {
            if (ModelState.IsValid)
            {
                db.Movies.Add(moviemodels);
                db.SaveChanges();
                return RedirectToAction("Movies");
            }

            return View(moviemodels);
        }

        //
        // GET: /Movie/Edit/5

        public ActionResult Edit(int id = 0)
        {
            MovieModels moviemodels = db.Movies.Find(id);
            if (moviemodels == null)
            {
                return HttpNotFound();
            }
            return View(moviemodels);
        }

        //
        // POST: /Movie/Edit/5

        [HttpPost]
        public ActionResult Edit(MovieModels moviemodels)
        {
            if (ModelState.IsValid)
            {
                db.Entry(moviemodels).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Movies");
            }
            return View(moviemodels);
        }

        //
        // GET: /Movie/Delete/5

        public ActionResult Delete(int id = 0)
        {
            MovieModels moviemodels = db.Movies.Find(id);
            if (moviemodels == null)
            {
                return HttpNotFound();
            }
            return View(moviemodels);
        }

        //
        // POST: /Movie/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            MovieModels moviemodels = db.Movies.Find(id);
            db.Movies.Remove(moviemodels);
            db.SaveChanges();
            return RedirectToAction("Movies");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}