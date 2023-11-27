<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "/views/common/header.jsp" %> --%>
<!-- action 태그 이용하기 -->
 <% request.setCharacterEncoding("UTF-8");%>
 <jsp:include page = "/views/common/header.jsp">
 	<jsp:param name="title" value="메인화면"/>
 </jsp:include>
 
  

	<h2>액션태그 활용하기</h2>
	<ul>
		<li>표준 액션 태그: jsp에서 기본으로 제공하는 태그</li>
		<li>커스텀 액션 태그: 별도 라이브러리파일(jar) 추가해서 사용하는 태그</li>
	</ul>
	<h3>표준액션태그 이용하기</h3>
	<p>태그를 작성할 때 jsp prefix를 사용함</p>
	<%-- <jsp:태그명 속성명=""> --%>
	<h3>jsp : include 태그 이용하기</h3>
	<p>
		%@ include와 비슷한 기능을 하는 태그
		다른 jsp를 불러와 출력하는 기능
	</p>
	<%-- <h3><%=title %></h3>
	 --%>
	<a href = "<%=request.getContextPath() %>/views/forwardTest.jsp">
		forwardTest</a>
</a>

	<h3>EL 활용하기</h3>
	<p>java코드를 jsp에 출력해주는 언어</p>
	<p><%-- ${자바변수명, 메소드호출, 리터럴} --%></p>
	<span>
		자바변수명 : request, session, application에 
		저장된 키값을 의미
	</span>
	<!-- <script>
		const test = "안녕";
		const data = `하하하 ${test}`; 안됨
	</script> -->
	<h3>
		<a href="<%=request.getContextPath()%>/views/el/eltest.jsp">
		EL 활용하기</a>
	</h3>
	<h3>
		<a href="${pageContext.request.contextPath }/views/jstl/core/01_set_out.jsp">
			JSTL태그 이용하기 - set, out 태그 이용하기
		</a>
	</h3>
</body>
</html>