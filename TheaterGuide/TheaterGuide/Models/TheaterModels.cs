using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheaterGuide.Models
{
    [Table("TheaterInfo")]
    public class TheaterModels
    {
        public TheaterModels()
        {
            this.Rating = 0;
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int TheaterId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        [RegularExpression("[0-9]*", ErrorMessage = "Zip Code should be numbers.")]
        public string Zip { get; set; }
        public string Phone { get; set; }
        public string Hours { get; set; }
        public string PriceRange { get; set; }
        [RegularExpression("[0-5]", ErrorMessage = "Rating should be within 0 to 5.")]
        public int Rating { get; set; }
        public List<MovieModels> Movies { get; set; }
    }
}