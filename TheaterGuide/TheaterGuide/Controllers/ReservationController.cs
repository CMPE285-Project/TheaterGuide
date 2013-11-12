using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using TheaterGuide.Filters;
using TheaterGuide.Models;

namespace TheaterGuide.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class ReservationController : Controller
    {
        private UsersContext db = new UsersContext();

        private IQueryable<ReservationModels> search(int userId=0, string status=null, int reserveId=0)
        {
            var reserves = from m in db.Reservations
                         select m;

            if (userId != 0)
            {
                reserves = reserves.Where(s => s.UserId == userId);
            }
            if (!String.IsNullOrEmpty(status))
            {
                reserves = reserves.Where(s => s.Status == status);
            }
            if (reserveId != 0)
            {
                reserves = reserves.Where(s => s.ReserveId == reserveId);
            }
            return reserves;
        }

        //
        // GET: /Reservation/

        public ActionResult Reservations(string status=null, int id=0)
        {
            return View(search(0, status, id));
        }

        public ActionResult ReservationHistory()
        {
            return View(search(WebSecurity.GetUserId(User.Identity.Name)));
        }

        //
        // GET: /Reservation/Details/5

        public ActionResult Details(int id = 0)
        {
            ReservationModels rm = db.Reservations.Find(id);
            if (rm == null)
            {
                return HttpNotFound();
            }
            return View(rm);
        }

        //
        // GET: /Reservation/Create
        
        public ActionResult Create(int id, int seats)
        {
            ViewBag.ReturnUrl = Url.Action("Create", new { id, seats});

            ShowModels show = db.Shows.Find(id);
            MovieModels movie = db.Movies.Find(show.MovieId);
            TheaterModels theater = db.Theaters.Find(show.TheaterId);

            double TotalPrice = show.Price * seats * show.Discount;

            ReservationModels model = new ReservationModels();
            model.UserId = WebSecurity.GetUserId(User.Identity.Name);
            model.ShowId = id;
            model.MovieName = movie.Name;
            model.TheaterName = theater.Name;
            model.Address = theater.address();
            model.BeginTime = show.BeginTime;
            model.Date = show.Date;
            model.NumberOfSeats = seats;
            model.TotalPaied = TotalPrice;
            model.Email = db.UserProfiles.Find(model.UserId).Email;

            return View(model);
        }

        [HttpPost]
        public ActionResult Create(ReservationModels reserve)
        {
            ViewBag.Success = false;

            reserve.SubmitDate = DateTime.Today;
            reserve.SubmitTime = DateTime.Now.TimeOfDay.ToString();
            reserve.Status = "V";
            try
            {
                db.Reservations.Add(reserve);
                db.SaveChanges();
                ViewBag.Success = true;
            }
            catch (Exception ex) { }

            return View("ReservationSave", reserve);
        }

        //
        // GET: /Reservation/Canel/5

        public ActionResult Cancel(int id = 0)
        {
            ReservationModels reservationmodels = db.Reservations.Find(id);
            if (reservationmodels == null)
            {
                return HttpNotFound();
            }
            return View(reservationmodels);
        }

        //
        // POST: /Reservation/Edit/5

        [HttpPost]
        public ActionResult Cancel(ReservationModels reservationmodels)
        {
            if (ModelState.IsValid)
            {
                reservationmodels.Status = "C";
                db.Entry(reservationmodels).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("AccountInfo", "Account", new { Message = AccountController.ManageMessageId.CancelReservationSuccess });
            }
            return View(reservationmodels);
        }

        //
        // GET: /Reservation/Delete/5

        public ActionResult Delete(int id = 0)
        {
            ReservationModels reservationmodels = db.Reservations.Find(id);
            if (reservationmodels == null)
            {
                return HttpNotFound();
            }
            return View(reservationmodels);
        }

        //
        // POST: /Reservation/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            ReservationModels reservationmodels = db.Reservations.Find(id);
            db.Reservations.Remove(reservationmodels);
            db.SaveChanges();
            return RedirectToAction("Reservations");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}