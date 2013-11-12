using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TheaterGuide.Models
{
    [Table("ShowInfo")]
    public class ShowModels
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ShowId { get; set; }
        [Required]
        public int MovieId { get; set; }
        [Required]
        public int TheaterId { get; set; }
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

        public List<ReservationModels> Reservations { get; set; }
    }

    public class SearchViewModel
    {
        public int UserId { get; set; }
        public int ShowId { get; set; }
        public int MovieId { get; set; }
        public int TheaterId { get; set; }
        [Display(Name = "User Name")]
        public int UserName { get; set; }
        [Display(Name = "Movie")]
        public string MovieName { get; set; }
        [Display(Name = "Theater")]
        public string TheaterName { get; set; }
        [Display(Name = "Theater Address")]
        public string Address { get; set; }
        [DisplayFormat(DataFormatString = "{0:C}")]
        public double Price { get; set; }
        [Display(Name = "Begin Time")]
        public string BeginTime { get; set; }
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime Date { get; set; }
        [Display(Name = "Available Seat")]
        public int AvailableSeat { get; set; }
        public double Discount { get; set; }
    }
}