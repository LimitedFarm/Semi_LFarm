<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>판매자 회원 신청 및 사업자 인증 페이지</title>
</head>
<body>

	<h1>판매자 회원 신청</h1>
	
	<div class="outer">
		<br>
		
 		<form id="joinForm" action="<%=request.getContextPath() %>/selregist.me" method="post">	 
			<table>
				<tr>
					<td width="200px">사업자 이름 : </td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">사업자 등록번호</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">법인 번호</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">입금계좌 은행명</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">입금계좌 계좌번호</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">예금주</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">사업자 등록증</td>
					<td><input type="file" id="selReg" onchange="LoadImg(this)"></td>
				</tr>
				<tr>
					<td width="200px"></td>
					<td><img id="regImg" width="120" height="100"></td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				
				<!-- submit 방법 1(함수 활용해서 submit하기)(required동작 X) -->
				<!-- <div id="joinBtn" onclick="insertMember();">가입하기</div> -->
				
				<!-- submit 방법 2 -->
				<button id="joinBtn" type="submit">신청하기</button>	<!-- submit 버튼으로 만들어서 실행해야 input태그들의required가 발동함 -->
				
				<!-- InsertMemberServlet 만들러 ㄱㄱ씽! -->
			</div>
		</form>
	</div>
	
	<script>
		
		//회원 가입 하기
		function insertMember(){
			$("#joinForm").submit();
		}
		
		
		$(function(){
			/* $("#selReg").hide(); */
			
			$("#regImg").click(function(){
				$("#selReg").click();
			});
		});
		
		function LoadImg(value){
			if(value.files[0]!=undefined){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("#regImg").attr("src",e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>

</body>
</html>