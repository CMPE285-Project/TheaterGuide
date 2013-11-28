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
    public class ShowApiController : ApiController
    {
        private UsersContext db = new UsersContext();

        // GET api/ShowApi
        // GET api/ShowApi/Search?theaterId={}&movieId={}&showId={}
        [HttpGet]
        public IEnumerable<SearchViewModel> Search(int theaterId = 0, int movieId = 0, int showId=0)
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
            if (theaterId != 0)
            {
                shows = shows.Where(s => s.TheaterId == theaterId);
            }
            if (movieId != 0)
            {
                shows = shows.Where(s => s.MovieId == movieId);
            }
            if (showId != 0)
            {
                shows = shows.Where(s => s.ShowId == showId);
            }
            return shows;
        }
    }
}