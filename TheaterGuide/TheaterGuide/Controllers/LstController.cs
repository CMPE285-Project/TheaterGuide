using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheaterGuide.Models;

namespace TheaterGuide.Controllers
{
    public class LstController : Controller
    {
        private UsersContext db = new UsersContext();

        public List<SelectListItem> GetDistinctTheaterLst()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            var theater = (from m in db.Theaters select m.Name).Distinct().ToList();

            foreach (var t in theater)
            {
                lst.Add(new SelectListItem()
                {
                    Text = t,
                    Value = t
                });
            }

            return lst;
        }

        public List<SelectListItem> GetDistinctCityLst()
        {
            List<SelectListItem> lst = new List<SelectListItem>();
            var city = (from m in db.Theaters select m.City).Distinct().ToList();

            foreach (var c in city)
            {
                lst.Add(new SelectListItem()
                {
                    Text = c,
                    Value = c
                });
            }

            return lst;
        }

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

    }
}
