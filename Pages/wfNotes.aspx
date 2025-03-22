<%@ Page Title="Notes" Language="VB" MasterPageFile="~/Pages/MasterLayout.Master" AutoEventWireup="true" CodeBehind="wfNotes.aspx.vb" Inherits="ProductivityApp.Notes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
        <p>Jot down important thoughts and notes here.</p>
    </main>
</asp:Content>
