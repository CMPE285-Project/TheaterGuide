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
            ReservationModels reservationmodels = db.Reservations.Find(id);
            if (reservationmodels == null)
            {
                return HttpNotFound();
            }
            return View(reservationmodels);
        }

        //
        // GET: /Reservation/Create
        
        public ActionResult Create(int id, int seats)
        {
            ViewBag.ReturnUrl = Url.Action("Create", new { id, seats});

            MovieModels movie = db.Movies.Find(id);
            double TotalPrice = movie.Price * seats * movie.Discount;

            ReservationModels model = new ReservationModels();
            model.MovieId = movie.MovieId;
            model.NumberOfSeats = seats;
            model.TotalPaied = TotalPrice;
            model.SubmitDate = DateTime.Today;
            model.SubmitTime = DateTime.Now.TimeOfDay.ToString();
            model.UserId = WebSecurity.GetUserId(User.Identity.Name);
            model.Status = "V";

            return View(model);
        }

        [HttpPost]
        public ActionResult Create(ReservationModels reservationmodels)
        {
            ViewBag.Success = false;
            if (ModelState.IsValid)
            {
                db.Reservations.Add(reservationmodels);
                db.SaveChanges();
                ViewBag.Success = true;
            }

            return View("ReservationSave", reservationmodels);
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