<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/basket.css">
<script type="text/javascript" src="../basket.js"></script>

<title>basket.jsp</title>
<form action="add.do" method="post">
   	       <input type="hidden" name="b_code" value="${dto.b_code}">
            
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
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
                            <span>${dto.b_name}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">
                        <input type="hidden" name="p_price" id="p_price3" class="p_price" value="${dto.b_price}">
                        ${dto.b_price}
                        </div>
                        <div class="num">
                        ${dto.b_amount}
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${dto.b_amount}" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
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
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>
</form>	
	<a href="program.do" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>


<!-- <script>
		alert("장바구니에 추가되었습니다.");
		/* history.go(-1); */
</script>
 -->


<%@ include file="../footer.jsp"%> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="../css/basket.css">
<script type="text/javascript" src="../basket.js"></script>

<title>basket.jsp</title>
<form action="add.do" method="post">
   	       <input type="hidden" name="b_code" value="${dto.b_code}">
            
            <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">선택</div>
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
                        <div class="check"><input type="checkbox" name="buy" value="260"  onclick="javascript:basket.checkItem();">&nbsp;</div>
                        <div class="pname">
                            <span>${dto.b_name}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">
                        <input type="hidden" name="p_price" id="p_price3" class="p_price" value="${dto.b_price}">
                        ${dto.b_price}
                        </div>
                        <div class="num">
                        ${dto.b_amount}
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${dto.b_amount}" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum">원</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
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
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
            </div>
</form>	
	<a href="program.do" class="btn btn-secondary">&raquo; 쇼핑 계속하기</a>



<%@ include file="../footer.jsp"%>













