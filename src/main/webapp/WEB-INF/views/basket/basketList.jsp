<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>


<title>basketList.jsp</title>
<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/basket.css">
<script type="text/javascript" src="../assets/js/basket.js"></script>


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

<section class="mypage">

	<nav>
		<div id="navigation">
			<div class="snb">
				<h2>마이페이지</h2>
				<ul>
					<li><a href="#" onclick="location.href='modify.do?id=${s_id}'">회원정보수정</a></li>
					<li><a href="#" onclick="location.href='calendar.do'">달력</a></li>
					<li><a href="#" onclick="location.href='chart.do'">차트</a></li>
					<li><a href="#" onclick="location.href='basketList.do?id=${s_id}'">장바구니</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<article>
<br>
<!-- <h2 class="text-center">장바구니</h2> -->
<div class="fa fa-shopping-bag"><a href="/order/basket.html"></a></div>
<h2>장바구니<span class="badge badge-warning">쇼핑중</span></h2>
<div class="fa fa fa-user-o"><a href="/member/login.html"></a></div>

<input type="hidden" name="b_code" value="${dto.b_code}">
<input type="hidden" name="b_id" id="b_id" value="${s_id}">

	<div class="basketdiv" id="basket">
	    <div class="row head">
	        <div class="subdiv">
	            <div class="check"><th>선택</th></div>
	            <div class="pname">상품명</div>
	        </div>
	        
	        <div class="subdiv">
	            <div class="basketprice">가격</div>
	            <div class="num">수량</div>
	            <div class="sum">합계</div>
	        </div>
	        
	        <div class="subdiv">
	            <div class="basketcmd">삭제</div>
	        </div>
	        <div class="split"></div>
	    </div>
		<c:forEach var="dto" items="${list}">
		    <div class="row data">
		        <div class="subdiv">
		            <div class="check"><input type="checkbox" name="buy" value="260" checked="" onclick="javascript:basket.checkItem();">&nbsp;</div>
		            <div class="pname">
		            <input type="hidden" name="p_price" id="p_price" class="p_name" value="${dto.b_name}">
		            ${dto.b_name}
		            </div>
		        </div>
		        <div class="subdiv">
		            <div class="basketprice">
		            <input type="hidden" name="p_price" id="p_price" class="p_price" value="${dto.b_price}">
		            ${dto.b_price}
		            </div>
		            <div class="num">
		                <div class="updown">
		                 <%-- <input type="hidden" name="p_num" id="p_num" class="p_num" value="${dto.b_amount}">${dto.b_amount } --%>
	 	                     <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${dto.b_amount}" onkeyup="javascript:basket.changePNum(1);">
		                    <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
		                    <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
		                </div>
		            </div>
		            
		            <div class="sum">원</div>
		        </div>
		        <div class="subdiv">
		            <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();" onclick="location.href='programDel.do?c_code=${dto.b_code}'">삭제</a></div>
		        </div>
		    </div>
		</c:forEach> 
	</div>

	<div class="right-align basketrowcmd">
	    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delCheckedItem();">선택상품삭제</a>
	    <a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delAllItem();">장바구니비우기</a>
	</div>
	
	<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수:개</div>
	<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:원</div>
	
	<div id="goorder" class="">
	    <div class="clear"></div>
	    <div class="buttongroup center-align cmd">
	    	<a href="program.do" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>
	        <a href="javascript:void(0);">선택한 상품 주문</a>
	    </div>
	     	
	</div>
	
</article>
</section>
 
  <%-- 
  
  <div class="jumbotron">
    <h3 class="display-4">cart</h3>
    <hr class="my-4">
    <p>장바구니 페이지</p>
</div>
<h2>장바구니<span class="badge badge-warning">쇼핑중</span></h2>
<hr>

<input type="hidden" name="b_code" value="${dto.b_code}">
<input type="hidden" name="b_id" id="b_id" value="${s_id}">



<table class="table">
    <thead class="thead-light">
    <tr>
      <th>#</th>
      <th>도서명</th>
      <th>가격</th>
      <th>수량</th>
      <th>합계</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="item" items="${ items }" varStatus="status">
    <c:forEach var="dto" items="${ list }" varStatus="status" >
        <tr>
            <th>${ status.count }</th>
            <td>${ dto.b_name }</td>
            <td>${ dto.b_price }</td>
            <td>${ dto.b_amount }</td>
            <td></td>
        </tr>
    </c:forEach>
  </tbody>
  <tfoot>
    <tr>
        <td colspan="4"></td>
        <td>${ dto.totalPrice }</td>
    </tr>
  </tfoot>
</table>
<form action="<c:url value='/orders' />" method="post">
<input type="hidden" name="b_code" value="${dto.b_code}">
    <input name="b_id" type="hidden" value="${ b_id }" type="hidden" />
    <button type="submit" class="btn btn-lg btn-block btn-primary">주문하기</button>
</form>
  --%>

<%@ include file="../footer.jsp"%>