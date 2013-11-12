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

        private IQueryable<MovieModels> movieSearch(string searchString = null)
        {
            var movies = from m in db.Movies
                         select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                movies = movies.Where(s => s.Name.Contains(searchString));
            }

            return movies;
        }

        //search movie info by customers
        public ActionResult SearchMovie(string searchString = null)
        {
            return View(movieSearch(searchString));
        }

        // movie information management
        public ActionResult Movies(string searchString = null)
        {           
            return View(movieSearch(searchString));
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