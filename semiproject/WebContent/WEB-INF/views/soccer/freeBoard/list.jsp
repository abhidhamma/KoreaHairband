﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/resource/css/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Insert title here</title>

<script type="text/javascript">
	function searchList()
	{
		var f=document.searchForm;
		f.action="<%=cp%>/soccer/board.do";
		f.submit();
	}
	
	/* 레이어를 닫아준다. */
	function closeLayer( obj ) {
		$(obj).parent().hide();
	}

	$(function(){
		/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
		$('.popupSelect').click(function(e)
		{
			var mem_Id = $(this).attr("data-id"); //값을 받아오는 태그
			
			$("#popupID").html(mem_Id);
			<%-- $("#popupInfo").attr("href", "<%=cp%>/member/infopage.do") --%>

			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX - 510;
			var divTop = e.clientY;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;

			$('.popupLayer').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});

	});
	
	function moveinfo(){
		  var f=document.popup;  //폼 name
		  var mem_Id = $('#popupID').html();
		  f.mem_Id1.value = mem_Id;  //POST방식으로 넘기고 싶은 값
		  f.action="<%=cp%>/member/infopage.do";  //이동할 페이지
		  f.method="post";  //POST방식
		  f.submit();
	}
	
	function movemsg(){
        var f=document.popup;  //폼 name
        var mem_Id = $('#popupID').html();
        var returnpage = "/pet/petInfo/list.do";
        f.mem_Id1.value = mem_Id;  //POST방식으로 넘기고 싶은  
        f.returnpage.value = returnpage;  //POST방식으로 넘기고 싶은  
        f.action="<%=cp%>/message/m_created.do?page="+${page};  //이동할 페이지
        f.method="post";  //POST방식
        f.submit();
   }
</script>

<style type="text/css">
.popupSelect {
	cursor: pointer;
}

.popupLayer {
	z-index:10;
	cursor: pointer;
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 100px;
	height: 120px;
	padding: 10px;
}
</style>
</head>
<body>

<div class="header">
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</div>
		
	
        <form name="popup" method="post">
		<div class="popupLayer">
			<span id="popupID">ID가 나타날곳</span><br>
			<a href="javascript:void(0);" onclick="moveinfo();" id="popupInfo"><span id="popupInfo">회원 정보</span></a><br>
			<a href="javascript:void(0);" onclick="movemsg();"  id="popupMsg"><span id="popupMsg">쪽지 보내기</span></a><br>
			<span onClick="closeLayer(this)" style="cursor:pointer;font-size:1.5em" title="닫기">X</span>
		</div>
		<input type="hidden" name="mem_Id1" value="">
		<input type="hidden" name="returnpage" value="">
		</form>
		<div>
    	<!-- 로고 이미지 -->
		<img src="<%=cp%>/resource/img/m_freeboard.png">
        
        <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			   <tr height="35">
			      <td align="left" width="50%">
			          ${dataCount}개(${page}/${total_page} 페이지)
			      </td>
			      <td align="right">
			          &nbsp;
			      </td>
			   </tr>
			</table>
			 
			<table style="width: 900px; margin: 5px auto; border-spacing: 0px; border-collapse: collapse;">
			  <tr bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th width="80" style="color: #787878; padding-left: 25px;">번호</th>
			      <th width="100" style="color: #787878; padding-left: 25px;">사진</th>
			      <th style="color: #787878; padding-left: 10px;">제목</th>
			      <th width="100" style="color: #787878; padding-left: 25px;">작성자</th>
			      <th width="80" style="color: #787878; padding-left: 10px;">작성일</th>
			      <th width="60" style="color: #787878;">조회수</th>
			  </tr>
			  
			  <c:forEach var="dto" items="${listNotice }">
				  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;">
				      <td>
				           <span style="display: inline-block; width: 38px; height:18px; line-height:18px; background: #ED4C00; color: #FFFFFF;">공지</span>
				      </td>
				  	  <td style="padding-right: 15px;">
				  	  	  <c:if test="${dto.saveFilename != null}">
				  	      	  <img src="<%=cp%>/uploads/semi/${dto.saveFilename}" width="55" height="55" border="0">
				  	  	  </c:if>
				  	  	  
				  	  	  <c:if test="${dto.saveFilename == null}">
				  	  	  	  <img src="" width="55" height="55" border="0">
				  	  	  </c:if>
				  	  </td>
				      <td align="left" style="padding-left: 10px;">
				      	   <a href="${articleUrl }&bbs_num=${dto.bbs_num }">${dto.subject }</a>
				      	   
				      	   <c:if test="${dto.gap < 1 }">
				      			<img src="<%= cp %>/resource/img/new.gif">
				      	   </c:if>
				      </td>
				      <td><a class="popupSelect" data-id="${dto.mem_Id}">${dto.mem_Name}</a></td>
				      <td>${dto.created }</td>
				      <td>${dto.hitCount }</td>
				  </tr>
			  </c:forEach>
			  <tr> <td height="1" colspan="6" bgcolor="#cccccc"></td> </tr>
			 
			  <c:forEach var="dto" items="${list }">
				  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;">
				      <td> ${dto.listNum } </td>
				  	  <td style="padding-right: 15px;">
				  	  	 <c:if test="${dto.saveFilename != null}">
				  	      	  <img src="<%=cp%>/uploads/semi/${dto.saveFilename}" width="55" height="55" border="0">
				  	  	  </c:if>
				  	  	  
				  	  	  <c:if test="${dto.saveFilename == null}">
				  	  	  	  <img src="" width="55" height="55" border="0">
				  	  	  </c:if>
				  	  </td>
				      <td align="left" style="padding-left: 10px;">
				      	   <a href="${articleUrl }&bbs_num=${dto.bbs_num }">${dto.subject }</a>
				      	   
				      	   <c:if test="${dto.gap < 1 }">
				      			<img src="<%= cp %>/resource/img/new.gif">
				      	   </c:if>
				      </td>
				      <td>${dto.mem_Name }</td>
				      <td width="100">${dto.created }</td>
				      <td>${dto.hitCount }</td>
				  </tr>
			  </c:forEach>
			</table>
			 
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
				<tr height="35">
					<td align="center">
				         ${paging }
					</td>
				</tr>
			</table>
			
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			   <tr height="40">
			      <td align="left" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/soccer/board.do';">새로고침</button>
			      </td>
			      <td align="center">
			          <form name="searchForm" action="" method="post">
			              <select name="searchKey" class="selectField">
			              	  <option value="subject" selected="selected">제목</option>
			                  <option value="mem_Name">작성자</option>
			                  <option value="content">내용</option>
			                  <option value="created">등록일</option>
			              </select>
			          <input type="text" name="searchValue" class="boxTF">
			          <button type="button" class="btn" onclick="searchList()">검색</button>
			        </form>
			      </td>
			      <td align="right" width="100">
			          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/soccer/board/created.do';">글올리기</button>
			      </td>
			   </tr>
			</table>
        </div>

<div class="footer">
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</div>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery.ui.datepicker-ko.js"></script>
</body>
</html>