<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl을 사용하기 위해서 태그선언부터 해야한다! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core태그 활용하기</title>
</head>
<body>
	<h3>core태그 활용하기</h3>
	<p>
		값 저장, 출력, 조건문, 반복문을 태그로 변경해놓은 태그<br>
	</p>
	<h2>값 저장 및 출력하기</h2>
	<h3>
		c:set 태그 : 값을 특정 이름으로 저장하는 태그<br>
		c:out 태그 : 값을 페이지에 출력하는 태그<br>
	</h3>
		<ul>c:set태그 속성
			<li>var : 저장될 값의 key값(변수명)</li>
			<li>value : 저장될 값. 리터럴 또는 EL표현식</li>
			<li>scope : 저장된 객체를 선택(request, session, application)</li>
		</ul> W
		<ul>c:out태그 속성
			<li>value : 출력될 값</li>
			<li>default : 지정된 출력값이 없는 경우 대체하는 값</li>
			<li>escapeXml : 출력값에 html코드가 있는 경우 해석할지 여부를 결정(true/false)</li>
		</ul>

	
	<h3>값 저장하기</h3>
	<c:set var="comment" value="이제 곧 점심시간!"/>
	<h4>comment : ${comment }</h4> <!-- 보안에 취약 -->
	<h4>comment(c:out) : <c:out value="${comment }"/></h4> <!-- 요렇게 많이 씀 -->
	
	
	<c:set var="path" value="${pageContext.request.contextPath }"/>

	
	<c:set var="test" value="requestData" scope="request"/>
	<c:set var="test" value="sessionData" scope="session"/>
	<c:set var="test" value="applicationData" scope="application"/> 	
	<p><c:out value="${test }"/></p>
	<p><c:out value="${sessionScope.test }"/></p>
	<p><c:out value="${applicationScope.test }"/></p>
	
	<h3>c:out태그로 데이터 출력하기</h3>
	<p><c:out value="점심 맛나게 드셨어요?"/></p>
	<c:set var="tagTest" value="<h1>testdata</h1>"/>
	<%request.setAttribute("content","<script>location.assign('http://www.naver.com')</script>"); %>
	<c:out value="${tagTest }"/>
	${tagTest}
	<p><c:out value="${content }"/></p>
	<p><c:out value="${tagTest }" escapeXml="false"/></p>
	<c:set var="test2" value="있음"/>
	<p>없는 값 출력 : <c:out value="${test2 }" default="없음"/></p>
	${test2==null?"없음":"있음" }
	
	
	
</body>
</html>