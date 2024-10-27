<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.hidxop.entity.User" %>
<html>
<head>
    <title>Edit User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="text"]:focus,
        input[type="date"]:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 5px rgba(76,175,80,0.2);
        }
        .buttons {
            margin-top: 30px;
            text-align: center;
        }
        .button {
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 0 10px;
            text-decoration: none;
        }
        .save-button {
            background-color: #4CAF50;
            color: white;
        }
        .cancel-button {
            background-color: #f44336;
            color: white;
        }
        .error {
            color: #f44336;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit User</h1>

    <%
        User user = (User) request.getAttribute("user");
        if (user != null) {
    %>
    <form action="<%= request.getContextPath() %>/users/edit/<%= user.getId() %>" method="post">
        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text"
                   id="firstName"
                   name="firstName"
                   value="<%= user.getFirstName() != null ? user.getFirstName() : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text"
                   id="lastName"
                   name="lastName"
                   value="<%= user.getLastName() != null ? user.getLastName() : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="identificationNumber">Identification Number</label>
            <input type="text"
                   id="identificationNumber"
                   name="identificationNumber"
                   value="<%= user.getIdentificationNumber() != null ? user.getIdentificationNumber() : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="nationality">Nationality</label>
            <input type="text"
                   id="nationality"
                   name="nationality"
                   value="<%= user.getNationality() != null ? user.getNationality() : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="expirationDate">Expiration Date</label>
            <input type="date"
                   id="expirationDate"
                   name="expirationDate"
                   value="<%= user.getExpirationDate() != null ? user.getExpirationDate() : "" %>"
                   required>
        </div>

        <div class="buttons">
            <button type="submit" class="button save-button">Save Changes</button>
            <a href="<%= request.getContextPath() %>/users" class="button cancel-button">Cancel</a>
        </div>
    </form>
    <%
    } else {
    %>
    <div class="error">User not found</div>
    <div class="buttons">
        <a href="<%= request.getContextPath() %>/users" class="button cancel-button">Back to List</a>
    </div>
    <%
        }
    %>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <div class="error"><%= error %></div>
    <%
        }
    %>
</div>

<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        var inputs = event.target.querySelectorAll('input[required]');
        var isValid = true;

        inputs.forEach(function(input) {
            if (!input.value.trim()) {
                isValid = false;
                input.style.borderColor = '#f44336';
            } else {
                input.style.borderColor = '#ddd';
            }
        });

        if (!isValid) {
            event.preventDefault();
            alert('Please fill in all required fields');
        }
    });
</script>
</body>
</html>