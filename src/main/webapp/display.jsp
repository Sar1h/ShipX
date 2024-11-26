<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="pack1.model.DbConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
<h1>Welcome!</h1>
<%
  DbConnect u1=(DbConnect)request.getAttribute("u1");
  out.println(u1);
%>
</body>
</html>