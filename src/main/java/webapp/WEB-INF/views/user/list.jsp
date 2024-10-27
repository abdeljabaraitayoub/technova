<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.hidxop.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .message {
            color: green;
            margin: 10px 0;
        }
        .button {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            border-radius: 3px;
        }
        .delete {
            background-color: #f44336;
        }
    </style>
</head>
<body>
<h1>User List</h1>

<%
    String message = (String) request.getAttribute("message");
    if (message != null && !message.isEmpty()) {
%>
<div class="message"><%= message %></div>
<% } %>

<a href="<%=request.getContextPath()%>/users/add" class="button">Add New User</a>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>ID Number</th>
        <th>Nationality</th>
        <th>Registration Date</th>
        <th>Expiration Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null) {
            for (User user : users) {
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getFirstName() %></td>
        <td><%= user.getLastName() %></td>
        <td><%= user.getIdentificationNumber() %></td>
        <td><%= user.getNationality() %></td>
        <td><%= user.getRegistrationDate() %></td>
        <td><%= user.getExpirationDate() %></td>
        <td>
            <a href="<%=request.getContextPath()%>/users/edit/<%= user.getId() %>" class="button">Edit</a>
            <a href="<%=request.getContextPath()%>/users/delete/<%= user.getId() %>"
               class="button delete"
               onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>