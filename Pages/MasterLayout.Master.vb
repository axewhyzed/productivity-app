Public Class MasterLayout
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Clear() ' or Session.Abandon() as needed
        Response.Redirect("~/Pages/wfLogin")
    End Sub
End Class