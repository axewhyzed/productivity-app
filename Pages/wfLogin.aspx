<%@ Page Language="VB" AutoEventWireup="true" CodeBehind="wfLogin.aspx.vb" Inherits="ProductivityApp.wfLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>
    <link href="../Content/css/app.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* Base Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Basic Page Setup */
html, body {
    width: 100%;
    height: 100%;
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Login Form Container */
.login-container {
    width: 100%;
    max-width: 420px; /* Increased slightly for better spacing */
    padding: 25px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

/* Title */
.login-container h2 {
    margin-bottom: 20px;
    font-size: 26px; /* Slightly bigger */
    color: #333;
}

/* Input Fields */
.login-container input[type="text"],
.login-container input[type="password"] {
    width: 100%;
    padding: 12px; /* More padding for easier touch interaction */
    margin: 12px 0;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-size: 18px; /* Slightly bigger text */
    color: #555;
}

/* Input Focus State */
.login-container input[type="text"]:focus,
.login-container input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
}

/* Button */
.login-container button,
.login-container .login-btn {
    width: 100%;
    padding: 14px; /* Bigger button for easier tap */
    background-color: #007bff;
    border: none;
    border-radius: 6px;
    color: #fff;
    font-size: 18px; /* More readable */
    cursor: pointer;
}

/* Button Hover */
.login-container button:hover,
.login-container .login-btn:hover {
    background-color: #0056b3;
}

/* Responsive Adjustments */
@media screen and (max-width: 600px) {
    .login-container {
        width: 90%;  /* Allow slightly more space */
        max-width: 480px; /* Allow a bit larger size on mobile */
        padding: 30px;
    }
    
    .login-container h2 {
        font-size: 24px; /* Increase heading */
    }
    
    .login-container input[type="text"],
    .login-container input[type="password"] {
        font-size: 18px;
        padding: 14px; /* Bigger input fields for better touch */
    }
    
    .login-container button,
    .login-container .login-btn {
        font-size: 18px;
        padding: 14px;
    }
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
