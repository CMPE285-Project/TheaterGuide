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
using WebMatrix.WebData;
using Mvc.Mailer;
using TheaterGuide.Filters;
using TheaterGuide.Mailers;
using TheaterGuide.Models;
using TheaterGuide.API.Authorization;

namespace TheaterGuide.API
{
    [InitializeSimpleMembership]
    public class ReservationApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/ReservationApi/{}
        [BasicHttpAuthorizeAttribute(RequireAuthentication = true)]
        public ReservationModels GetReservationModels(int id)
        {
            ReservationModels reservationmodels = db.Reservations.Find(id);
            if (reservationmodels == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }
            else if (WebSecurity.GetUserId(User.Identity.Name) != reservationmodels.UserId)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.Unauthorized));
            }

            return reservationmodels;
        }

        // GET api/ReservationApi/Search?userId={}
        [HttpGet]
        [BasicHttpAuthorizeAttribute(RequireAuthentication = true)]
        public IEnumerable<ReservationModels> Search(int userId)
        {
            var reserves = from m in db.Reservations
                           select m;
            if (userId == WebSecurity.GetUserId(User.Identity.Name))
            {
                reserves = reserves.Where(s => s.UserId == userId);
                return reserves;
            }
            else
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.Unauthorized));
            }
            
        }

        // Patch api/ReservationApi/{}
        [AcceptVerbs("PATCH")]
        [BasicHttpAuthorizeAttribute(RequireAuthentication = true)]
        public HttpResponseMessage CancelReservation(int id)
        {
            ReservationModels reserve = db.Reservations.Find(id);
            ShowModels show = db.Shows.Find(reserve.ShowId);
            if (reserve != null && WebSecurity.GetUserId(User.Identity.Name) == reserve.UserId)
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
        [BasicHttpAuthorizeAttribute(RequireAuthentication = true)]
        public HttpResponseMessage PostReservationModels([FromBody]ReservationModels reserve)
        {
            ShowModels show = db.Shows.Find(reserve.ShowId);
            if (WebSecurity.GetUserId(User.Identity.Name) != reserve.UserId) 
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }

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
                reserve.Email = db.UserProfiles.Find(reserve.UserId).Email;
                reserve.SubmitDate = DateTime.Today;
                reserve.SubmitTime = DateTime.Now.TimeOfDay.ToString();
                reserve.Status = "V";

                try
                {
                    db.Entry(show).State = EntityState.Modified;
                    db.Reservations.Add(reserve);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    HttpError runtimeError = new HttpError("Sorry, your reservation is failed." + ex.Message) { { "CustomErrorCode", 38 } };
                    return Request.CreateResponse(HttpStatusCode.BadRequest, runtimeError);
                }

                try
                {
                    SendWelcomeMessage(reserve.Email, reserve);
                }
                catch (Exception ex)
                {//if email sent failed, do nonthing here
                }

                //return the link to the new reservation
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, reserve);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = reserve.ReserveId }));
                return response;
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