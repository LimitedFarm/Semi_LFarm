<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>�Ǹ��� ȸ�� ��û �� ����� ���� ������</title>
</head>
<body>

	<h1>�Ǹ��� ȸ�� ��û</h1>
	
	<div class="outer">
		<br>
		
 		<form id="joinForm" action="<%=request.getContextPath() %>/selregist.me" method="post">	 
			<table>
				<tr>
					<td width="200px">����� �̸� : </td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">����� ��Ϲ�ȣ</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">���� ��ȣ</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">�Աݰ��� �����</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">�Աݰ��� ���¹�ȣ</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">������</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td width="200px">����� �����</td>
					<td><input type="file" id="selReg" onchange="LoadImg(this)"></td>
				</tr>
				<tr>
					<td width="200px"></td>
					<td><img id="regImg" width="120" height="100"></td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				
				<!-- submit ��� 1(�Լ� Ȱ���ؼ� submit�ϱ�)(required���� X) -->
				<!-- <div id="joinBtn" onclick="insertMember();">�����ϱ�</div> -->
				
				<!-- submit ��� 2 -->
				<button id="joinBtn" type="submit">��û�ϱ�</button>	<!-- submit ��ư���� ���� �����ؾ� input�±׵���required�� �ߵ��� -->
				
				<!-- InsertMemberServlet ���鷯 ������! -->
			</div>
		</form>
	</div>
	
	<script>
		
		//ȸ�� ���� �ϱ�
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