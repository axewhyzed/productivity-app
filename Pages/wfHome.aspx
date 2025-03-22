<%@ Page Title="Home" Language="VB" MasterPageFile="~/Pages/MasterLayout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.vb" Inherits="ProductivityApp.Home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <p>Welcome to Flowcus! Organize your tasks, projects, and notes efficiently.</p>
    </main>
</asp:Content>
