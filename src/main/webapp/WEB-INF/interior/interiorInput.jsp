<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>인테리어 등록하기 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<div style="margin-left: 4.5%; padding-top: 5%;">
	<div class="text-center">상품등록</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>