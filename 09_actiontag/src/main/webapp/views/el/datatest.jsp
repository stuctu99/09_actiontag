<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>서버에서 전송한 데이터 출력하기</h2>
	<h3>현재 과자 종류</h3>
	<ul>
		<li>${snacks.get(0).type} ${snacks.get(0).name }</li>
		<li>${snacks.get(1).type} ${snacks.get(1).name }</li>
		<li>${snacks.get(2).type} ${snacks.get(2).name }</li>
		<li>${snacks.get(3).type} ${snacks.get(3).name }</li>
	</ul>
	
	<h3>중복된 key출력하기</h3>
	<h4>${snacks }</h4>
	<p>
		EL에서 key값을 검색하는 객체 지정하기<br>
		requestScope, sessionScope, applicationScope 객체로 처리
	</p>
	<h4>request : ${requestScope.snacks }</h4>
	<h4>session : ${sessionScope.snacks }</h4>
	<h4>application : ${applicationScope.snacks }</h4>
	
	<h3>파라미터값 출력하기</h3>
	<h4><%=request.getParameter("userId") %></h4>
	<p>단일 : param.name값 / 다중값 : paramValues.name값</p>
	<h4>아이디 ${param.userId }</h4>
	<h4>패스워드 ${param.password }</h4>
	<h4>취미 ${paramValues.hobby[0] }</h4>
	<h4>취미 ${paramValues.hobby[1] }</h4>
	<h4>취미 ${paramValues.hobby[2] }</h4>
	
	<h3>기타 정보 가져오기</h3>
	<p>
		header, cookie, context관련 정보
	</p>
	<h4>context관련정보</h4>
	<p>contextroot :  ${pageContext.request.contextPath }</p>
	<p>URI : ${pageContext.request.requestURI }</p>
	<p>URL : ${pageContext.request.requestURL }</p>
	
	<h4>Cookie</h4>
	<p>${cookie }</p>
	<p>${cookie.JSESSIONID}</p>
	<p>${cookie.JSESSIONID.name}</p>
	<p>${cookie.JSESSIONID.value}</p>
	
	<h4>Header</h4>
	<p>${header }</p>
	<p>${header.referer }</p>
	<p>${header.host }</p>
	<p>${header['user-agent'] }</p>
	
</body>
</html>