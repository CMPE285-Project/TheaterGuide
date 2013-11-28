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
    public class TheaterApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/TheaterApi
        public IEnumerable<TheaterModels> GetTheaterModels()
        {
            return db.Theaters.AsEnumerable();
        }

        // GET api/TheaterApi/Search?searchString={}
        [HttpGet]
        public IEnumerable<TheaterModels> Search(string searchString)
        {
            var theaters = from t in db.Theaters
                         select t;

            if (!String.IsNullOrEmpty(searchString))
            {
                theaters = theaters.Where(s => s.Name.Contains(searchString));
            }

            return theaters;
        }

        // GET api/TheaterApi/5
        public TheaterModels GetTheaterModels(int id)
        {
            TheaterModels theatermodels = db.Theaters.Find(id);
            if (theatermodels == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return theatermodels;
        }
    }
}