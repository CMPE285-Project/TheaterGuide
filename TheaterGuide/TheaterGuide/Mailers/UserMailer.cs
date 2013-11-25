using TheaterGuide.Models;
using Mvc.Mailer;

namespace TheaterGuide.Mailers
{ 
    public class UserMailer : MailerBase, IUserMailer 	
	{
		public UserMailer()
		{
			MasterName="Site";
		}
		
		public virtual MvcMailMessage Welcome(string sendTo, ReservationModels reserve)
		{
			ViewBag.Data = reserve;
			return Populate(x =>
			{
                x.Subject = "Theater Guide: Your reservation is confirmed";
				x.ViewName = "Welcome";
				x.To.Add(sendTo);
			});
		}
 	}
}