<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication5._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .move
        {

            padding-left: 0;
        }
    </style>

    <div class="jumbotron">
        <asp:Label ID="labelLogin" runat="server" Text="Login: (Username/Password)"></asp:Label><br />
        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox><br /><br />
        <asp:Label ID="labelError" runat="server" Text="Failed to login try again" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />


        <h1>Scuba Cops</h1>
        <p class="lead">Scuba Cops Loot, Raids, Roster, & Attendance management.</p>
        <p><a href="http://scubacops.shivtr.com" target="_blank" class="btn btn-primary btn-lg">Scuba Cops Shivtr &raquo;</a></p>


    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                Scuba Cops Loot, Raids Roster, & Attendance management.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
