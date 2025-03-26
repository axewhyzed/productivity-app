<%@ Page Title="Calendar" Language="VB" MasterPageFile="~/Pages/MasterLayout.Master" AutoEventWireup="true" CodeBehind="wfCalender.aspx.vb" Inherits="ProductivityApp.Calender" %>

<asp:Content ID="ContentHeader" ContentPlaceHolderID="HeaderContent" runat="server">
    <div class="breadcrumb">
        <a href="~/Pages/wfDashboard">Dashboard</a> &gt; Tasks
    </div>
    <select id="drpCalendarView" name="drpCalendarView">
        <option value="dayGridMonth">Month View</option>
        <option value="multiMonthYear">Multi Month View</option>
        <option value="timeGridWeek">Week Day View</option>
    </select>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    <main id="calendar-container" aria-labelledby="title">
        <div id="calendar"></div>
    </main>
    <script type="text/javascript">
        $(document).ready(function () {
            var calenderEle = $('#calendar');
            var calenderView = $('#drpCalendarView');

            initFullCalender(calenderEle[0], calenderView.val());

            calenderView.on('change', function() {
                initFullCalender(calenderEle[0], $(this).val());
            });
        });

        function initFullCalender(ele, view) {
            const calendar = new FullCalendar.Calendar(ele, {
                themeSystem: 'bootstrap5',
                initialView: view,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                },
                weekNumbers: true,
                dayMaxEvents: true, // allow "more" link when too many events
                events: 'https://fullcalendar.io/api/demo-feeds/events.json'
            });
            calendar.render();
        }
    </script>
    <style type="text/css">
        #calendar a{
            text-decoration: none;
        }
    </style>
</asp:Content>
