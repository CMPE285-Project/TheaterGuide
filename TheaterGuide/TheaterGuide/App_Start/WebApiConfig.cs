﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace TheaterGuide
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
           
            config.Routes.MapHttpRoute(
                name: "SearchApi",
                routeTemplate: "api/{controller}/Search"
            );

            config.Routes.MapHttpRoute(
               name: "DefaultApi",
               routeTemplate: "api/{controller}/{id}",
               defaults: new { id = RouteParameter.Optional }
           );

        }
    }
}
