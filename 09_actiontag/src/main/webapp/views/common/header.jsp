<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title="haeder데이터! ";

%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h2>헤더 페이지입니다.</h2>
	<h3>헤더 내용 메뉴...</h3>
	<h4><%=request.getParameter("title") %></h4>
	