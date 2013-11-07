using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TheaterGuide.Models
{
    [Table("MovieInfo")]
    public class MovieModels
    {
        public MovieModels()
        {
            this.TheaterId = 1;
            this.Rating = 0;
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int MovieId { get; set; }
        public int TheaterId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Director { get; set; }
        public string Description { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C}")]
        public double Price { get; set; }
        [Required]
        public string BeginTime { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime Date { get; set; }
        [Required]
        public int RunTime { get; set; }
        [Required]
        public int TotalVolume { get; set; }
        [Required]
        public int AvailableSeat { get; set; }
        public double Discount { get; set; }
        [RegularExpression("[0-5]", ErrorMessage = "Rating should be within 0 to 5.")]
        public int Rating { get; set; }

        public List<ReservationModels> Reservations { get; set; }
    }
/*
    public class MovieContext : DbContext
    {
        public MovieContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<MovieModels> Movies { get; set; }
    }
 */
}