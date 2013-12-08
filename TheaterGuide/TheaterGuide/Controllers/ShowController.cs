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
        private LstController list = new LstController();        

        private IQueryable<SearchViewModel> showSearch(int theaterId = 0, string searchString = null, int movieId = 0, DateTime? date = null, string theater = null, string city = null)
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
            if (!String.IsNullOrEmpty(theater))
            {
                shows = shows.Where(s => s.TheaterName.Equals(theater));
            }
            if (!String.IsNullOrEmpty(city))
            {
                shows = shows.Where(s => s.City.Equals(city));
            }

            return shows.OrderByDescending(s => s.ShowId);
        }

        // Search by costomers via show list page
        public ActionResult SearchResult(int theaterId = 0, string theater = null, string city = null, string searchString = null, int movieId = 0, DateTime? date = null)
        {
            ViewBag.TheaterLst = list.GetDistinctTheaterLst();
            ViewBag.CityLst = list.GetDistinctCityLst();
            return View(showSearch(theaterId, searchString, movieId, date, theater, city));
        }

        //
        // GET: /Show/
        [Authorize(Roles = "admin")]
        public ActionResult Shows(int id = 0, string searchString = null)
        {
            ViewBag.TheaterLst = list.GetTheaterLst();
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
            ViewBag.TheaterLst = list.GetTheaterLst();
            ViewBag.MovieLst = list.GetMovieLst();
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