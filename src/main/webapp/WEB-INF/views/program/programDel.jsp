<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>



  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">


<div class="row">
 <div class="col-xs-2 col-md-2"></div>
 	<div class="col-xs-8 col-md-8">
 		<h2 class="text-center">게시글 삭제</h2><p>&nbsp;</p>
 		<form name="programfrm" id="programfrm" method="post" action="programDel.do" >
		<input type="hidden" id="c_code" name="c_code" value="${dto.c_code}">
 		
 		  <div class="table table-responsive">
	 		<table class="table">
	 			<tr>
	 				<td class="table-active">작성자</td>
	 				<td>${s_id}</td>
	 			</tr>
	 			<tr>
	 			  <td class="table-active">강의명</td>
	 			  <td colspan="3">${dto.c_name}</td>
	 			</tr>

	 			<tr>
	 			 <td class="table-active">패스워드</td>
	 			 <td><input type="password" name="pass"  class="form-control"></td>
	 			</tr>

	 			<tr>
	 			  <td colspan="4" class="text-center">
	 			  	 <input type="hidden" name="password"  value="">
	 			  	 <input type="hidden"  value="${c_code}"  name="code" >
	 			  	 <input type="submit" value="글삭제" class="btn btn-danger" onclick="del()">&nbsp;&nbsp;
	 			  	 <input type="button" value="목록으로" class="btn btn-primary" onclick="location.href='program.do'">
	 			  </td>
	 			</tr>

	 		 </table>
	 	   </div>
 		</form>
	 </div>
</div>




<%@ include file="../footer.jsp"%>