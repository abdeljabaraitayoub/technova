<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.hidxop.entity.User" %>
<html>
<head>
    <title>User Form</title>
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
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
        .cancel-button {
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
            text-decoration: none;
        }
        .error {
            color: #f44336;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        User user = (User) request.getAttribute("user");
        String formAction = (String) request.getAttribute("formAction");
        boolean isEdit = user != null && user.getId() != null;
    %>
    <h1><%= isEdit ? "Edit User" : "Create New User" %></h1>

    <form action="<%= isEdit ? request.getContextPath() + "/users/edit/" + user.getId() : request.getContextPath() + "/users/add" %>"
          method="post">

        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text"
                   id="firstName"
                   name="firstName"
                   value="<%= user != null ? user.getFirstName() != null ? user.getFirstName() : "" : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text"
                   id="lastName"
                   name="lastName"
                   value="<%= user != null ? user.getLastName() != null ? user.getLastName() : "" : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="identificationNumber">Identification Number:</label>
            <input type="text"
                   id="identificationNumber"
                   name="identificationNumber"
                   value="<%= user != null ? user.getIdentificationNumber() != null ? user.getIdentificationNumber() : "" : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="nationality">Nationality:</label>
            <input type="text"
                   id="nationality"
                   name="nationality"
                   value="<%= user != null ? user.getNationality() != null ? user.getNationality() : "" : "" %>"
                   required>
        </div>

        <div class="form-group">
            <label for="expirationDate">Expiration Date:</label>
            <input type="date"
                   id="expirationDate"
                   name="expirationDate"
                   value="<%= user != null ? user.getExpirationDate() != null ? user.getExpirationDate() : "" : "" %>"
                   required>
        </div>

        <div class="button-group">
            <button type="submit" class="button">
                <%= isEdit ? "Update User" : "Create User" %>
            </button>
            <a href="<%= request.getContextPath() %>/users" class="cancel-button">Cancel</a>
        </div>
    </form>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <div class="error"><%= error %></div>
    <% } %>
</div>

<script>
    // Optional: Add client-side validation if needed
    document.querySelector('form').addEventListener('submit', function(e) {
        var inputs = e.target.querySelectorAll('input[required]');
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
            e.preventDefault();
            alert('Please fill in all required fields');
        }
    });
</script>
</body>
</html>