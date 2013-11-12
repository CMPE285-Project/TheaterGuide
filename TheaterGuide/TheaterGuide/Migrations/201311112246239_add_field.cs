namespace TheaterGuide.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class add_field : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Reservation", "MovieName", c => c.String(nullable: false));
            AddColumn("dbo.Reservation", "TheaterName", c => c.String(nullable: false));
            AddColumn("dbo.Reservation", "Address", c => c.String(nullable: false));
            AddColumn("dbo.Reservation", "BeginTime", c => c.String(nullable: false));
            AddColumn("dbo.Reservation", "Date", c => c.DateTime(nullable: false));
            AddColumn("dbo.Reservation", "Email", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Reservation", "Email");
            DropColumn("dbo.Reservation", "Date");
            DropColumn("dbo.Reservation", "BeginTime");
            DropColumn("dbo.Reservation", "Address");
            DropColumn("dbo.Reservation", "TheaterName");
            DropColumn("dbo.Reservation", "MovieName");
        }
    }
}
