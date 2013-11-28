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
    public class MovieApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/MovieApi
        public IEnumerable<MovieModels> GetMovieModels()
        {
            return db.Movies.AsEnumerable();
        }

        // GET api/MovieApi/Search?searchString={}
        [HttpGet]
        public IEnumerable<MovieModels> Search(string searchString)
        {
            var movies = from m in db.Movies
                         select m;

            if (!String.IsNullOrEmpty(searchString))
            {
                movies = movies.Where(s => s.Name.Contains(searchString));
            }

            return movies;
        }

        // GET api/MovieApi/5
        public MovieModels GetMovieModels(int id)
        {
            MovieModels moviemodels = db.Movies.Find(id);
            if (moviemodels == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return moviemodels;
        }
    }
}