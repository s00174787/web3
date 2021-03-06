﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web3project_BookIT.Controllers;

namespace Web3project_BookIT.Admin
{
    public partial class AdminPage : System.Web.UI.Page
    {
        //Admin Actions Add Remove Ticket & Add Venue to the DB.
        protected void Page_Load(object sender, EventArgs e)
        {
            string TicketAction = Request.QueryString["TicketAction"];
            string VenueAction = Request.QueryString["VenueAction"];
            if (TicketAction == "add")
            {
                LabelAddStatus.Text = "Ticket added!";
            }

            if (TicketAction == "remove")
            {
                LabelRemoveStatus.Text = "Ticket removed!";
            }
            if (VenueAction == "add")
            {
                LabelAddVenue.Text = "Venue added!";
            }
        }

        //Add the ticket with image
        protected void AddTicketButton_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            String path = Server.MapPath("~/Catalog/Images/");
            if (TicketImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(TicketImage.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    // Save to Images folder.
                    TicketImage.PostedFile.SaveAs(path + TicketImage.FileName);
                    // Save to Images/Thumbs folder.
                    TicketImage.PostedFile.SaveAs(path + "Thumbs/" + TicketImage.FileName);
                }
                catch (Exception ex)
                {
                    LabelAddStatus.Text = ex.Message;
                }

                // Add ticket data to DB.
                AddTickets Tickets = new AddTickets();
                bool addSuccess = Tickets.AddTicket(AddTicketName.Text, AddTicketTime.Text, AddTicketDate.Text, AddTicketDescription.Text, DropDownAddCategory.SelectedValue,
                    AddTicketPrice.Text, DropDownAddCategory.SelectedValue, TicketImage.FileName);
                if (addSuccess)
                {
                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?TicketAction=add");
                }
                else
                {
                    LabelAddStatus.Text = "Unable to add new ticket to database.";
                }
            }
            else
            {
                LabelAddStatus.Text = "Unable to accept file type.";
            }
        }

        public IQueryable GetCategories()
        {
            var _db = new Models.TicketContext();
            IQueryable query = _db.Categories;
            return query;
        }

        public IQueryable GetTickets()
        {
            var _db = new Models.TicketContext();
            IQueryable query = _db.Ticket;
            return query;
        }

        public IQueryable GetVenues()
        {
            var _db = new Models.TicketContext();
            IQueryable query = _db.Venues;
            return query;
        }

        protected void RemoveTicketButton_Click(object sender, EventArgs e)
        {
            using (var _db = new Models.TicketContext())
            {
                int TicketId = Convert.ToInt16(DropDownRemoveTicket.SelectedValue);
                var myItem = (from c in _db.Ticket where c.TicketID == TicketId select c).FirstOrDefault();
                if (myItem != null)
                {
                    _db.Ticket.Remove(myItem);
                    _db.SaveChanges();

                    // Reload the page.
                    string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect(pageUrl + "?TicketAction=remove");
                }
                else
                {
                    LabelRemoveStatus.Text = "Unable to locate ticket.";
                }
            }
        }
        protected void AddVenueButton_Click(object sender, EventArgs e)
        {
            // Add ticket data to DB.
            AddVenues Venues = new AddVenues();
            bool addSuccess = Venues.AddVenue(VenueName.Text, VenueAdd1.Text, VenueAdd2.Text, VenueCity.Text, VenueCounty.Text, VenueCapacity.Text);
            if (addSuccess)
            {
                // Reload the page.
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect(pageUrl + "?VenueAction=add");
            }
            else
            {
                LabelAddStatus.Text = "Unable to add new venue to database.";
            }
        }
    }
}