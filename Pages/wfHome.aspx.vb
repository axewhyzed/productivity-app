Public Class Home
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Try
            If Session("currentUser") Is Nothing Then
                Response.Redirect("~/Pages/wfLogin") ' Redirect if not logged in
            End If
        Catch ex As Exception
            Console.Write(ex)
        End Try
    End Sub
End Class