Public Class About
    Inherits BasePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Try

        Catch ex As Exception
            Console.WriteLine(ex)
        End Try
    End Sub
End Class