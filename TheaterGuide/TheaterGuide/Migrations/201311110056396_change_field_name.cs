namespace TheaterGuide.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class change_field_name : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.TheaterInfo", "Address", c => c.String(nullable: false));
            AddColumn("dbo.TheaterInfo", "Phone", c => c.String());
            DropColumn("dbo.TheaterInfo", "Adress");
            DropColumn("dbo.TheaterInfo", "Phones");
        }
        
        public override void Down()
        {
            AddColumn("dbo.TheaterInfo", "Phones", c => c.String());
            AddColumn("dbo.TheaterInfo", "Adress", c => c.String(nullable: false));
            DropColumn("dbo.TheaterInfo", "Phone");
            DropColumn("dbo.TheaterInfo", "Address");
        }
    }
}
