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
        public int MovieId { get; set; }
        [Required]
        public int NumberOfSeats { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C}")]
        public double TotalPaied { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}")]
        public DateTime SubmitDate { get; set; }
        [Required]
        public string SubmitTime { get; set; }
        [Required]
        public string Status { get; set; }  // V: valid  C: cancelled
    }
}