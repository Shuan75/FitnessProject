<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">


<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <h2 class="text-center">게시글 수정</h2><p>&nbsp;</p>
        <form name="noticefrm" id="noticefrm" method="post" action="noticeUpdate.do">
        <input type="hidden" name="bbs_num" value="${dto.bbs_num}">
        
            <div class="table table-responsive">
            <table class="table table-striped">
            <tr>
                <td class="danger">작성자</td>
                <td><input type="text" class="form-control" id="bbs_id" placeholder="작성자(2자-10자)" name="bbs_id" value="${dto.bbs_id}" readonly></td>
                
                <td class="danger">작성일</td>
                <td>${dto.bbs_cdate}</td>
            </tr>
            <tr>
                <td class="danger">제목</td>
                <td colspan="3">
                	<input type="text" class="form-control" id="bbs_title" placeholder="제목 입력(4-100)" name="bbs_title" maxlength="100" required="required" pattern=".{4,100}" value="${dto.bbs_title}">
                </td>
            </tr>
            
            <tr>
                <td class="danger">게시판구분</td>
                <td colspan="3">
                	<select name="bbs_diff">
					        <option value="Notice" selected="selected" >공지사항</option>
					        <option value="Free">자유게시판</option>
					        <option value="Que">질문게시판</option>
					        <option value="Rev">후기게시판</option>
					    </select>
                </td>
            </tr>
            
             
      <!--       <tr>
                <td class="danger">패스워드</td>
                <td colspan="3"><input type="password"  class="form-control" name="password"></td>
            </tr>
       -->       
            <tr>
                <td class="danger">글내용</td>
                <td colspan="3">
                	<textarea class="form-control" rows="5" id="bbs_contents" name="bbs_contents" placeholder="내용 작성">${dto.bbs_contents}</textarea>
                </td>
            </tr>
             
            <tr>  
                <td colspan="4"  class="text-center">
	                <input type="submit"  value="등록">
					<input type="submit"  value="목록" onclick="location.href='noticeList.do'">	                
                 </td>
            </tr>
          </table>
         
     
            </div>
        </form>   
	</div>
</div>

<%@ include file="../footer.jsp"%>