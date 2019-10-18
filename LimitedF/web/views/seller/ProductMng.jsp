<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="LF.product.model.vo.*, java.util.*"%>
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
	
	String pName = "상품명";
	int pPrice = 43434343;
	int pCount = 77373737;
	String createDate = "물품 등록일, DATE형";
	String pPeriod ="유통기한, DATE형";
	String pContent = "상품소개, 제품 정보, 물품정보 테이블에 있는 값이다. 상품소개테두리 만드는 속성 테두리는 border 속성으로 만듭니다. table, th, td 요소에 적용할 수 있습니다. tr 요소에는 적용되지 않습니다. 기본 모양 아무런 꾸밈을 하지 ...";
	
	//상품 대표 이미지도 불러와야 함. 대표 이미지는 물품번호가 같은 이미지 중 정보순서가 가장 이른 것(또는 파일 번호가 가장 이른 것)
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.inBtn{
	margin-left:auto;
	margin-right:auto;
	margin-top:20px;
	margin-bottom:20px;
		
</style>
</head>
<body>


<%-- <%@ include file="../common/menubar.jsp" %> --%>
	
	<div class="outer">
		<br>
		
		<h2 align="center">판매 상품 관리</h2>
		
		<!-- 공지사항 때와 마찬가지로 검색 부분이 있다. 기능 구현은 생략 -->
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="category">상품명</option>
				<option value="title">내용</option>
				<!-- 작성일자는 검색에서 따로 빼서 설정하게 해주는 게 낫지 않을가 -->
				<option value="writer">작성일자</option>
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
		
		<!-- 실제로 작업은 아래 스크립트에서 진행해야 함 -->
		
		<div class="tableArea">
			<table id="productTable" align="center" width="90%" border="1px solid black" style="border-collapse:collapse">
				<tr>
					<td rowspan="5" width="20%" height="30%">
						<div align="center" border="1px solid black">image</div>
					</td>
					<td rowspan="1" width="65%">상품명 : <%=pName %></td>
					<td rowspan="5" width="20%">
						<div class="inBtn" align="center"><button>정보 수정</button></div>	<!-- 판매글 수정 페이지로 이동 -->

						<div class="inBtn" align="center"><button>재고 추가</button></div>	<!-- 팝업 띄워서 재고량만 수정해줌 -->

						<div class="inBtn" align="center"><button>판매 중지</button></div>	<!-- 판매물품의 status 값을 'N'으로 변경해준다 -->
						
						<div class="inBtn" align="center"><button>리뷰 확인</button></div>	<!-- 해당 물품번호를 사용해서 판매내역 검색 후 결과값으로 나온 판매번호들을 통해 리뷰에서 다시 검색 : 리뷰 검색용 view를 만드는게 효율상 좋음  -->
						
					</td>
				</tr>
				<tr>
					<td rowspan="1">판매 가격 : <%=pPrice %></td>
				</tr>
				<tr>
					<td rowspan="1">재고 상태 : <%=pCount %></td>
				</tr>
				<tr>
					<td rowspan="1">판매 기간 : <%=createDate %> ~ <%=pPeriod %></td>
				</tr>
				
				<tr>
					<td >
						상품소개 : <%=pContent %>
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
	var pName = "<%=pName%>";
	var pPrice = <%=pPrice%>;
	var pCount = <%=pCount%>;
	var createDate = "<%=createDate%>";
	var pPeriod = "<%=pPeriod%>";
	var pContent = "<%=pContent%>";
	
	
	 $(document).ready(function(){
		 	if($("body").height() < $(window).height()){	//화면에 표시된 내용이 적어서 스크롤바가 생기지 않는 경우
		 		window.alert("There isn't a vertical scroll bar");
		 	}
		 $(window).scroll(function(){	//스크롤 이벤트 
			if($(window).scrollTop() == $(document).height() - $(window).height()){	//스크롤바 바닥까지 내려가면 내용 추가
				console.log(++page);
				$(".tableArea").append("<h1>Page" + page + "</h1>");
				$(".tableArea").append("<hr><table id='productTable' align='center' width='90%' border='1px solid black' style='border-collapse:collapse'>"
						+ "<tr><td rowspan='5' width='20%' height='30%'>" 
						+ "<div align='center' border='1px solid black'>image</div></td>"
						+ "<td rowspan='1' width='65%'>상품명 : " + pName + "</td>"
						+ "<td rowspan='5' width='20%'>"
						+ "<div class='inBtn' align='center'><button>정보 수정</button></div>"
						+ "<div class='inBtn' align='center'><button>재고 추가</button></div>"
						+ "<div class='inBtn' align='center'><button>판매 중지</button></div>"
						+ "<div class='inBtn' align='center'><button>리뷰 확인</button></div> </td> </tr>"
						+ "<tr><td rowspan='1'>판매 가격 : " +pPrice+"</td></tr>"
						+ "<tr><td rowspan='1'>재고 상태 : " +pCount +"</td></tr>"
						+ "<tr><td rowspan='1'>판매 기간 : " + createDate +"~"+ pPeriod +"</td></tr>"
						+ "<tr><td>상품소개 : "+pContent + "<br><div align='right'><button>신고하기</button></div></td></tr>"
						+ "</table>");
				
				
				
				//추가해야 할 내용
				//초기에 데이터 몇개나 불러올 것인지(되도록 스크롤바가 생길 수 있는 만큼의 값을 불러와야 함[대충 5개에서 10개 생각함])
				//스크롤 끝까지 닿으면 새로운 데이터 n개 불러온다
				//데이터가 더 이상 없으면 '데이터가 없음'을 알려줘야 한다 (+ 신규 판매 게시글 추가 버튼을 넣어서 신규 판매 게시글을 작성하는 링크 달아주기)
				//https://velopert.com/1890
				//https://sir.kr/qa/212594
			}
		 
		 });
	 });
	 
	 
	
	</script>
	
	
	


</body>
</html>