<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/resource/css/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Insert title here</title>
<style type="text/css">
.messageBox {
  margin-top: 20px;
  width: 420px; min-height: 150px;
  line-height : 100px;
  border: 1px solid #DAD9FF;
  padding: 5px;
  color:#333333;
  font-size:14px;
  text-align: center;
}
</style>


</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
	

	<div>
	    <div style="margin: 70px auto 60px; width:420px; min-height: 350px;">
		
	    	<div style="text-align: center;">
	    	<!-- 로고 이미지 -->
			<img src="<%=cp%>/resource/img/complete.png" style="margin: 10px"><br>
	        	<span style="font-weight: bold; font-size:27px; color: #424951;">${title}</span>
	        </div>
	        
	        <div class="messageBox">
	            <div style="line-height: 150%; padding-top: 35px;">${message}</div>
	            <div style="margin-top: 20px;">
                      <button type="button" onclick="javascript:location.href='<%=cp%>/';" class="btnConfirm">메인화면으로 이동</button>
                 </div>
	        </div>
	     </div>   
    </div>
    	       


<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>