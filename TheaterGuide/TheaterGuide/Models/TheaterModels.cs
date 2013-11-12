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

        public string address()
        {
            return (this.Address + ", " + this.City + ", " + this.State + ", " + this.Zip);
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
        [Display(Name="Zip Code")]
        [RegularExpression("[0-9]*", ErrorMessage = "Zip Code should be numbers.")]
        public string Zip { get; set; }
        public string Phone { get; set; }
        public string Hours { get; set; }
        [Display(Name = "Price Range")]
        public string PriceRange { get; set; }
        [RegularExpression("[0-5]", ErrorMessage = "Rating should be within 0 to 5.")]
        public int Rating { get; set; }
        [DataType(DataType.Url)]
        public string WebSite { get; set; }

        public List<ShowModels> Shows { get; set; }
    }
/*
    public class TheaterViewModel
    {
        [Required]
        public int TheaterId { get; set; }
        [Required]
        [Display(Name = "Theater")]
        public string Name { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C}")]
        public double Price { get; set; }
        [Required]
        [Display(Name = "Begin Time")]
        public string BeginTime { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime Date { get; set; }
        [Display(Name = "Available Seat")]
        public int AvailableSeat { get; set; }
        public double Discount { get; set; }
    }
 */ 
}