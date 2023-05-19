<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>


<title>program.jsp</title>
 
<link href="../assets/css/styles.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<style>
	.card {
	margin: 0 auto;
	}
	
</style>
<h3>이용권 구매</h3>


<c:forEach var="dto" items="${list}">
   <div class="card mb-2" style="max-width: 540px">
      <input type="hidden" name="c_code" value="${c_code}">
      <div class="row g-10">
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title"><a href="programRead.do?c_code=${dto.c_code}">${dto.c_name}</a></h5>
            <p class="card-text">${dto.c_content}</p>
          </div>
        </div>
        <div class="col-md-4">
          <br />
          <button type="button" class="btn btn-outline-dark" onclick="location.href='basketList.do'">장바구니</button>
        </div>
      </div>
    </div>
</c:forEach> 

	<%if(s_rating.equals("A")) {%>  
	<input type="button" value="강의등록" onclick="location.href='programCreate.do'">
	<% }%> 



<%@ include file="../footer.jsp"%>