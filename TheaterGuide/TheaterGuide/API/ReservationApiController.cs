using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Mvc.Mailer;
using TheaterGuide.Mailers;
using TheaterGuide.Models;

namespace TheaterGuide.API
{
    public class ReservationApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/ReservationApi/{}
        public ReservationModels GetReservationModels(int id)
        {
            ReservationModels reservationmodels = db.Reservations.Find(id);
            if (reservationmodels == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return reservationmodels;
        }

        // GET api/ReservationApi/Search?userId={}
        [HttpGet]
        public IEnumerable<ReservationModels> Search(int userId=0)
        {
            var reserves = from m in db.Reservations
                           select m;
            if (userId != 0)
            {
                reserves = reserves.Where(s => s.UserId == userId);
            }
            return reserves;
        }

        // Patch api/ReservationApi/{}
        [AcceptVerbs("PATCH")]
        public HttpResponseMessage CancelReservation(int id)
        {
            ReservationModels reserve = db.Reservations.Find(id);
            ShowModels show = db.Shows.Find(reserve.ShowId);
            if (reserve != null)
            {
                if (reserve.Status == "C" || reserve.Date <= DateTime.Now) 
                {
                    HttpError cancelError = new HttpError("Invalid cancel operation. The reservation is already cancelled or the show date has passed.") { { "CustomErrorCode", 35 } };
                    return Request.CreateResponse(HttpStatusCode.BadRequest, cancelError);
                }

                db.Entry(reserve).State = EntityState.Modified;
                reserve.Status = "C";
                db.Entry(show).State = EntityState.Modified;
                show.AvailableSeat += reserve.NumberOfSeats;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // POST api/ReservationApi
        public HttpResponseMessage PostReservationModels([FromBody]ReservationModels reserve)
        {
            ShowModels show = db.Shows.Find(reserve.ShowId);

            if (show == null)
            {
                HttpError runtimeError = new HttpError("Sorry, the show reserved no longer exists.") { { "CustomErrorCode", 36 } };
                return Request.CreateResponse(HttpStatusCode.BadRequest, runtimeError);
            }

            if (show.Date <= DateTime.Now)
            {
                HttpError cancelError = new HttpError("The show date " + show.Date.ToShortDateString() + " has passed.") { { "CustomErrorCode", 37 } };
                return Request.CreateResponse(HttpStatusCode.BadRequest, cancelError);
            }

            if (show.AvailableSeat >= reserve.NumberOfSeats)
            {
                show.AvailableSeat -= reserve.NumberOfSeats;
                reserve.BeginTime = show.BeginTime;
                reserve.Date = show.Date;
                reserve.SubmitDate = DateTime.Today;
                reserve.SubmitTime = DateTime.Now.TimeOfDay.ToString();
                reserve.Status = "V";

                try
                {
                    db.Entry(show).State = EntityState.Modified;
                    db.Reservations.Add(reserve);
                    db.SaveChanges();
                    SendWelcomeMessage(reserve.Email, reserve);
                    HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, reserve);
                    response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = reserve.ReserveId }));
                    return response;
                }
                catch (Exception ex)
                {
                    HttpError runtimeError = new HttpError("Sorry, your reservation is failed due to unknown reason.") { { "CustomErrorCode", 38 } };
                    return Request.CreateResponse(HttpStatusCode.BadRequest, runtimeError);
                }
            }
            else
            {
                HttpError reserveError = new HttpError("Sorry, there is not enough available seats. \nThe total seats available now is " +
                    show.AvailableSeat) { { "CustomErrorCode", 39 } };
                return Request.CreateResponse(HttpStatusCode.BadRequest, reserveError);
            }
        }

        // send email helper
        private IUserMailer _userMailer = new UserMailer();
        public IUserMailer UserMailer
        {
            get { return _userMailer; }
            set { _userMailer = value; }
        }

        public void SendWelcomeMessage(string sendTo, ReservationModels reserve)
        {
            UserMailer.Welcome(sendTo, reserve).Send(); 
        }
    }
}