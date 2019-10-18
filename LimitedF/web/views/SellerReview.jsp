<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="LF.review.model.vo.*, java.util.*"%>
<%
/*	Seller s = (Seller)request.getAttribute("seller"); 
	//로그인 된 정보에서 Seller 계정 가져오기

 	String bName = s.getbName();
	String bNum = s.getbNum();
	String cpNum = s.getCpNum();
	
	//물품판매 권한 승인 여부에 따라 문구가 달라야 함
	String bStatus = s.getbStatus() != 'Y' ? "판매 권한 검토중입니다" : "승인 완료";
	
	String bankName = s.getBankName();
	String acNum = s.getAcName();
	String acName = s.getAcName();
	int fId = s.getfId();	//사업자 등록증 봐야 할 거 같다고 생각되면 파일 불러오는거 구현해야 함  */
	
	//리뷰 리스트 불러옴
	/* ArrayList<Review> rList = (ArrayList<Review>)request.getAttribute("rList"); */
	
	Review rv = new Review();
	
	int reId = 123;
	String reContent = "리뷰내용테두리 만드는 속성 테두리는 border 속성으로 만듭니다. table, th, td 요소에 적용할 수 있습니다. tr 요소에는 적용되지 않습니다. 기본 모양 아무런 꾸밈을 하지 ...";
	int grade = 3;
	char status = 'y';
	int sale_Id = 5353;
	int cId = 59;
	String review_Date = "작성일자";
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>


<%-- <%@ include file="../common/menubar.jsp" %> --%>
	
	<div class="outer">
		<br>
		
		
		
		
		<h2 align="center">상품 리뷰 확인</h2>
		
		<!-- 공지사항 때와 마찬가지로 검색 부분이 있다. 기능 구현은 생략 -->
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="category">상품명</option>
				<option value="writer">작성자</option>
				<option value="title">내용</option>
				<option value="content">별점</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			
			<!-- 추천순, 최신순 정렬 만들기 -->
			
			<!-- 공지사항 때와는 다르게 여기선 로그인을 한 사람만 게시글을 작성하게 하자 -->
			<%-- <% if(loginUser != null){%>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<%} %> --%>
			<!-- boardInsertForm.jsp 만들러 ㄱㄱ씽 -->
		</div>
		
		<br>
		
		<div class="tableArea">
			<table id="reviewTable" align="center" width="90%" border="1px solid black" style="border-collapse:collapse">
				
				<tr>
					<td colspan="3" width="60%" ><%=reId %></td>
					<td colspan="1" width="30%"><%=grade %></td>
				</tr>
				<tr>
					<td width="45%"><%=sale_Id %> </td>
					<td colspan="3" align="right" ><%=review_Date %></td>
				</tr>
				<tr>
					<td colspan="4" width="90%">
						<%=reContent %>
						<br><div align="right">
							<button>신고하기</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
	<div id="tt">
	</div>
	
	<script>
	
	var page = 1;
	
	//값 받아오는거는 for문 돌리든 해서 넣기.
	var reId = <%=reId%>;
	var grade = <%=grade%>;
	var sale_Id = <%=sale_Id%>;
	var review_Date = "<%=review_Date%>";
	var reContent = "<%=reContent%>";
	
	
	 $(document).ready(function(){
		 	if($("body").height() < $(window).height()){	//화면에 표시된 내용이 적어서 스크롤바가 생기지 않는 경우
		 		window.alert("There isn't a vertical scroll bar");
		 	}
		 $(window).scroll(function(){	//스크롤 이벤트 
			if($(window).scrollTop() == $(document).height() - $(window).height()){	//스크롤바 바닥까지 내려가면 내용 추가
				console.log(++page);
				$(".tableArea").append("<h1>Page" + page + "</h1>");
				$(".tableArea").append("<hr><table align='center' width='90%' border='1px solid black' style='border-collapse:collapse'>"
						+ "<tr><td colspan='3' width='60%' >" + reId + "</td><td colspan='1' width='30%'>" + grade + "</td></tr>"
						+ "<tr><td width='45%'>" + sale_Id + "</td><td colspan='3' align='right'>" + review_Date + "</td></tr>"
						+ "<tr><td colspan='4' width='90%'>" + reContent + "<br><div align='right'><button>신고하기</button></div></td></tr>"
						+ "</table>");
				
				
				
				//추가해야 할 내용
				//초기에 데이터 몇개나 불러올 것인지(되도록 스크롤바가 생길 수 있는 만큼의 값을 불러와야 함[대충 5개에서 10개 생각함])
				//스크롤 끝까지 닿으면 새로운 데이터 n개 불러온다
				//데이터가 더 이상 없으면 '데이터가 없음'을 알려줘야 한다
				//https://velopert.com/1890
				//https://sir.kr/qa/212594
			}
		 
		 });
	 });
	 
	 
	
	</script>
	
	
	


</body>
</html>