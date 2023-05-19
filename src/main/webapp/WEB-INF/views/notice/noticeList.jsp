<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="dto" class="kr.fit.notice.NoticeDTO" scope="page"></jsp:useBean>

<%@ include file="../header.jsp"%>
<title>noticeList.jsp</title>
<style>
section {
	display: -webkit-flex;
	display: flex;
}

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	padding: 10px;
}

</style>
<link href="../assets/css/styles.css" rel="stylesheet" type="text/css">
<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	for(int n=0; n<=dto.getBbs_indent(); n++){
		out.println("<img src='../images/reply.gif'>");
	}//for end

</script>


<section class="notice">
	<nav>
		<div id="navigation">
			<div class="snb">
				<h2>커뮤니티</h2>
				<ul>
					<li><a href="#a" onclick="location.href='noticeList.do'">공지사항</a></li>
					<li><a href="#a" onclick="location.href='freeList.do'">자유게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<article>


		<div class="page-title">
			<div class="container">
				<h4>공지사항</h4>
			</div>
		</div>
    <div id="board-search">
        <div class="container">
            <div class="search-window">
            	<table>
            	<tr>
            		<td>
	                <form action="noticeList.do">
	               
	                
	                 	<select name="col">
							<option value="bbs_title_bbs_contents">제목+내용</option>
							<option value="bbs_title">제목</option>
							<option value="bbs_contents">내용</option>
							<option value="bbs_id">작성자</option>
						</select>
					                  
	                        <label for="search" class="blind">공지사항 내용 검색</label>                     
	                        <input id="word" type="text" name="word" size="35px" placeholder="검색어를 입력해주세요." value="">
	                        <button type="submit" class="btn btn-dark">검색</button>
	                
	                </form>
                	</td>
                </tr>
              </table>
            </div>
        </div>
    </div>

		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-date">등록일</th>
							<!-- <th scope="col" class="th-id">작성자</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}">
							<tr>
								<%		
								//답변이미지 출력
								for(int n=1; n<=dto.getBbs_indent(); n++){
									
									%>
									 <img src="../images/reply.gif">
									 
									<%
									out.println("<img src='../images/reply.gif'>");
									
								}//for end
								%>
								<td>${dto.bbs_num}</td>
								<td><a href="#" onclick="location.href='noticeRead.do?bbs_num=${dto.bbs_num}'">${dto.bbs_title}</a></td>

								<%-- <td><a href="noticeList.do?bbs_num=${dto.bbs_num}">${dto.bbs_title}</a></td> --%>

								<td>${dto.bbs_cdate}</td>
								<%-- <td>${dto.bbs_id}</td> --%>

								<%-- <td><a href="#" onclick="location.href='read.do?c_code=${c_code}'">${dto.c_name}</a></td> --%>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<br>
				<%if(s_rating.equals("A")) {%>
				<input type="button" value="글쓰기" onclick="location.href='create.do'">
				 <% }%>	
			</div>
		</div>
			<tr>
				<td colspan='4' style='text-align:center; height: 50px;'></td>
			</tr>
			
		<c:if test="${requestScope.count>0 }">
			<c:set var="pageCount" value="${requestScope.totalPage}" />
			<c:set var="startPage" value="${requestScope.startPage}" />
			<c:set var="endPage" value="${requestScope.endPage}" />

			<div class="">
				<c:if test="${endPage>pageCount}">
					<c:set var="endPage" value="${pageCount+1}" />
				</c:if>

				<c:if test="${startPage>0}">
					<a href="./noticeList.do?pageNum=${startPage}">[이전]</a>
				</c:if>

				<c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
					<a href="./noticeList.do?pageNum=${i}">[${i}]</a>
				</c:forEach>

				<c:if test="${endPage<pageCount}">
					<a href="./noticeList.do?pageNum=${startPage+11}">[다음]</a>
				</c:if>
			</div>
		</c:if>

	</article>
</section>




<%@ include file="../footer.jsp"%>
