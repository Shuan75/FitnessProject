<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../member/auth.jsp" %>
<%@ include file="ssi.jsp" %>     --%>
<%@ include file="../header.jsp" %>  
  
<!-- 본문시작 bbsRead.jsp -->


<link href="../assets/css/styles.css" rel="stylesheet" type="text/css">
<!-- <link href="../css/noticestyle.css" rel="stylesheet" type="text/css"> -->

<!-- 
<div class="container">


		<table class="table">
		<tbody>
		<tr>
			<th class="success">제목</th>
			<td style="text-align: left;">${dto.bbs_title}</td>
		</tr>
		<tr>
			<th class="success">내용</th>
			<td style="text-align: left;">${dto.bbs_contents}
			</td>
		</tr>
			<tr>
			<th class="success">작성자</th>
			<td style="text-align: left;">${dto.bbs_id}</td>
			<%-- <td><%=dto.getWname()%></td> --%>
		</tr>
		<tr>
			<th class="success">작성일</th>
			<td style="text-align: left;">${dto.bbs_cdate}</td>
			<%-- <td><%=dto.getRegdt()%></td> --%>
		</tr>
		

		</table>
 -->		
		
		
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.btn10 {
	margin:auto 0;
	text-align:center;
	}
</style>
 </head>
<body>
	<div class="btn10">
<div class="container">         
  <table class="table">
    <thead>
      <tr>
        <th><h5>${dto.bbs_title}</h5></th>
      </tr>
    </thead>
    <tbody>
       <tr>
        <td>${dto.bbs_id} | ${dto.bbs_cdate}</td>
      </tr>
      <tr>
      	<td colspan="3">
         	<textarea class="form-control" rows="20" id="bbs_contents" name="bbs_contents" placeholder="내용 작성" readonly>${dto.bbs_contents}</textarea>
      	</td>
      </tr>

    </tbody>
  </table>
</div>
		
			
		<div class='bottom'>
		
		<%if(s_rating.equals("A")) {%>
			<input type="button" value="수정" onclick="location.href='noticeUpdate.do?bbs_num=${dto.bbs_num}'">			
            <input type="button" value="삭제" onclick="location.href='noticeDel.do?bbs_num=${dto.bbs_num}'" >
            <input type="button"  value="목록" onclick="location.href='noticeList.do'">
            <input type="button"  value="답변쓰기" onclick="location.href='replyCreate.do?bbs_num=${dto.bbs_num}'">
         <% }%>	
         	</div>
 		</div>
</div>




<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>    








