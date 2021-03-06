﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="Web3project_BookIT.Tickets1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <link href="assets/css/bootstrap.css" rel="stylesheet" />   
    <link href="css/Style1.css" rel="stylesheet" />   
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

  
    <div class="jumbotron" id="imageheader">

        <h1>BookIT.</h1>
        <p class="lead"></p>
        <h2>BookIT can help you find the perfect event or to make your own.</h2>
        <p class="lead">This is the BookIT website where you can purchase tickets 
            for events or log in as an event planner and post rickets to your event here.</p>
    </div>
    
    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                You can view all the tickets we have on sale or you can log-in and purchase tickets though our website.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Are You An Event Organizer?</h2>
            <p>
                Register with us today and sell your tickets from our website.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>
    <div class="container">
        <h2>Ticketmaster widget</h2>
           <div id="ev1" w-type="event-discovery" w-tmapikey="M2t2GVVu0fVlZlucU1G5tif4GYAvoKx7" w-googleapikey="AIzaSyBQrJ5ECXDaXVlICIdUBOe8impKIGHDzdA" w-keyword="Music" w-theme="simple" w-colorscheme="light" w-width="250" w-height="500" w-size="25" w-border="0" w-borderradius="4" w-postalcode="0000" w-radius="25" w-country="" w-period="year" w-layout="vertical" w-attractionid="" w-promoterid="" w-venueid="" w-affiliateid="" w-segmentid="" w-proportion="custom"></div>
           <div id="ev2" w-type="event-discovery" w-tmapikey="M2t2GVVu0fVlZlucU1G5tif4GYAvoKx7" w-googleapikey="AIzaSyBQrJ5ECXDaXVlICIdUBOe8impKIGHDzdA" w-keyword="Sport" w-theme="simple" w-colorscheme="light" w-width="250" w-height="500" w-size="25" w-border="0" w-borderradius="4" w-postalcode="0000" w-radius="25" w-country="" w-period="year" w-layout="vertical" w-attractionid="" w-promoterid="" w-venueid="" w-affiliateid="" w-segmentid="" w-proportion="custom" w-countrycode="IE"></div>
           <div id="ev3" w-type="event-discovery" w-tmapikey="M2t2GVVu0fVlZlucU1G5tif4GYAvoKx7" w-googleapikey="AIzaSyBQrJ5ECXDaXVlICIdUBOe8impKIGHDzdA" w-keyword="Family" w-theme="simple" w-colorscheme="light" w-width="250" w-height="500" w-size="25" w-border="0" w-borderradius="4" w-postalcode="0000" w-radius="25" w-country="" w-period="year" w-layout="vertical" w-attractionid="" w-promoterid="" w-venueid="" w-affiliateid="" w-segmentid="" w-proportion="custom" w-countrycode="IE"></div>
           <div id="ev4" w-type="event-discovery" w-tmapikey="M2t2GVVu0fVlZlucU1G5tif4GYAvoKx7" w-googleapikey="AIzaSyBQrJ5ECXDaXVlICIdUBOe8impKIGHDzdA" w-keyword="Theatre" w-theme="simple" w-colorscheme="light" w-width="250" w-height="500" w-size="25" w-border="0" w-borderradius="4" w-postalcode="0000" w-radius="25" w-country="" w-period="year" w-layout="vertical" w-attractionid="K8vZ9174_c7" w-promoterid="" w-venueid="" w-affiliateid="" w-segmentid="" w-proportion="custom" w-countrycode="IE"></div>
          
           <script src="https://ticketmaster-api-staging.github.io/products-and-docs/widgets/event-discovery/1.0.0/lib/main-widget.js"></script>
    </div>
    <div class="container">
        <h2>Ticketmaster Events</h2>
    <p id="location">location there</p>
    <div id="map"></div>
    <div id="events"></div>
 <script>  
 function myMap() {
  var mapCanvas = document.getElementById("map");
  var mapOptions = {
    center: new google.maps.LatLng(51.508742,-0.120850),
    zoom: 5
  };
  var map = new google.maps.Map(mapCanvas, mapOptions);
}
</script>
        <h2>Calculate your Ticket cost here</h2>
         <main class="container">

            <h1 class="jumbotron">Price Checker</h1>

            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <div class="form-group">

                <label class="col-sm-3 control-label">Ticket price</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtSalesPrice" runat="server" CssClass="form-control bold">100</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSalesPrice"
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtSalesPrice"
                        Display="Dynamic" ErrorMessage="Must be from 10 to 1000" CssClass="text-danger"
                        MaximumValue="1000" MinimumValue="10" Type="Double"></asp:RangeValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Discount percent</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtDiscountPercent" runat="server" CssClass="form-control">20</asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiscountPercent"
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtDiscountPercent" Display="Dynamic"
                        ErrorMessage="Must be from 10 to 50" CssClass="text-danger"
                        MaximumValue="50" MinimumValue="10" Type="Double"></asp:RangeValidator>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Discount amount</label>
                <asp:Label ID="lblDiscountAmount" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Total price</label>
                <asp:Label ID="lblTotalPrice" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-3">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate"
                        OnClick="btnCalculate_Click" CssClass="btn btn-primary" />
                </div>
            </div>

        </main>
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
    <script src="https://maps.googleapis.com/maps/api/js" async defer></script>
    </div>

     <script src="script.js"></script>
    <script src="assets/plugins/jquery-1.10.2.js"></script>
    <script src="assets/plugins/bootstrap.js"></script>
    <script src="assets/plugins/4jquery.parallax-1.1.3.js"></script>
    <script src="assets/js/custom.js"></script>
</asp:Content>