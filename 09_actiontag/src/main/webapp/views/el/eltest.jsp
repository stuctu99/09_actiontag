<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.action.model.dto.Snack, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el표현식</title>
</head>
<body>
	<h3>EL표현식 활용하기</h3>
	<p>
		EL을 이용하면 공용객체(request, session, appplication)에 저장되어 있는 데이터를 간편하게 출력할 수 있다. <br>
		<%-- ${자바 변수명 } --%> -> request, session, application의 key값을 의미. <br>
		자동으로 공용객체를 탐색해서 명칭이 일치하는 value값을 가져옴.
		탐색순서 작은범위-> 큰 범위 : request -> session -> application(ServletContext) <br>
		동일한 값이 있는 경우 작은 범위의 값을 출력<br>
		value값이 객체인(DTO) 경우 get 메소드를 작성하지 않고 가져옴 <br>
		<%-- ${객체명.필드명 } --%>
		자동으로 형변환 해줌 <br>
		
	</p>
	<h3>리터럴 값 EL로 출력하기</h3>
	<p><%="조아" %></p>
	<p>${"조아"}</p>
	<p>나이 : ${19}</p>
	
	<h3>공용객체에 저장된 데이터 출력하기</h3>
	<%
		request.setAttribute("name","유병승");
		session.setAttribute("age",19);
		application.setAttribute("test","기본데이터");
		String email = "teacherdev09@gmail.com";
		
	%>
	<h4><%=request.getAttribute("name") %></h4>
	<h4>${name }</h4>
	<h4>${age }</h4>
	<h4>${test }</h4>
	<h4> 지역 변수 : ${email }</h4>
	 
	 <h3>EL표현식에서 연산자 활용하기</h3>
	 <%
	 	request.setAttribute("su",19);
	 	request.setAttribute("su1",30);
	 	request.setAttribute("su2",30);
	 	request.setAttribute("height",180.5);
	 %>
	<h3>산술연산 처리하기</h3>
	<h4>+연산 : ${su + su1}</h4>
	<h4>-연산 : ${su - su2 } </h4>
	<h4>/연산 : ${su / su1 }</h4>
	<h4>*연산 : ${su2 * su1 }</h4>
	<h4>%연산 : ${su % su1 }</h4>
	<h4>다중연산 : ${su + su1 - su2 * 30 /100 * 0}</h4>
	<h4></h4>
	<h3>비교연산 처리하기</h3>
	<h4>대소비교</h4>
		<h4>${su>su1 } gt ${su gt su1 }</h4>
		<h4>${su>=su1 } ge ${su ge su1 }</h4>
		<h4>${su<su1 } lt ${su lt su1 }</h4>
		<h4>${su<=su1 } le ${su le su1 }</h4>
		<h4>${su<100 } lt ${su lt su1 }</h4>
	<h4>동등비교</h4>
		<h4>숫자 == : ${su1==su2 } eq ${su1 eq su2 }</h4>
		<h4>문자 == : ${test == "기본데이터"} eq ${test eq '기본데이터' }</h4>
	<h4>숫자 != : ${su1!=su2 } ne ${su1 ne su2 }</h4>
	<h4>문자 != : ${test!="기본데이터"} ne ${test ne "기본데이터"}</h4>
	
	<h3>논리연산</h3>
		<h4>${age>10 && test eq "기본데이터" }</h4>
		<h4>${age>10 and test eq "기본데이터" }</h4>
		<h4>${age>10 || test eq "기본데이터" }</h4>
		<h4>${age>10 or test eq "기본데이터" }</h4>
		<h4>${su>10 && su<30}</h4>
	
	<h3>null값 확인하기</h3>
		<h4>${test == null }</h4>
		<h4>${test2 == null }</h4>
		<h4>${empty test }</h4>
		<h4>${empty test2 }</h4>
		<h4>${not empty test }</h4>
	
	<h3>삼항연산자</h3>
		<h4>${su>10?"su는 10보다 크다":"su는 10보다 작다" }</h4>
		<h4>
			<input type="checkbox" ${su>10?"checked":"" } >체크?
		</h4>
		
		<h3>EL에서 메소드 호출</h3>
		<h4>
			test길이는 ${test.length() }
		</h4>
		<h4>
			${test.charAt(0)}
		</h4>
		<h3>저장된 객체 데이터 접근하기</h3>
		<%
			request.setAttribute("s", Snack.builder()
									.name("새우깡").price(1500).type("과자")
									.build());
			Snack s2 = Snack.builder().name("가나초콜릿").price(1500).type("초콜릿").build();
			Snack s3 = Snack.builder().name("눈깔사탕").price(500).type("사탕").build();
			Snack s4 = Snack.builder().name("티코").price(6500).type("아이스크림").build();
			Snack s5 = Snack.builder().name("찰떡아이스").price(2500).type("아이스크림").build();
			request.setAttribute("snacks",List.of(s2,s3,s4,s5));
			request.setAttribute("snacksMap",Map.of("ganam",s2,"snow",s3,"tea",s4,"ice",s5));
			
		%>
		<p>
			저장된 객체는 key값으로 불러와서 접근연산자 . 으로 필드에 접근하여 필드값을 출력할 수 있다.
		</p>
		<h4>저장된 객체 출력 : ${s }</h4>
		<h4>이름 : ${s.name }</h4>
		<h4>가격 : ${s.price *0.2 }</h4>
		<h4>종류 : ${s.type }</h4>
		<h4>이름 : ${s.getName() }</h4>
		<input type="checkbox" ${s.type eq "과자"?"checked":"" }>과자
		<input type="checkbox" ${s.type eq "사탕"?"checked":"" }>사탕
		<input type="checkbox" ${s.type eq "초콜릿"?"checked":"" }>초콜릿
		<input type="checkbox" ${s.type eq "아이스크림"?"checked":"" }>아이스크림 <br>
		이름 <input type="text" value="${s.name }">
		
		<h3>collection데이터 접근하기</h3>
		<h4>List : ${snacks }</h4>
		<h4>Map  : ${snacksMap }</h4>
		<h4>${snacks.get(0).name }</h4>
		<h4>${snacks.get(1).name }</h4>
<%-- 		<h4>${snacks.name }</h4>  error--%> 
		<h4>${snacksMap.ganam.name }</h4>
		<h4>${snacksMap.ganam.price }</h4>
		
		<h3>servlet과 연동해서 처리하기</h3>
		<h4>
			<a href="${pageContext.request.contextPath }/dataTest.do">
				데이터처리 실습하기
			</a>
		</h4>
		
		<h3>전달받은 데이터 출력하기</h3>
		<form action="${pageContext.request.contextPath }/dataTest.do" method="post">
			<input type="text" name="userId">
			<input type="password" name="password">
			<input type="checkbox" name="hobby" value="운동" >운동
			<input type="checkbox" name="hobby" value="여행" >여행 
			<input type="checkbox" name="hobby" value="코딩" >코딩 
			<input type="checkbox" name="hobby" value="영화" >영화 
			<input type="submit" value="저장"/>
		</form>
		
</body>
</html>