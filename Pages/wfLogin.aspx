<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="wfLogin.aspx.vb" Inherits="ProductivityApp.wfLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
    <link href="../Content/css/app.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* Reset default styling for some elements */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Set the body and html to take full height */
        html, body {
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        /* Center the form on the page */
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

            /* Title styling */
            .login-container h2 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }

            /* Input field styling */
            input[type="text"], input[type="password"], .login-container .aspTextBox {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                color: #555;
            }

                /* Focus effect for input fields */
                input[type="text"]:focus, input[type="password"]:focus {
                    border-color: #007bff;
                    outline: none;
                }

            /* Button styling */
            button, .login-container .login-btn {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
            }

                /* Hover effect for button */
                button:hover, .login-container .login-btn:hover {
                    background-color: #0056b3;
                }

        /* Error message styling */
        label {
            margin-top: 10px;
            font-size: 14px;
            color: red;
            display: block;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="login-container">
            <h2>Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" CssClass="login-btn" Text="Login" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
