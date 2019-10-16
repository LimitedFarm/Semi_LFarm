<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="LF.seller.model.vo.Seller"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>

<body>
		
		<h1>사업자 정보 변경</h1>
<%-- 	<form id="updateForm" action="<%=request.getContextPath() %>/selregist.me" method="post"> --%>
		<table border:1px gray solid>
			<tr>
				<td><label>사업자명</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="bName" name="bName" onclick="getParameter()"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>사업자 등록번호</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="bNum" name="bNum"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>법인번호</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="cpNum" name="cpNum"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>사업자 등록증</label></td>
			</tr>
			<tr>
				<td><button>사업자 등록증 변경하기</button></td>
			</tr>
		
		</table>
		<br>
		<div class="btns" align="center">
			<button id="goMain" onclick="goMain();">메인으로</button>
		</div>

</body>
</html>