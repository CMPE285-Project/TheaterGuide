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
using TheaterGuide.Models;

namespace TheaterGuide.API
{
    public class UserApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/UserApi/5
        public UserProfile GetUserProfile(int id)
        {
            UserProfile userprofile = db.UserProfiles.Find(id);
            if (userprofile == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return userprofile;
        }

        // PUT api/UserApi/5
        public HttpResponseMessage PutUserProfile(int id, UserProfile userprofile)
        {
            if (ModelState.IsValid && id == userprofile.UserId)
            {
                db.Entry(userprofile).State = EntityState.Modified;

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

        // POST api/UserApi
        public HttpResponseMessage PostUserProfile(UserProfile userprofile)
        {
            if (ModelState.IsValid)
            {
                db.UserProfiles.Add(userprofile);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, userprofile);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = userprofile.UserId }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }
    }
}