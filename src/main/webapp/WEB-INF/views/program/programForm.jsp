<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>



<link href="../assets/css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/style2.css" type="text/css">

	

<div class="product_view">
<form action="programCreate.do" method="post">
<input type="hidden" name="c_amount" id="c_amount" value="1">
		 <!-- <h2>강의명 : <input type="text" class="form-control" id="c_name" placeholder="내용을 입력하세요" name="c_content"></h2> -->
		<table>
			<!-- <caption>
				<details class="hide">
					<summary>상품정보</summary>
					판매가, 상품코드, 옵션 및 결제금액 안내
				</details>
			</caption> -->
			<colgroup>
				<col style="width:173px;">
				<col>
			</colgroup>
		<tbody>
			<tr>
				<th>강의코드</th>
				<td><input type="text" class="form-control" id="c_code" placeholder="내용을 입력하세요" name="c_code"></td>
			</tr>
			<tr>
				<th>강의명</th>
				<td><input type="text" class="form-control" id="c_name" placeholder="내용을 입력하세요" name="c_name"></td>
			</tr>
			<tr>
				<th>강의설명</th>
				<td><input type="text" class="form-control" id="c_content" placeholder="내용을 입력하세요" name="c_content"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" id="c_id" placeholder="세션으로 불러오기" name="c_id" value="${s_id}" readonly></td>
			</tr>
			<tr>
				<th>강사명</th>
				<td><input type="text" class="form-control" id="u_name" placeholder="내용을 입력하세요" name="u_name"></td>
			</tr>

			<tr>
				<th>레벨</th>
				<td><input type="text" class="form-control" id="c_level" placeholder="내용을 입력하세요" name="c_level"></td>
			</tr>
			<tr>
				<th>수강요일</th>
				<td><input type="text" class="form-control" id="c_day" placeholder="내용을 입력하세요" name="c_day"></td>
			</tr>
			<tr>
				<th>수강시간</th>
				<td><input type="text" class="form-control" id="c_time" placeholder="내용을 입력하세요" name="c_time"></td>
			</tr>
			<tr>
				<th>수강기간</th>
				<td><input type="text" class="form-control" id="c_period" placeholder="내용을 입력하세요" name="c_period"></td>
			</tr>
			<tr>
				<th>총인원</th>
				<td><input type="text" class="form-control" id="c_total" placeholder="내용을 입력하세요" name="c_total"></td>
			</tr>

			<tr>
				<th>판매가</th>
				<td class="total"><input type="text" class="form-control" id="c_price" placeholder="내용을 입력하세요" name="c_price"></td>
			</tr>
			</tbody>
		</table>
				<!-- 
			<div class='bottom'>
				<button type="button" class="btn btn-light" onclick="location.href='program.do'">강의목록</button>
				<button type="button" class="btn btn-light" onclick="location.href='programUpdate.do'">수정</button>
			</div>
			 -->
           <tr>  
                <td colspan="4"  class="text-center">
	                <input type="submit"  value="등록">
					<input type="button"  value="목록" onclick="location.href='program.do'">	                
                 </td>
            </tr>
			
		</form>
	</div>




<%@ include file="../footer.jsp"%>
