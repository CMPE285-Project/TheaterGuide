using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace TheaterGuide.Models
{
    [Table("Reservation")]
    public class ReservationModels
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ReserveId { get; set; }
        public int UserId { get; set; }
        public int ShowId { get; set; }
        [Required]
        [Display(Name = "Movie")]
        public string MovieName { get; set; }
        [Required]
        [Display(Name = "Theater")]
        public string TheaterName { get; set; }
        [Required]
        public string Address { get; set; }
        [Required]
        [Display(Name = "Begin Time")]
        public string BeginTime { get; set; }
        //[Required]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime Date { get; set; }
        //[Required]
        [Display(Name = "Number of Seat")]
        [RegularExpression("^[1-9]", ErrorMessage = "Qty should be positive number.")]
        public int NumberOfSeats { get; set; }
        //[Required]
        [DisplayFormat(DataFormatString = "{0:C}")]
        [Display(Name = "Total Price")]
        public double TotalPaied { get; set; }
        [Required]
        public string Email { get; set; }
        //[Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}")]
        [Display(Name = "Submit Date")]
        public DateTime SubmitDate { get; set; }
        [Required]
        [Display(Name = "Submit Time")]
        public string SubmitTime { get; set; }
        [Required]
        public string Status { get; set; }  // V: valid  C: cancelled
    }
}