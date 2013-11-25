using TheaterGuide.Models;
using Mvc.Mailer;

namespace TheaterGuide.Mailers
{ 
    public interface IUserMailer
    {
			MvcMailMessage Welcome(string sendTo, ReservationModels reserve);
	}
}