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
            this.Rating = 0;
        }

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int MovieId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Director { get; set; }
        public string Description { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:d}")]
        [Display(Name = "Release Date")]
        public DateTime ReleaseDate { get; set; }
        [Required]
        [Display(Name = "RunTime(mins)")]
        public int RunTime { get; set; }
        [Required]       
        [RegularExpression("[0-5]", ErrorMessage = "Rating should be within 0 to 5.")]
        public int Rating { get; set; }
      
        public List<ShowModels> Shows { get; set; }
    }
}