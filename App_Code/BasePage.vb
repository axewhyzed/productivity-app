Public Class BasePage
    Inherits System.Web.UI.Page

    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Try
            ' Check if user session exists
            If Session("currentUser") Is Nothing Then
                Response.Redirect("~/Pages/wfLogin") ' Redirect to login page
            End If
        Catch ex As Exception
            Console.WriteLine(ex)
        End Try
    End Sub
End Class
