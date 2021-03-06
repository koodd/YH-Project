<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/farmreser.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	var count=0;
        function clickBtn(bb){
        	if(bb.checked){
        		$("#selectGujwa").append("<span class=selectGujwa id='"+bb.value+"r'>"+bb.value+",</span>");
        		count++;
        		$("#countGujwa").text(count);
        	}else{
        		count--;
        		$("#"+bb.value+"r").remove();
        		$("#countGujwa").text(count);
        	}
        }
        $(function(){
        	$("#countGujwa").on("DOMSubtreeModified",function(){
        		var price = $("#basePrice").val();
        		$("#fr_price2").text($("#countGujwa").text()*price);
        		$("#fr_price").val($("#countGujwa").text()*price);
            });
        });
    </script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
</head>
<body>
<%@ include file="../base/header.jsp" %>
    <section class="f_res">
    	<form action="#">
    	<input type="hidden" value="${fDto.frs_account}" id="acc">
        <h2>농장 예약</h2>
        <div class="wrapF_res">
        <script type="text/javascript">
        $(function(){
        	var acc = $("#acc").val();
        	var accArr = acc.split(",");
            for(var i=0; i<accArr.length; i++){

            	$("#"+accArr[i]+"").prop('disabled',true);
            }
        });
        </script>
            <h3 id="farm_name" style="text-align:center; margin:50px 0;">${fDto.fr_name}</h3>
            <!-- 구획 -->
            <table>
                <tr>
                    <th></th>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                    <th>6</th>
                    <th>7</th>
                    <th>8</th>
                    <th>9</th>
                    <th>10</th>
                    <th>11</th>
                    <th>12</th>
                    <th>13</th>
                    <th>14</th>
                    <th>15</th>
                    <th>16</th>
                    <th>17</th>
                    <th>18</th>
                    <th>19</th>
                    <th>20</th>
                </tr>
                <!-- A구역 -->
                <c:if test="${fDto.fr_block>=20}">
                <tr>
                	<th>A</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="A${status.current }" onclick="clickBtn(this)" value="A${status.current }"><label for="A${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                
				<c:if test="${fDto.fr_block<20 && fDto.fr_block>=0}">
				<tr>
					<th>A</th>
					<c:forEach begin="1" end="${fDto.fr_block}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="A${status.current }" onclick="clickBtn(this)" value="A${status.current }"><label for="A${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- B구역 -->
				<c:if test="${fDto.fr_block-20>20 && fDto.fr_block-20>0}">
				<tr>
                	<th>B</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="B${status.current }" onclick="clickBtn(this)" value="B${status.current }"><label for="B${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-20<20 && fDto.fr_block-20>0}">
				<tr>
                	<th>B</th>
					<c:forEach begin="1" end="${fDto.fr_block-20}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="B${status.current }" onclick="clickBtn(this)" value="B${status.current }"><label for="B${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-40==0}">
				<tr>
					<th>B</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="B${status.current }" onclick="clickBtn(this)" value="B${status.current }"><label for="B${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- C구역 -->
				<c:if test="${fDto.fr_block-40>20 && fDto.fr_block-40>0}">
				<tr>
                	<th>C</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="C${status.current }" onclick="clickBtn(this)" value="C${status.current }"><label for="C${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-40<20 && fDto.fr_block-40>0}">
				<tr>
                	<th>C</th>
					<c:forEach begin="1" end="${fDto.fr_block-40}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="C${status.current }" onclick="clickBtn(this)" value="C${status.current }"><label for="C${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-60==0}">
				<tr>
					<th>C</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="C${status.current }" onclick="clickBtn(this)" value="C${status.current }"><label for="C${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>              
                <!-- D구역 -->
				<c:if test="${fDto.fr_block-60>20 && fDto.fr_block-60>0}">
				<tr>
                	<th>D</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="D${status.current }" onclick="clickBtn(this)" value="D${status.current }"><label for="D${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-60<20 && fDto.fr_block-60>0}">
				<tr>
                	<th>D</th>
					<c:forEach begin="1" end="${fDto.fr_block-80}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="D${status.current }" onclick="clickBtn(this)" value="D${status.current }"><label for="D${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-80==0}">
				<tr>
					<th>D</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="D${status.current }" onclick="clickBtn(this)" value="D${status.current }"><label for="D${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- E구역 -->
				<c:if test="${fDto.fr_block-80>20 && fDto.fr_block-80>0}">
				<tr>
                	<th>E</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="E${status.current }" onclick="clickBtn(this)" value="E${status.current }"><label for="E${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-80<20 && fDto.fr_block-80>0}">
				<tr>
                	<th>E</th>
					<c:forEach begin="1" end="${fDto.fr_block-80}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="E${status.current }" onclick="clickBtn(this)" value="E${status.current }"><label for="E${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-100==0}">
				<tr>
					<th>E</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="E${status.current }" onclick="clickBtn(this)" value="E${status.current }"><label for="E${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- F구역 -->
				<c:if test="${fDto.fr_block-100>20 && fDto.fr_block-100>0}">
				<tr>
                	<th>F</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="F${status.current }" onclick="clickBtn(this)" value="F${status.current }"><label for="F${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-100<20 && fDto.fr_block-100>0}">
				<tr>
                	<th>F</th>
					<c:forEach begin="1" end="${fDto.fr_block-100}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="F${status.current }" onclick="clickBtn(this)" value="F${status.current }"><label for="F${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-120==0}">
				<tr>
					<th>F</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="F${status.current }" onclick="clickBtn(this)" value="F${status.current }"><label for="F${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- G구역 -->
				<c:if test="${fDto.fr_block-120>20 && fDto.fr_block-120>0}">
				<tr>
                	<th>G</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="G${status.current }" onclick="clickBtn(this)" value="G${status.current }"><label for="G${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-120<20 && fDto.fr_block-120>0}">
				<tr>
                	<th>G</th>
					<c:forEach begin="1" end="${fDto.fr_block-120}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="G${status.current }" onclick="clickBtn(this)" value="G${status.current }"><label for="G${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-140==0}">
				<tr>
					<th>G</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="G${status.current }" onclick="clickBtn(this)" value="G${status.current }"><label for="G${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- H구역 -->
				<c:if test="${fDto.fr_block-140>20 && fDto.fr_block-140>0}">
				<tr>
                	<th>H</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="H${status.current }" onclick="clickBtn(this)" value="H${status.current }"><label for="H${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-140<20 && fDto.fr_block-140>0}">
				<tr>
                	<th>H</th>
					<c:forEach begin="1" end="${fDto.fr_block-140}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="H${status.current }" onclick="clickBtn(this)" value="H${status.current }"><label for="H${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-160==0}">
				<tr>
					<th>H</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="H${status.current }" onclick="clickBtn(this)" value="H${status.current }"><label for="H${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- I구역 -->
				<c:if test="${fDto.fr_block-160>20 && fDto.fr_block-160>0}">
				<tr>
                	<th>I</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="I${status.current }" onclick="clickBtn(this)" value="I${status.current }"><label for="I${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-160<20 && fDto.fr_block-160>0}">
				<tr>
                	<th>I</th>
					<c:forEach begin="1" end="${fDto.fr_block-160}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="I${status.current }" onclick="clickBtn(this)" value="I${status.current }"><label for="I${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-180==0}">
				<tr>
					<th>I</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="I${status.current }" onclick="clickBtn(this)" value="I${status.current }"><label for="I${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- J구역 -->
				<c:if test="${fDto.fr_block-180>20 && fDto.fr_block-180>0}">
				<tr>
                	<th>J</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="J${status.current }" onclick="clickBtn(this)" value="J${status.current }"><label for="J${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-180<20 && fDto.fr_block-180>0}">
				<tr>
                	<th>J</th>
					<c:forEach begin="1" end="${fDto.fr_block-180}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="J${status.current }" onclick="clickBtn(this)" value="J${status.current }"><label for="J${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-200==0}">
				<tr>
					<th>J</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="J${status.current }" onclick="clickBtn(this)" value="J${status.current }"><label for="J${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- K구역 -->
				<c:if test="${fDto.fr_block-200>20 && fDto.fr_block-200>0}">
				<tr>
                	<th>K</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="K${status.current }" onclick="clickBtn(this)" value="K${status.current }"><label for="K${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-200<20 && fDto.fr_block-200>0}">
				<tr>
                	<th>K</th>
					<c:forEach begin="1" end="${fDto.fr_block-200}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="K${status.current }" onclick="clickBtn(this)" value="K${status.current }"><label for="K${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-220==0}">
				<tr>
					<th>K</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="K${status.current }" onclick="clickBtn(this)" value="K${status.current }"><label for="K${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- L구역 -->
				<c:if test="${fDto.fr_block-220>20 && fDto.fr_block-220>0}">
				<tr>
                	<th>L</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="L${status.current }" onclick="clickBtn(this)" value="L${status.current }"><label for="L${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-220<20 && fDto.fr_block-220>0}">
				<tr>
                	<th>L</th>
					<c:forEach begin="1" end="${fDto.fr_block-240}" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="L${status.current }" onclick="clickBtn(this)" value="L${status.current }"><label for="L${status.current }"></label></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-240==0}">
				<tr>
					<th>L</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><input type="checkbox" name="frs_account" id="L${status.current }" onclick="clickBtn(this)" value="L${status.current }"><label for="L${status.current }"></label></td>
                	</c:forEach>
                </tr>
				</c:if>
            </table>
        </div>
            <div class="f_res_detail">
                <h3 class="detail-title">선택한 구좌</h3>
                <!-- checked value -->
                <p class="detail-content" id="selectGujwa"></p>
                <h3 class="detail-title">선택한 구좌 수</h3>
                <!-- 선택한 구좌 수 -->
                <p class="detail-content"><span id="countGujwa" onchange="reserPrice()">0</span>개</p>
                <h3 class="detail-title">사용 시작일</h3>
                <!-- 사용시작일 -->
                <input type="date" id="frs_startdate">
                
                <input type="hidden" id="basePrice" value="${fDto.fr_price}">
                
            </div>
            <div class="f_res_pay">
                <h3 class="pay_left">결제금액</h3>
                <!-- 결제 금액 -->
                <h3 class="pay_right"><span id="fr_price2">0</span>원</h3>
                <input type="hidden" id="fr_price">
                <div style="margin-top: 20px;">
                    <input type="checkbox" id="pay_all" name="clause" onclick="selectAll(this)"><label for="pay_all">전체 동의</label><br/>
                    <input type="checkbox" id="pay_can" name="clause"><label for="pay_can">농장 이용규칙 및 취소/환불 규정 동의(필수)</label><br/>
                    <input type="checkbox" id="pay_uinfo" name="clause"><label for="pay_uinfo">개인정보 수집 및 이용 동의(필수)</label><br/>
                    <input type="checkbox" id="pay_other" name="clause"><label for="pay_other">개인정보 제 3자 제공 동의(필수)</label><br/>
                </div>
                <div class="pay_right">
                    <input type="button" value="결제하기" id="reserBtn">
                </div>
                <input type="hidden" value="${mDto.u_name}" id="u_name">
                <input type="hidden" value="${mDto.u_addr}" id="u_addr">
                <script>
                    // 전체 체크
                    function selectAll(selectAll){
                        const chbox = document.getElementsByName('clause');

                        chbox.forEach((checkbox)=>{
                            checkbox.checked = selectAll.checked;
                        });
                    }
                </script>
                <script type="text/javascript">
                // 카카오페이 결제
				$(function(){
			        $("#reserBtn").click(function(){
			        	var accountArr = [];
			            var account;
			            $("input[name='frs_account']:checked").each(function(i){
			                accountArr.push($(this).val());
			            });
			            account=accountArr.join();
			            if($("input:checkbox[name=clause]").is(":checked")==false){
			            	alert("결제 관련 동의에 모두 체크해주세요!");
			            	return false;
			            }else if($("#fr_price").val()==0){
			            	alert("예약하실 구좌를 선택해주세요!");
			            	return false;
			            }else{
			            	var pay_code=$("#farm_name").text()+$("#selectGujwa").text();
				             IMP.init('imp30403635');
				                 // IMP.request_pay(param, callback) 결제창 호출
				                 IMP.request_pay({ // param
				                     pg: "kakaopay",
				                     pay_method: "card",
				                     merchant_uid: pay_code,	// 결제코드
				                     name: pay_code,	//상품명
				                     amount: $("#fr_price").val(),	//결제금액
				                     buyer_email: "chlrjsgh555@naver.com",	//유저 이메일
				                     buyer_name: "${mDto.u_name}",	// 유저이름
				                     buyer_tel: "010-8121-3567",	// 유저 전화번호 (테스트라서)
				                     buyer_addr: "${mDto.u_addr}",	// 유저 주소
				                     buyer_postcode: "01181"
				                 }, function (rsp) { // callback
				                     if (rsp.success) {
	/* 			                        var msg = '결제가 완료되었습니다.\n';
				                        msg += '고유ID : ' + rsp.imp_uid+"\n";
				                        msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
				                        msg += '결제 금액 : ' + rsp.paid_amount; */
				                        
				                        location.href="./farm_do_reser?fr_no=${param.fr_no}&u_no=${session_uno}&py_price="+$("#fr_price").val()+"&frs_startdate="+$("#frs_startdate").val()+"&frs_account="+account;
				                        
				                     } else {
				                        var msg = '결제에 실패하였습니다.';
				                        msg += '에러내용 : ' + rsp.error_msg;
				                     }
				                 });
			            }
			            
			        });
			     });
				</script>
            </div>
        </form>
    </section>
    <%@ include file="../base/footer.jsp" %>
</body>
</html>