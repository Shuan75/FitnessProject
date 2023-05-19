<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ page import ="kr.fit.login.UserDTO" %>


<link href="../assets/css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style2.css" type="text/css">
<!-- 
<script type="text/javascript">

	function add(){
		// 확인 true 취소 false
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){ // 확인
			//document.add.submit();
			return true;
		}else{ // 취소
			//document.add.reset();
			return false;
		}
	}
</script>
 -->
<style>
input.btn3 { background: #8ca3cf;}
input.btn3 { display: inline-block; width: 136px; height: 42px; font-size: 16px; color:#fff; line-height: 42px; }
</style>
 

 
	<div class="product_view">
	
	<form name="basketAdd" id="basketAdd"  action="basketAdd.do">
		<input type="hidden" id="b_code" name="b_code" value="${dto.c_code}">
		<input type="hidden" name="b_id" id="b_id" value="${s_id}">
		<input type="hidden" name="b_price" id="b_price" value="${dto.c_price }">
		<input type="hidden" name="b_name" id="b_name" value="${dto.c_name }">
		<input type="hidden" name="b_amount" id="b_amount" value="${dto.c_amount }">
		
			<h2>${dto.c_name}</h2>
			<table>
<!-- 				<caption>
					<details class="hide">
						<summary>상품정보</summary>
						판매가, 상품코드, 옵션 및 결제금액 안내
					</details>
				</caption>
 -->			<colgroup>
					<col style="width:173px;">
					<col>
				</colgroup>
			<tbody>
				<tr>
					<th>강의설명</th>
					<td>
					${dto.c_content } 
					</td>
				</tr>
				<tr>
					<th>강사명</th>
					<td>${dto.u_name}</td>
				</tr>
	
				<tr>
					<th>레벨</th>
					<td>${dto.c_level}</td>
				</tr>
				<tr>
					<th>수강요일</th>
					<td>${dto.c_day}</td>
				</tr>
				<tr>
					<th>수강시간</th>
					<td>${dto.c_time}</td>
				</tr>
				<tr>
					<th>수강기간</th>
					<td>${dto.c_period}</td>
				</tr>
	
				<tr>
					<th>판매가</th>
					<td class="total"><b>${dto.c_price}</b>원</td>
				</tr>
				
 				<%-- <tr>
					<th>구매수량</th>
					<td>
<!-- 						<div class="length">
							<input type="number" min="1" value="1">
							<a href="#a">증가</a>
							<a href="#a">감소</a>
						</div> -->
						${dto.c_amount}
					</td>
				</tr> --%>
				</tbody>
			</table>
			
				<div class="btns">
					<a href="#a" class="btn1" onclick="location.href='program.do'">목록으로</a>
					
 					<input class="btn3" type="submit" value="장바구니 담기" onclick="add()">
				<%-- 	
					<a href="#" class="btn3" onclick="location.href='basketList.do?id=${s_id}'">장바구니 담기</a>
					<a href="#a" class="btn2">구매하기</a>
				 --%>
				</div>
				<br>
				
		</form>
	</div>

 
<%-- 
 <div class="row">
    <div class="col-md-8">
        <h3>${dto.c_name}</h3>
        <p>저자: ${dto.c_content }</p>
        <p>가격: ${dto.c_price}원</p>
        <hr class="my-4">
        <form action="<c:url value='basketList.do' />" method="post">
            <div class="form-group">
                <label>수량</label>
                <input name="amount" class="form-control" type="number" value="1" />
            </div>
            <input name="b_code" type="hidden" value="${ b_code }">
            <input type="submit" class="btn btn-primary">장바구니에 담기</button>
        </form>
    </div>
</div>
 --%>

  <div class="btn-group">
  <%if(s_rating.equals("A")) {%>
    <button type="button" class="btn btn-primary" onclick="location.href='programUpd.do?c_code=${dto.c_code}'">수정</button>
    <button type="button" class="btn btn-primary" onclick="location.href='programDel.do?c_code=${dto.c_code}'">삭제</button>
  <% }%>	
  </div>



<%@ include file="../footer.jsp"%>
