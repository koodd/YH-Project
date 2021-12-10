<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base/myPage.jsp"%>



<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>해피홀팜</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">



</head>

<body>
	<section id="contentArea">
		<!--contentArea{-->
		<div class="contentTitle">
			<p>나의 게시글 관리</p>
		</div>
		<!--게시판 시작-->


		<div id="boardArea">
			<!--boardArea{-->
			<section class="b_table">
				<!--b_table{-->

				<div class="b_tr">
					<!--b_tr{-->
					<div class="b_th boardnum">번호</div>
					<div class="b_th boardtitle">제목</div>
					<div class="b_th boardwriter">닉네임</div>
					<div class="b_th boarddate">등록일</div>
					<div class="b_th boardhit">조회</div>
				</div>


				<!--}b_tr-->


				<c:forEach items="${map.list}" var="bTDto">

					<div class="b_tr">
						<div class="b_td">${bTDto.boardDto.bt_no}</div>
						<div class="b_td b_title">
							<c:forEach begin="1" end="${bTDto.boardDto.bt_indent}">
								>			
							</c:forEach>
							<a
								href="./my_board_view?bt_no=${bTDto.boardDto.bt_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}">${bTDto.boardDto.bt_title}</a>
						</div>
						<div class="b_td b_dates">${bTDto.memberDto.u_nickname}</div>
						<div class="b_td b_dates">${bTDto.boardDto.bt_date }</div>
						<div class="b_td b_dates">${bTDto.boardDto.bt_hit}</div>

					</div>

				</c:forEach>
			</section>
		</div>

	</section>
	<!--}contentArea-->
	<ul class="page-num">
		<a href="my_board_list?page=1&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="first"></li></a>
		<c:if test="${map.nDto.page<=1}">
			<li class="prev"></li>
		</c:if>
		<c:if test="${map.nDto.page>1}">
			
			<a	href="my_board_list?page=${map.nDto.page-1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="prev"></li></a>
		</c:if>
		<c:forEach var="nowpage" begin="${map.nDto.startpage}"
			end="${map.nDto.endpage}">
			<li class="num"><c:if test="${map.nDto.page!=nowpage}">
					<a href="my_board_list?page=${nowpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
				</c:if> <c:if test="${map.nDto.page==nowpage}">
					<div>${nowpage}</div>
				</c:if></li>
		</c:forEach>
		<c:if test="${map.nDto.page<map.nDto.maxpage}">
			<a href="my_board_list?page=${map.nDto.page+1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="next"></li></a>
		</c:if>
		<c:if test="${map.nDto.page>=map.nDto.maxpage}">
			<li class="next"></li>
		</c:if>
		<a href="my_board_list?page=${map.nDto.maxpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="last"></li></a>
	</ul>

	<form action="./my_board_list" name="search" method="get">
		<div class="nav">
			<div class="s_search">
				<div class="s_down">
					<div id="search_box_type">



						<select name="category" id="category" style="border: none;">
							<option value="bt_title">제목&nbsp;&nbsp;&nbsp;</option>
							<option value="bt_content">내용&nbsp;&nbsp;&nbsp;</option>
						</select>
					</div>
				</div>
				<div class="s_search_btn">
					<input name="searchword" type="text" class="s_sch" id="searchword">
					<button type="submit" style="">
						<img src="../images/btn_s_sch.gif">
					</button>

				</div>
			</div>
		</div>
	</form>

	<%@ include file="../base/footer.jsp"%>

	<link rel="stylesheet" href="../css/board.css">
</body>

</html>



