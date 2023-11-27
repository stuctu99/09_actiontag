<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatNumber태그 이용하기</title>
</head>
<body>
	<h2>fmt: formatNumber태그</h2>
	<p>
		페이지에 출력되는 숫자값을 패턴으로 출력할 수 있게 해주는 태그<br>
		화폐표시, 숫자에 대한 그룹, 퍼센트값, 소수점에 대한 설정<br>
		
	</p>
	<h3>숫자 출력하기</h3>
	<c:set var="numtest" value="123456012"/>
	<c:set var="numtest1" value="19883000"/>
	<c:set var="numtest2" value="1"/>
	<c:set var="numtest3" value="1234.567"/>
	<h4>기본 숫자 출력 : ${numtest }</h4>
	<h4>fmt: numberFormat 태그 이용: 
		<fmt:formatNumber value="${numtest }"></fmt:formatNumber>
	</h4>
	<h4>쉼표처리 옵션 적용하기 -> groupingUsed속성</h4>
	<h4>true : 
		<fmt:formatNumber value="${numtest }" groupingUsed="true"/></h4>
	<h4>false : 
		<fmt:formatNumber value="${numtest }" groupingUsed="false"/>
	</h4>
	
	<h3>숫자를 화폐 단위로 표시하기</h3>
	<p>type속성에 currency 값을 대입</p>
	<p> locale 정보 : ${pageContext.request.locale } </p>
	<p><fmt:formatNumber value="${numtest1 }" type="currency"/></p>
	<p>currencySymbol속성에 값으 넣으면 화폐 표시가 그 값으로 설정</p>
	<p><fmt:formatNumber value="${numtest1 }" type="currency"
			currencySymbol="^.~"/></p>
	<p>로케일 설정을 변경하면 화폐 표시는 자동으로 변경</p>
	<p>fmt:setLocale 태그를 이용</p>
<%-- 	<fmt:setLocale value="ja_JP"/> --%>
	<p><fmt:formatNumber value="${numtest1 }" type="currency"/></p>
	
	<h3>퍼센트 표시</h3>
	<p>type속성에 percent로 설정</p>
	<p>value에는 0(0%)~1(100%) 값을 대입</p>
	<p>기본값 : ${numtest2 } </p>
	<p><fmt:formatNumber value="${numtest2-0.3 }" type="percent"/></p>
	<p><fmt:formatNumber value="0.5" type="percent"/></p>
	<p><fmt:formatNumber value="0.2" type="percent"/></p>
	<p><fmt:formatNumber value="0.02" type="percent"/></p>
	
	<h3>패턴으로 숫자를 표시하기</h3>
	<p>
		자릿수에 맞춰서 특정 문구를 출력<br>
		0 : 지정한 자리에 수가 없으면 0을 출력, 있으면 있는 값 출력<br> 
		# : 지정한 자리에 수가 없으면 생략, 있으면 있는 값 출력<br>
		pattern 속성에 패턴을 만들어서 설정
		
	</p>
	<p>
		0 : ${numtest3 } 
			-> <fmt:formatNumber value="${numtest3 }" pattern="000,000,000"/>
			
	</p>
	<p>
		# : ${numtest3 } 
			-> <fmt:formatNumber value="1234.456" pattern="###,###,###"/>
			
	</p>
	<p>소수점 : ${numtest3 }
		-> <fmt:formatNumber value="${numtest3 }" pattern="000,000.0000"/>
	</p>	
	<p>소수점 : ${numtest3 }
		-> <fmt:formatNumber value="1234" pattern="###,###.00"/>
	</p>	
	<h3>소수점 자리수 설정하기</h3>
	<p>
		minFractionDigits : 최소 소수점 자리<br>
		maxFractionDigits : 최대 소수점 자리<br>
	</p>
	<h4><fmt:formatNumber value="123.12" maxFractionDigits="3"
			pattern="###,###.00000"/></h4>
	<h4><fmt:formatNumber value="123" minFractionDigits="2"
						maxFractionDigits="10"/></h4>
</html>