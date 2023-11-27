<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.action.model.dto.Snack, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core태그 제어문 활용하기</title>
</head>
<body>
	<h2>JSTL core 제어문 태그 활용하기</h2>
	<h3>조건문 : if, choose</h3>
	<h3>반복문: forEach </h3>
	<!-- c:태그명 --> 
	<h3>c:if태그 이용하기</h3>
	<p>
		c:if 태그 속성 -> 시작태그 ~ 끝태그<br>
		test : 조건문(true, false값을 설정) <br>
		var : 조건문의 결과를 저장하는 변수명 <br>
	</p>
<%-- 	<%if(test!=null){ %>
		<h2>null이 아니네</h2>
	<%} %>
 --%>
 	<c:set var="su" value="20"/>
 	<c:if test="${su>10 }" var="result">
 		<h2>su는 10보다 크다</h2>
 	</c:if>
 	${result }
 	<c:set var="su2" value="30"/>
 	<c:if test="${su>10 }">
 		<h2>su는 10보다 크네</h2>
 		<c:if test="${su2>20 }">
 			<h2>su2는 20보다 크네</h2>
 		</c:if>
 	</c:if>	
 
 	<h2>c:choose문 활용하기</h2>
 	<p>
 		c:choose
 			c:when test= <br>
 			c:when test= <br>
 			c:otherwise <br>
 	</p>
 	<c:set var="su" value="13"/>
 	<c:choose>
 		<c:when test="${su<10 }">
 			<p>su는 10보다 작다.</p>
 		</c:when>
 		<c:when test="${su>15 }">
 			<p>su는 15보다 크다.</p>
 		</c:when>
 		<c:otherwise>
 			<p>아무것도 해당 안돼!</p>
 		</c:otherwise>
 	</c:choose>
 	
 	<h2>반복문 활용하기</h2>
 	<p>c:forEach태그를 이용</p>
 	<p>
 		1. 기본반복문 : 1~n까지 출력, 정해진 횟수만큼 실행하는 반복문<br>
 		2. 리스트, 배열 등의 데이터를 순회하기 <br>
 	</p>
 	<ul> c:forEach태그 속성
 		<li>begin : 시작번호 </li>
 		<li>end : 끝번호 </li>
 		<li>step : 간격 </li>
 		<li>var : 순회하는 데이터를 저장하는 변수명 <!-- n --></li>
 		<!-- for(String n : names) -->
 		<li>items : 순회할 데이터(리스트, 배열) EL <!-- names --></li>
 		<li>varStatus : 반복문의 정보를 저장하고 있는 객체</li>
 	</ul>
 	
 	<h3>1~10까지 숫자 출력하기</h3>
 	<c:forEach var="i" begin="1" end="10" step="1">
 		<p>${i }</p>
 	</c:forEach>
 	
 	<h2>리스트, 배열에 있는 데이터를 출력할 때 사용하기</h2>
 	<%
 		List<Snack> snacks = List.of(
 					Snack.builder()
 					.name("메로나").price(1500).type("아이스크림").build(),
 					Snack.builder()
 					.name("키커").price(1200).type("초콜릿").build(),
 					Snack.builder()
 					.name("몬스터").price(2300).type("음료수").build(),
 					Snack.builder()
 					.name("녹차라떼").price(4300).type("음료수").build()
 				
 				);
 		request.setAttribute("snacks",snacks);
 	%>
 	<table>
 		<tr>
 			<th>구분</th>
 			<th>종류</th>
 			<th>이름</th>
 			<th>가격</th>
 		</tr>
		<c:forEach var="s" items="${snacks }" varStatus="vs">
			<%-- ${s } --%>
			<c:if test="${s.type eq '음료수' }">
				<tr style="background-color:${vs.first||vs.last?'coral':'skyblue'}";>
					<td>${vs.first } ${vs.last } ${vs.count } ${vs.index }</td>
					<td><c:out value="${s.type }"/></td>
					<td><c:out value="${s.name }"/></td>
					<td><c:out value="${s.price }"/></td>
				</tr>
			</c:if>
		</c:forEach>
 	</table>
 	
 	<h4>c:forTokens 태그</h4>
 	<ul>
 		<li>var : 분할된 값을 저장하는 변수 </li>
 		<li>items : 분할대상이 되는 문자열</li>
 		<li>delims : 분할기준 값</li>
 		<c:forTokens var="h" items="운동,코딩,독서,영화" delims=",">
 			<p><c:out value="${h }"/></p>
 		</c:forTokens>
 		
 		<h3>그 외 코어태그</h3>
 		<h4>c:import태그 이용</h4>
 		<p>jsp: include와 유사한 태그</p>
 		<p> 속성 : var, url</p>
 		<c:import var="header1" url="/views/common/header.jsp">
 			<c:param name="title" value="importTest"/>
 		</c:import>
 		${header1 }
 		<c:out value="${header1 }" escapeXml="false"/>
 		
 		<h4>c:catch태그</h4>
 		<p>exception발생에 대한 catch문</p>
 		<%
 		 	String name = null;
 		
 		%>
 		<c:catch var="e">
 			<%= name.length() %>
 		</c:catch>
 		<c:out value="${e }"/>
 		
 	</ul>
 	
 </body>
</html>