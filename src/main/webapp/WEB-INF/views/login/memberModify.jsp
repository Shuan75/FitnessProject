<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">
<style>
section {
  display: -webkit-flex;
  display: flex;
/*   text-align: center; */
}

article {
  -webkit-flex: 3;
  -ms-flex: 3;
  flex: 3;
  padding: 10px;
  
}

.page222 {
	text-align: center;
}
</style>
<form name="memfrm" id="memfrm" action="modify.do" method="post" onsubmit="return memberCheck()">
<input type="hidden" id="u_code" name="u_code" value="${dto.u_code }">
<input type="hidden" id="rating" name="rating" value="${dto.rating }">
<%-- <input type="hidden" id="jdate" name="jdate" value="${dto.jdate }">			 --%>
<input type="hidden" id="img" name="img" value="${dto.img }">
<input type="hidden" id="inform" name="inform" value="${dto.inform }">

<section class="mypage">

<nav>
 <div id="navigation">
	<div class="snb">
		<h2>마이페이지</h2>
		<ul>
		<li><a href="#">회원정보수정</a></li>
		<li><a href="#" onclick="location.href='calendar.do'">달력</a></li>
		<li><a href="#" onclick="location.href='chart.do'">차트</a></li>
		<li><a href="#" onclick="location.href='basketList.do?id=${s_id}'">장바구니</a></li>
		<!-- <li><a href="#" onclick="location.href='chat.do'">온라인강의</a></li> -->
		</ul>		
	</div>
</div>
</nav>
<article>
<span style="color:red; font-weight: bold"></span>
<br>
		<div class="page-title">
			<div class="container">
				<h4>회원정보 수정</h4>
			</div>
		</div>
<table class="table">


<tr>
    <th>아이디</th>
    <td style="text-align: left">
      <input type="text" name="id" id="id" size="15" value="${s_id }" readonly>
    </td>
    
</tr>
<tr>
    <th>비밀번호</th>
    <td style="text-align: left"><input type="password" name="password" id="password" size="15" required></td>
</tr>
<tr>
    <th>비밀번호 확인</th>
    <td style="text-align: left"><input type="password" name="repassword" id="repassword" size="15" required></td>
</tr>
<tr>
    <th>이름</th>
    <td style="text-align: left"><input type="text" name="u_name" id="u_name" size="15" maxlength="20"  value="${dto.u_name }" readonly></td>
</tr>
<tr>
    <th>이메일</th>
    <td style="text-align: left">
      <input type="email" name="email" id="email" size="30"  value="${dto.email }" readonly >
      <input type="button" value="Email 중복확인" onclick="emailCheck()"><!-- myscript.js -->
    </td>
</tr>
<tr>
    <th>성별</th>
    <!-- <td style="text-align: left"><input type="text" name="gender" id="gender" required></td> -->
    <td><input type="radio" id="gender" name="gender" value="M" <% if("M".equals("M")){%>checked<%}%> disabled="disabled"/>남자&nbsp;&nbsp;
    <input type="radio" id="gender" name="gender" value="F" <% if("F".equals("F")){%>checked<%}%> disabled="disabled"/>여자</td>
    <%-- <%=("F".equals("F"))?"checked":""%> --%>
</tr>
<tr>
    <th>전화번호</th>
    <td style="text-align: left"><input type="text" name="pnum" id="pnum" size="15"  value="${dto.pnum }"></td>
</tr>
<tr>
    <th>생년월일</th>
    <td style="text-align: left"><input type="text" name="birth" id="birth" size="15" value="${dto.birth }" readonly ></td>
</tr>
<tr>
    <th>우편번호</th>
    <td style="text-align: left">
      <input type="text" name="postal" id="postal" size="7" value="${dto.postal }" readonly>
      <input type="button" value="주소찾기" onclick="DaumPostcode()">    
    </td>
</tr>
<tr>  
  <th>주소</th>
  <td style="text-align: left"><input type="text" name="addr" id="addr" size="45"  value="${dto.addr }"readonly></td>
</tr>
<tr>  
  <th>세부 주소</th>
  <td style="text-align: left"><input type="text" name="addr2" id="addr2" size="45" value="${dto.addr2 }" ></td>
</tr>

<tr>
    <td colspan="2">
        <input type="submit" value="수정"  class="btn btn-primary"/>
        <input type="reset"  value="취소"  class="btn btn-primary"/>
    </td>
</tr>
</table>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    
</script>

</article>
</section>

</form>
<%@ include file="../footer.jsp" %>
