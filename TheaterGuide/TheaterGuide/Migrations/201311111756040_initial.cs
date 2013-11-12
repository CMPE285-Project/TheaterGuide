namespace TheaterGuide.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.UserProfile",
                c => new
                    {
                        UserId = c.Int(nullable: false, identity: true),
                        UserName = c.String(nullable: false, maxLength: 20),
                        Email = c.String(nullable: false),
                        UserType = c.String(nullable: false, maxLength: 1),
                    })
                .PrimaryKey(t => t.UserId);
            
            CreateTable(
                "dbo.Reservation",
                c => new
                    {
                        ReserveId = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        ShowId = c.Int(nullable: false),
                        NumberOfSeats = c.Int(nullable: false),
                        TotalPaied = c.Double(nullable: false),
                        SubmitDate = c.DateTime(nullable: false),
                        SubmitTime = c.String(nullable: false),
                        Status = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ReserveId)
                .ForeignKey("dbo.UserProfile", t => t.UserId, cascadeDelete: true)
                .ForeignKey("dbo.ShowInfo", t => t.ShowId, cascadeDelete: true)
                .Index(t => t.UserId)
                .Index(t => t.ShowId);
            
            CreateTable(
                "dbo.TheaterInfo",
                c => new
                    {
                        TheaterId = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Address = c.String(nullable: false),
                        City = c.String(nullable: false),
                        State = c.String(nullable: false),
                        Zip = c.String(nullable: false),
                        Phone = c.String(),
                        Hours = c.String(),
                        PriceRange = c.String(),
                        Rating = c.Int(nullable: false),
                        WebSite = c.String(),
                    })
                .PrimaryKey(t => t.TheaterId);
            
            CreateTable(
                "dbo.ShowInfo",
                c => new
                    {
                        ShowId = c.Int(nullable: false, identity: true),
                        MovieId = c.Int(nullable: false),
                        TheaterId = c.Int(nullable: false),
                        Price = c.Double(nullable: false),
                        BeginTime = c.String(nullable: false),
                        Date = c.DateTime(nullable: false),
                        AvailableSeat = c.Int(nullable: false),
                        Discount = c.Double(nullable: false),
                    })
                .PrimaryKey(t => t.ShowId)
                .ForeignKey("dbo.TheaterInfo", t => t.TheaterId, cascadeDelete: true)
                .ForeignKey("dbo.MovieInfo", t => t.MovieId, cascadeDelete: true)
                .Index(t => t.TheaterId)
                .Index(t => t.MovieId);
            
            CreateTable(
                "dbo.MovieInfo",
                c => new
                    {
                        MovieId = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false),
                        Director = c.String(nullable: false),
                        Description = c.String(),
                        ReleaseDate = c.DateTime(nullable: false),
                        RunTime = c.Int(nullable: false),
                        Rating = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MovieId);
            
        }
        
        public override void Down()
        {
            DropIndex("dbo.ShowInfo", new[] { "MovieId" });
            DropIndex("dbo.ShowInfo", new[] { "TheaterId" });
            DropIndex("dbo.Reservation", new[] { "ShowId" });
            DropIndex("dbo.Reservation", new[] { "UserId" });
            DropForeignKey("dbo.ShowInfo", "MovieId", "dbo.MovieInfo");
            DropForeignKey("dbo.ShowInfo", "TheaterId", "dbo.TheaterInfo");
            DropForeignKey("dbo.Reservation", "ShowId", "dbo.ShowInfo");
            DropForeignKey("dbo.Reservation", "UserId", "dbo.UserProfile");
            DropTable("dbo.MovieInfo");
            DropTable("dbo.ShowInfo");
            DropTable("dbo.TheaterInfo");
            DropTable("dbo.Reservation");
            DropTable("dbo.UserProfile");
        }
    }
}
