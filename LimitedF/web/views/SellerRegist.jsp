<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<td width="200px">사업자 이름  </td>
					<td><input type="text" maxlength="13" name="bName" required></td>
				</tr>
				<tr>
					<td width="200px">사업자 등록번호</td>
					<td><input type="text" maxlength="13" name="bNum" id="bNum" required></td>
					<td><button onclick="ckBisNo(bNum.value)">체크1</button></td>
				</tr>
				<tr>
					<td width="200px">법인 번호</td>
					<td><input type="text" maxlength="13" name="cpNum" required></td>
					<td><button onclick="isRegNo(cpNum.value)">체크2</button></td>
				</tr>
				<tr>
					<td width="200px">입금계좌 은행명</td>
					<td><input type="text" maxlength="13" name="bankName" required></td>
				</tr>
				<tr>
					<td width="200px">입금계좌 계좌번호</td>
					<td><input type="text" maxlength="13" name="acNum" required></td>
				</tr>
				<tr>
					<td width="200px">예금주</td>
					<td><input type="text" maxlength="13" name="acName" required></td>
				</tr>
				<tr>
					<td width="200px">사업자 등록증</td>
					<td><input type="file" id="sellerReg" onchange="LoadImg(this)"></td>
				</tr>
				<tr>
					<td width="200px"></td>
					<td><img id="regImg" width="120" height="100"></td>
				</tr>
			</table>
			
			<div class="btns" align="center">
				
				<button id="joinBtn" type="submit">신청하기</button>	<!-- submit 버튼으로 만들어서 실행해야 input태그들의required가 발동함 -->
				
				<!-- SellerRegistServlet으로 이동 -->
			</div>
		</form>
	</div>
	
	<script>
	//사업자 등록번호 체크
	function ckBisNo(bNum){
		if((bisNo = (bNum+'').match(/\d{1}/g)).length != 10){
			return flase;
			}
		
		var sum = 0, key = [1,3,7,1,3,7,1,3,5];
		
		
		for(var i=0; i<9; i++){
			sum += (key[i]*Number(bNum[i]));
		}
		
		window.alert(((10 - ((sum + Math.floor(key[8] * Number(bNum[8])/10)) % 10)) % 10) == Number(bNum[9]));	//true 넘어감
		
		return ((10 - ((sum + Math.floor(key[8] * Number(bNum[8])/10)) % 10)) % 10) == Number(bNum[9]);
		
	}
	
	//법인번호 체크
	function isRegNo(sRegNo)
	 {
	  var re = /-/g;
	  sRegNo = sRegNo.replace('-','');

	  if (sRegNo.length != 13){
	   return false;
	  }

	  var arr_regno  = sRegNo.split("");
	  var arr_wt   = new Array(1,2,1,2,1,2,1,2,1,2,1,2);
	  var iSum_regno  = 0;
	  var iCheck_digit = 0;

	  for (i = 0; i < 12; i++){
	    iSum_regno +=  eval(arr_regno[i]) * eval(arr_wt[i]);
	  }

	  iCheck_digit = 10 - (iSum_regno % 10);

	  iCheck_digit = iCheck_digit % 10;

	  if (iCheck_digit != arr_regno[12]){
		window.alert(false);
	    return false;
	  }else{
	  window.alert(true);
	  return true;
	  
	 }



	
		
 	$(function(){
		/* $("#selReg").hide(); */
		
		$("#regImg").click(function(){
			$("#sellerReg").click();
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