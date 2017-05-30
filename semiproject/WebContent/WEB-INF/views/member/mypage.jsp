<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    request.setCharacterEncoding("utf-8");
    String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/header.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/content.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/footer.css" />
<script type="text/javascript" src="<%=cp%>/resource/js/util.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>


</head>
<body>
<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
<div class="container" style="text-align: center;">
<h3>마이페이지</h3>
<hr>
ID : ${dto.mem_Id}<br>
이름 : ${dto.mem_Name}<br>
프로필사진 : <br>
<c:if test="${dto.mem_img!=null}">
	<img src="<%=cp%>/uploads/photo/${dto.mem_img}" style="max-width:150px; height:auto; resize:both;">
</c:if>
<br>

포인트 : ${dto.point}<br>
생일 : ${dto.birth}<br>
이메일 : ${dto.email}<br>
연락처 : ${dto.tel}<br>
우편번호 : ${dto.zip}<br>
주소 : ${dto.addr1} ${dto.addr2 }<br>
가입일 : ${dto.created_Date}<br>
최근정보수정일 : ${dto.modify_Date}<br>
회원상태 : <c:if test="${dto.enabled==1}">정상</c:if>
		<c:if test="${dto.enabled==0}">활동정지</c:if>
		
<hr>
<a href="<%=cp%>/member/pwd.do?update"><span class="glyphicon glyphicon-update"></span> 정보수정</a>
<i></i>
<a href="<%=cp%>/member/pwd.do"><span class="glyphicon glyphicon-delete"></span> 회원탈퇴</a>
<br>
</div>
<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>