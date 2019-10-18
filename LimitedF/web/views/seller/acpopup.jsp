<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="LF.seller.model.vo.Seller"%>

<%
	String bankName = request.getParameter("bankName");
	String acNum = request.getParameter("acNum");
	String acName = request.getParameter("acName");
	System.out.println(bankName + acNum + acName);

	String bank_code_std = "098";
	String account_num = "0001230000678";
	String account_holder_info = "8801012";
	String tran_dtime = "20160310101921";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<h1>사업자 정보 변경</h1>
	<form id="updateForm">
		<table border:1px gray solid>
			<!-- <tr>
				<td><label>은행명</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="bName" name="bName" onclick="getParameter()"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>입금계좌</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="account_num" name="account_num"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>예금주</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="account_holder_info" name="account_holder_info"></td>
				<td width="200"></td>
			</tr>
			<tr>
				<td><label>요청일시</label></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="13" id="tran_dtime" name="tran_dtime"></td>
				<td width="200"></td>
			</tr> -->
			<input type="text" id="bank_code_std" value="<%=bank_code_std%>">
			<input type="text" id="account_num" value="<%=account_num%>">
			<input type="text" id="account_holder_info"
				value="<%=account_holder_info%>">
			<input type="text" id="tran_dtime" value="<%=tran_dtime%>">




		</table>
		<p id="demo"></p>
		<br>
		<div class="btns" align="center">
			<button id="account" onclick="account();">변경하기</button>
		</div>

		<script>
			function account(){
				
				  var xhttp = new XMLHttpRequest();
				  xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				      //document.getElementById("print").innerHTML = this.responseText;
				      
				      
				      
				      $.ajax({
			            type:"post",
			            url:"https://openapi.open-platform.or.kr/inquiry/real_name",
			            header:{"Authorization":"Bearer 3ceWXJKLg8IzCXEHLYL9iAyZ7iJirRAtTx4YlP48"},
			            success:function(json){
			                var list = $.parseJSON(json);
			                var listLen = list.length;
			                var contentStr = "";
			                for(var i=0; i<listLen; i++){
			                    contentStr += "[기호"+ list[i].no+"] "+ list[i].name + "후보(" + list[i].job + ")</br>";
			                }
			                $("#demo").append(json);
			                $("#demo").append(contentStr);
			            }
			        })
	/* 
				      xmlDoc = xhttp.responseXML;
				      txt = "";
				      x = xmlDoc.getElementsByTagName("ARTIST");
				      for (i = 0; i < x.length; i++) {
				        txt += x[i].childNodes[0].nodeValue + "<br>";
				        }
				      $("#demo").val()= txt; */
				      
				      
				     /*  var type = request.getResponseHeader("Content-Type");
						//HTML 문서 형식은 받을 수 없으므로, 형식을 확인한다.
						if(type.indexOf("xml") !== -1 && request.responseXML) {
	
							//문서 형식일 때
							//callback(request.responseXML);
							$("#demo").val()=xhttp.responseXML;
							} else if(type === "application/json") {
							
							// JSON 형식일 때
							//callback(JSON.parse(request.responseText));
							$("#demo").val()=JSON.parse(xhttp.responseText);
							} else {
							
							// 문자열 형식일 때
							//callback(request.responseText); 
							$("#demo").val()=xhttp.responseText; */
	
	
						   /* var response = JSON.parse(this.responseText);
						  document.getElementById("print").innerHTML = response.ip;  */
					    
				  }/* 
				  xhttp.open("post", "https://openapi.open-platform.or.kr/inquiry/real_name", false);
				  xhttp.setRequestHeader("Content/json; charset=UTF-8", "application/json; charset=UTF-8");
				  xhttp.setRequestHeader("Authorization", "Bearer 3ceWXJKLg8IzCXEHLYL9iAyZ7iJirRAtTx4YlP48");
				  xhttp.send(); */
				  //xhttp.open("POST", "http://ipinfo.io/json", false);
				  //xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				  //xhttp.send("fname=Henry&lname=Ford");
				
			}
			}
		</script>
</body>
</html>