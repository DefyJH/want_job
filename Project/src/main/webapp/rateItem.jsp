<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    // Retrieve the rating from request parameter
    String rating = request.getParameter("rating");
    
    // Normally you would save this rating in your database or perform other actions
    // For demonstration, we'll just print it out
    out.println("Rating received: " + rating);
%>