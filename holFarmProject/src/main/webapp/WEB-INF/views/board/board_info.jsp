<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->
<html>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>해피홀팜</title>
<style>
</style>
</head>

<body>



	<%@ include file="../base/header.jsp"%>




	<section>
		<div class="mainimg">
			<img src="../images/board01.jpg">

			<div class="p_message">
				<span><a href="../main" style="color: blue;">HOME</a>>커뮤니티>정보게시판</span>
			</div>
		</div>
	</section>



	<section id="tabMenuArea">
		<!--TabMenuArea{-->
		<table class="tabMenu">
			<!--tabMenu{-->
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">

			</colgroup>
			<tbody>
				<tr>
					<td>
						<p>
							<a href="board_trade?bc_no=4" style="border-right: none;">유저거래</a>
						</p>
					</td>
					<td class="on">
						<p>
							<a href="board_info" style="border: none;">정보게시판</a>
						</p>
					</td>
					<c:if test="${session_ucno==1}">

						<td><p>
								<a href="board_user?bc_no=2" style="border-left: none;">유저게시판</a>
							</p></td>
					</c:if>
					<c:if test="${session_ucno==2}">
						<td>
							<p>
								<a href="board_farm?bc_no=3" style="border-left: none;">농장주게시판</a>
							</p>
						</td>
					</c:if>
					<td>
						<p>
							<a href="board_free?bc_no=1" style="border-left: none;">자유게시판</a>
						</p>
					</td>
				</tr>
			</tbody>
		</table>
		<!--}tabMenu-->
		<div class="wid1200">
			<span class="whiteBar whiteBar400" style="left: 400px;"></span>
		</div>
	</section>
	<!--}TabMenuArea-->
	<!--}상단 이미지 화면~탭메뉴 호출-->


	<section id="contentArea">
		<!--contentArea{-->
		<div class="contentTitle">
			<p>정보게시판</p>
		</div>
	</section>

	<!-- Post -->
	<section class="bg0 ">
		<div class="container">
			<div class="row">
				<c:forEach items="${map.list}" var="bDto">
					<div class="col-sm-6 ">
						<!-- Item latest -->
						<div class="board_info">
							<a
								href="./board_info_view?bn_no=${bDto.bn_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"
								class="boardinfo_img">
								<div>
									<c:if test="${bDto.bn_upload != null }">
										<img src="../upload/${bDto.bn_upload}" alt="IMG">
									</c:if>
									<c:if test="${bDto.bn_upload == null }">
										<img src="../images/main3.jpg" alt="IMG">
									</c:if>
								</div>
							</a>

							<div class="board_info_l">
								<h5 class="board_info_m">
									<a
										href="./board_info_view?bn_no=${bDto.bn_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"
										class="board_info_s ">${bDto.bn_title }</a>
								</h5>

								<span class="board_info_date"> ${bDto.bn_date } <span
									class="board_info_hit"> 조회수 : ${bDto.bn_hit } </span>
								</span>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
				<ul class="page-num">

		<a href="board_info?page=1&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="first"></li></a>
		<c:if test="${map.nDto.page<=1}">
			<li class="prev"></li>
		</c:if>
		<c:if test="${map.nDto.page>1}">
			<a
				href="board_info?&page=${map.nDto.page-1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="prev"></li></a>
		</c:if>
		<c:forEach var="nowpage" begin="${map.nDto.startpage}"
			end="${map.nDto.endpage}">
			<li class="num"><c:if test="${map.nDto.page!=nowpage}">
					<a href="board_info?&page=${nowpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
				</c:if> <c:if test="${map.nDto.page==nowpage}">
					<div>${nowpage}</div>
				</c:if></li>
		</c:forEach>
		<c:if test="${map.nDto.page<map.nDto.maxpage}">
			<a href="board_info?&page=${map.nDto.page+1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="next"></li></a>
		</c:if>
		<c:if test="${map.nDto.page>=map.nDto.maxpage}">
			<li class="next"></li>
		</c:if>
		<a href="board_info?&page=${map.nDto.maxpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="last"></li></a>
	</ul>

	
		
		</div>
				<form action="board_info" name="search" method="get" style="margin: 0 auto;">
				<div>
					<div class="nav">
						<div class="s_search">
							<div class="s_down">
								<div id="search_box_type">

									<select name="category" id="category" style="border: none;">
										<option value="bn_title">제목&nbsp;&nbsp;&nbsp;</option>
										<option value="bn_content">내용&nbsp;&nbsp;&nbsp;</option>
									</select>

								</div>
							</div>
							<div class="s_search_btn">
								<input name="searchword" type="text" class="s_sch"
									id="searchword">
								<button type="submit" style="">
									<img src="../images/btn_s_sch.gif">
								</button>

							</div>
						</div>
					</div>
				</div>
			</form>

	</section>





	<%@ include file="../base/footer.jsp"%>

	<link rel="stylesheet" href="../css/board.css">




</body>

</html>




