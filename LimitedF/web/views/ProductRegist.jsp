<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file="../common/menubar.jsp" %> --%>
	
	<div class="outer">
		<br>
		<h2 align="center">판매 상품 등록</h2>
		<div class="tableArea">
			<form action="<%=request.getContextPath() %>/insert.p" method="post">
				<table>
					<tr>
						<td>카테고리</td>
						<td>
							<select name="category">
								<option value="1">과일</option>
								<option value="2">채소</option>
								<option value="3">가공</option>
							</select>
					</tr>
				
					<tr>
						<td>상품명</td>
						<td colsapn="3"><input type="text" size="58" name="title" value="상품명을 입력하세요"></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><input type="number" size="58" name="title" value="상품명을 입력하세요">원</td>
					</tr>
					<tr>
						<td>재고량</td>
						<td><input type="number" size="58" name="title" value="상품명을 입력하세요">원</td>
					</tr>
					<tr>
						<td>원산지</td>
						<td colsapn="3"><input type="text" size="58" name="title" value="상품명을 입력하세요"></td>
					</tr>
					<tr>
						<td>생산일자</td>
						<td colsapn="3"><input type="text" size="58" name="title" value="상품명을 입력하세요"></td>
					</tr>
					<tr>
						<td>유통기한</td>
						<td colsapn="3"><input type="text" size="58" name="title" value="상품명을 입력하세요"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="60" name="content" style="resize:none"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="reset">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 게시판 작성하기 기능 구현하러 가기 -->
	<!--  InsertBoardServlet 만들러 ㄱㄱ씽 -->
	

</body>
</html>