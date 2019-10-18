<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="LF.product.model.vo.*, LF.sList.model.vo.*, java.util.*"%>
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
	
	pList pl = new pList();
	pInfo pi = new pInfo();
	pAttachment pa = new pAttachment();
	sList sl = new sList();
	
	//sList(판매내역)의 값
	int sale_Id = 12345;
	String sale_date = "구매일시, DATE형";
	int sCount = 54321;
	
	//pList(판매물품)의 값
	String pName = "상품명";
	int pPrice = 43434343;
	int pCount = 77373737;
	String createDate = "물품 등록일, DATE형";
	String pPeriod ="유통기한, DATE형";
	String pContent = "상품소개, 제품 정보, 물품정보 테이블에 있는 값이다. 상품소개테두리 만드는 속성 테두리는 border 속성으로 만듭니다. table, th, td 요소에 적용할 수 있습니다. tr 요소에는 적용되지 않습니다. 기본 모양 아무런 꾸밈을 하지 ...";
	
	int allPrice = sCount * pPrice;	//총금액
	//상품 대표 이미지도 불러와야 함. 대표 이미지는 물품번호가 같은 이미지 중 정보순서가 가장 이른 것(또는 파일 번호가 가장 이른 것)
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
				<option value="writer">주문번호</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			<button>기간설정</button><!-- 기간설정 달력 선택하는거 만들어서 붙여주기. 리뷰,상품관리페이지 전부 다 똑같이 만들어줘야됨, 버튼이 아니라 달력으로 수정해야함 -->
			
			
			
			<!-- 공지사항 때와는 다르게 여기선 로그인을 한 사람만 게시글을 작성하게 하자 -->
			<%-- <% if(loginUser != null){%>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<%} %> --%>
			<!-- boardInsertForm.jsp 만들러 ㄱㄱ씽 -->
		</div>
		
		<br>
		
		<div class="tableArea">
			<table id="orderTable" align="center" width="90%" border="1px solid black" style="border-collapse:collapse">
				<tr>
					<td>주문번호</td>
					<td>상품정보</td>
					<td>주문일시</td>
				</tr>
				<tr>
					<td>판매번호 : <%=sale_Id %></td>
					<td style="white-space:nowrap">
						상품명 : <%=pName %><br>
						구매수량 : <%=sCount %><br>
						총금액 : <%=allPrice %>
					</td>
					<td>주문일시 : <%=sale_date %></td>
				</tr>
				<div id="tt">
				
				</div>
				
			</table>
		</div>
		
	</div>
	
	<script>
	 
	var page = 1;
	
	//값 받아오는거는 for문 돌리든 해서 넣기.
	var sale_Id = "<%=sale_Id%>";
	var pName = "<%=pName%>";
	var sCount = <%=sCount%>;
	var allPrice = <%=allPrice%>;
	var sale_date = "<%=sale_date%>";
	
	
	 $(document).ready(function(){
		 	if($("body").height() < $(window).height()){	//화면에 표시된 내용이 적어서 스크롤바가 생기지 않는 경우
		 		window.alert("There isn't a vertical scroll bar");
		 	}
		 $(window).scroll(function(){	//스크롤 이벤트 
			if($(window).scrollTop() == $(document).height() - $(window).height()){	//스크롤바 바닥까지 내려가면 내용 추가
				console.log(++page);
				$("#orderTable").append("<tr><td>판매번호 : " + sale_Id + "</td>"
						+ "<td style='white-space:nowrap'>"
						+ "상품명 :" + pName + "<br>"
						+ "구매수량 :" + sCount + "<br>"
						+ "총금액 :" + allPrice + "<br></td>"
						+ "<td>주문일시 :" + sale_date +"</td>");
				
				
				
				
				
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