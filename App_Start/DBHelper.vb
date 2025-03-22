Imports System
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text
Imports System.Configuration ' For Web.config access

Public Module DBHelper
    Private ReadOnly connectionString As String

    ' Static Constructor to Set Connection String
    Sub New()
        ' Read Encrypted Connection String from Web.config
        Dim encryptedConnString As String = ConfigurationManager.AppSettings("DBConnectionString")
        ' Read Decryption Key from Environment Variable
        Dim encryptionKey As String = Environment.GetEnvironmentVariable("ENCRYPTION_KEY")

        ' Ensure values exist
        If String.IsNullOrEmpty(encryptedConnString) OrElse String.IsNullOrEmpty(encryptionKey) Then
            Throw New Exception("Missing encrypted connection string or decryption key.")
        End If

        ' Decrypt Connection String
        connectionString = DecryptString(encryptedConnString, encryptionKey)
    End Sub

    ' Decrypt the connection string using AES
    Private Function DecryptString(encryptedText As String, key As String) As String
        Dim fullCipher As Byte() = Convert.FromBase64String(encryptedText)
        Dim iv As Byte() = fullCipher.Take(16).ToArray()
        Dim cipherText As Byte() = fullCipher.Skip(16).ToArray()

        Using aes As Aes = Aes.Create()
            aes.Key = Encoding.UTF8.GetBytes(key)
            aes.IV = iv
            aes.Mode = CipherMode.CBC
            aes.Padding = PaddingMode.PKCS7

            Using decryptor As ICryptoTransform = aes.CreateDecryptor()
                Dim decryptedBytes As Byte() = decryptor.TransformFinalBlock(cipherText, 0, cipherText.Length)
                Return Encoding.UTF8.GetString(decryptedBytes)
            End Using
        End Using
    End Function

    ' Execute Queries Securely
    Public Function ExecuteQuery(query As String, Optional parameters As Dictionary(Of String, Object) = Nothing) As DataTable
        Dim result As New DataTable()

        Using conn As New SqlConnection(connectionString)
            conn.Open()
            Using cmd As New SqlCommand(query, conn)
                If parameters IsNot Nothing Then
                    For Each param In parameters
                        cmd.Parameters.AddWithValue(param.Key, param.Value)
                    Next
                End If

                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(result)
                End Using
            End Using
        End Using

        Return result
    End Function
End Module
