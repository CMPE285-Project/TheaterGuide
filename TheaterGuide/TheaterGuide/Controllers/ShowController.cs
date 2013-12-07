using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheaterGuide.Filters;
using TheaterGuide.Models;

namespace TheaterGuide.Controllers
{
    public class ShowController : Controller
    {
        private UsersContext db = new UsersContext();

        public List<SelectListItem> GetTheaterLst()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            var theaters = from m in db.Theaters
                           orderby m.Name, m.City
                           select m;

            foreach (var t in theaters)
            {
                lst.Add(new SelectListItem()
                {
                    Text = t.Name + "@" + t.City + "#" + t.TheaterId,
                    Value = t.TheaterId.ToString()
                });
            }
            return lst;
        }

        public List<SelectListItem> GetMovieLst()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            var movies = from m in db.Movies
                           orderby m.Name
                           select m;

            foreach (var m in movies)
            {
                lst.Add(new SelectListItem()
                {
                    Text = m.Name + "#" + m.MovieId,
                    Value = m.MovieId.ToString()
                });
            }
            return lst;
        }

        private IQueryable<SearchViewModel> showSearch(int theaterId = 0, string searchString = null, int movieId=0, DateTime? date = null)
        {
            var shows = from s in db.Shows
                         join m in db.Movies on s.MovieId equals m.MovieId
                         join t in db.Theaters on s.TheaterId equals t.TheaterId
                         select new SearchViewModel
                         {
                             ShowId = s.ShowId,
                             MovieId = m.MovieId,
                             TheaterId = t.TheaterId,
                             MovieName = m.Name,
                             TheaterName = t.Name,
                             Address = t.Address,
                             City = t.City,
                             State = t.State,
                             Price = s.Price,
                             BeginTime = s.BeginTime,
                             Date = s.Date,
                             AvailableSeat = s.AvailableSeat,
                             Discount = s.Discount
                         };

            if (!String.IsNullOrEmpty(searchString))
            {
                shows = shows.Where(s => s.MovieName.Contains(searchString));
            }
            if (theaterId != 0)
            {
                shows = shows.Where(s => s.TheaterId == theaterId);
            }
            if (movieId != 0)
            {
                shows = shows.Where(s => s.MovieId == movieId);
            }
            if (date != null)
            {
                shows = shows.Where(s => s.Date.Equals((DateTime)date));
            }
            return shows.OrderByDescending(s => s.ShowId);
        }

        // Search by costomers via show list page
        public ActionResult SearchResult(int theaterId = 0, string searchString = null, int movieId = 0, DateTime? date = null)
        {
            ViewBag.TheaterLst = GetTheaterLst();
            return View(showSearch(theaterId, searchString, movieId, date));
        }

        //
        // GET: /Show/
        [Authorize(Roles = "admin")]
        public ActionResult Shows(int id = 0, string searchString = null)
        {
            ViewBag.TheaterLst = GetTheaterLst();
            return View(showSearch(id, searchString));
        }

        //
        // GET: /Show/Details/5
        [Authorize(Roles = "admin")]
        public ActionResult Details(int id = 0)
        {
            ShowModels showmodels = db.Shows.Find(id);
            if (showmodels == null)
            {
                return HttpNotFound();
            }
            return View(showmodels);
        }

        //
        // GET: /Show/Create
        [Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            ViewBag.TheaterLst = GetTheaterLst();
            ViewBag.MovieLst = GetMovieLst();
            return View();
        }

        //
        // POST: /Show/Create
        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Create(ShowModels showmodels)
        {
            if (ModelState.IsValid)
            {
                db.Shows.Add(showmodels);
                db.SaveChanges();
                return RedirectToAction("Shows");
            }

            return View(showmodels);
        }

        //
        // GET: /Show/Edit/5
        [Authorize(Roles = "admin")]
        public ActionResult Edit(int id = 0)
        {
            ShowModels showmodels = db.Shows.Find(id);
            if (showmodels == null)
            {
                return HttpNotFound();
            }
            return View(showmodels);
        }

        //
        // POST: /Show/Edit/5
        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult Edit(ShowModels showmodels)
        {
            if (ModelState.IsValid)
            {
                db.Entry(showmodels).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Shows");
            }
            return View(showmodels);
        }

        //
        // GET: /Show/Delete/5
        [Authorize(Roles = "admin")]
        public ActionResult Delete(int id = 0)
        {
            ShowModels showmodels = db.Shows.Find(id);
            if (showmodels == null)
            {
                return HttpNotFound();
            }
            return View(showmodels);
        }

        //
        // POST: /Show/Delete/5
        [Authorize(Roles = "admin")]
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ShowModels showmodels = db.Shows.Find(id);
            db.Shows.Remove(showmodels);
            db.SaveChanges();
            return RedirectToAction("Shows");
        }
    }
}