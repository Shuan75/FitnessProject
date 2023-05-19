<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<h3>아이디 / 비밀번호 찾기 결과</h3>
<script>

var decText = URLDecoder.decode(encTextA, "UTF-8");

</script>
<table>
<tr>
	<td>입력하신 이메일 : ${dto.email}로 아이디와 임시 비밀번호가 전송되었습니다. 이메일을 확인해주세요.</td>
</tr>
</table>



<%@ include file="../footer.jsp"%>