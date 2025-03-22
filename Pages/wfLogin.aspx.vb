Imports System.Security.Cryptography

Partial Class wfLogin
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        If String.IsNullOrEmpty(username) OrElse String.IsNullOrEmpty(password) Then
            lblMessage.Text = "Please enter username and password."
            Exit Sub
        End If

        ' Fetch user from DB
        Dim query As String = "SELECT [password] FROM UserList WHERE username = @username"
        Dim parameters As New Dictionary(Of String, Object) From {
            {"@username", username}
        }
        Dim dt As DataTable = DBHelper.ExecuteQuery(query, parameters)

        ' Check if user exists
        If dt.Rows.Count = 0 Then
            lblMessage.Text = "Invalid username or password."
            Exit Sub
        End If

        ' Verify Password
        Dim storedEncryptedPassword As String = dt.Rows(0)("password").ToString()
        If VerifyPassword(password, storedEncryptedPassword) Then
            ' Store username in session
            Session("currentUser") = username
            Response.Redirect("~/Pages/wfHome") ' Redirect to main page
        Else
            lblMessage.Text = "Invalid username or password."
        End If
    End Sub

    ' Function to verify hashed password
    Private Function VerifyPassword(plainPassword As String, encryptedPassword As String) As Boolean
        Dim plainHash As String = HashPassword(plainPassword)
        Return String.Equals(plainHash, encryptedPassword)
    End Function

    ' Hash the password (Same hashing method used while saving)
    Private Function HashPassword(password As String) As String
        Using sha256 As SHA256 = sha256.Create()
            Dim bytes As Byte() = Encoding.UTF8.GetBytes(password)
            Dim hash As Byte() = sha256.ComputeHash(bytes)
            Return Convert.ToBase64String(hash)
        End Using
    End Function
End Class
