<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  resize: vertical;
  
  
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #2a6fff;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  width : 100%;
  transition: 0.5s;
}

input[type=submit]:hover {
  background-color: #004dee;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width : 750px;
  margin : 0 auto;
}

.col-25 {
 
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
  transition: 0.5s;
}

.btn:hover {
  background-color: RoyalBlue;
}
.ImgPreview {
}
.ImgPreview img{
	
	max-width : 190px;
}


</style>
</head>
<body>
	<h1 align = "center">1:1문의</h1>
	<hr>
	<div class = "container">
	
	<table width ="600px" height="800px" align = "center" >
		<tr>
			<td width = "80px">
				<p>
					아이디 
				</p>
			</td>
			<td width = "380px"> 	
				 <p>request.getId</p> 
			</td>
			<td>
				<select id = "inquiryType">
					<option value = "상품문의">상품문의</option>
					<option value = "결제문의">결제문의</option>
					<option value = "배송문의">배송문의</option>
					<option value = "교환반품문의">교환반품문의</option>
					<option value = "취소환불문의">취소환불문의</option>
					<option value = "기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<label>E-MAIL</label>
			</td>
			<td>	
				<input type = "text">
				@ 
				<input type="text" name="selfdomain" id="selfdomain" value="" title="이메일 도메인 직접입력" style="width: 120px; position: absolute; top: 15px;">
					
					<select id ="sampledomin" name = "domain" style =" vertical-align: middle;">
						<option value = "">선택</option>
						<option value = "naver.com">naver.com</option>
						<option value = "gmail.com">gmail.com</option>
						<option value = "daum.net">daum.net</option>
						<option value = "hotmail.com">hotmail.com</option>
						<option value = "empas.com">empas.com</option>
						<option value = "yahoo.co.kr">yahoo.co.kr</option>
						<option value = "nate.com">nate.com</option>
						<option value = "self">직접입력</option>
					</select>
					
				<input type = "hidden" id = "putEmail" name = "putEmail">
			</td>
		</tr>
		<tr>
			<td>
				<label>전화번호</label> 
			</td>
				<td>
					<select style = "width : 70px">
						<option value = "010">010</option> 
						<option value = "011">011</option> 
						<option value = "016">016</option>
						<option value = "017">017</option>
						<option value = "018">018</option>
						<option value = "019">019</option>
					</select>
					-
					<input type="text" style = "width : 90px" maxlength="4">
					-
					<input type="text" style = "width : 90px" maxlength="4">
				</td>
		</tr>
		<tr >
		   <td>
				<label>제목</label>
			</td>
			<td colspan = "2">
				<input type ="text" style ="width : 400px;">
			</td>
		</tr>
		<tr>
			<td>
				<label>문의내용</label>
			</td>
		</tr>
		<tr>
			<td colspan ="3" align="center"><textarea rows = "20" cols = "80" style = "resize : none; width : 100%"></textarea> </td>
		</tr>
		<tr>
			<td colspan ="2">
				<button id = "uploadicon" class="btn"><i class="fa fa-folder"></i></button>
				<input id = "uploadroot" type = "file" multiple ="multiple">
				<p style = "margin-top :0px; margin-bottom:0px;" >이미지 미리보기</p>
			</td>
		</tr>
		<tr>
			
			
				<td colspan = "3" style ="height: 120px;padding-left: 10px;padding-top: 6px; background : white; border-radius: 5px;">
					<div class = "ImgPreview" style =" vertical-align: middle;"> </div>
				</td>
			
		</tr>
		<tr>
			<td>
			</td>
			<td>
			</td>
			<td>
				<br>
				<input type ="submit" value = "보내기">
			</td>
		</tr>

	</table>
</div>
		
		
		<script> /*email 합치는 스크립트 */
	
			$(function(){
		     //직접입력 인풋박스 기존에는 숨어있다가
		        $("#selfdomain").hide();
		        $("#sampledomin").change(function() {
		             //직접입력을 선택 시 나타남
		             if($("#sampledomin").val() == "self") {
		             $("#selfdomain").show();
		             //이메일 조합
		              var semail =  $('#emailId').val() + "@" + $('#selfdomail').val();
		                $("#putEmail").val(semail);
		              }else{
		                  $("#selfdomain").val("");
		                  $("#selfdomain").hide();
		                  var semail = $('#emailId').val() + "@" + $('#sampledomin').val();
		                  $("#putEmail").val(semail);
		                	}
		                 });
					});
			</script>



		
		
		<script>  /*file upload 아이콘 input= type = file 으로 합치기*/
				$('#uploadroot').hide();	
					$('#uploadicon').click(function(){
						$('#uploadroot').click(); 
			});
		</script>
	
		<script>  /*미리보기 이미지 뿌려주는 스크립트*/
		//이미지 정보들을 담을 배열
			var sel_files = [];

			index = 0;		
		
			count = 0; 
			
			$(document).ready(function(){
				
				$('#uploadroot').on("change", handleImgFileSelect);
				
				
			});
			
			function fileUploadAction(){
				console.log("fileUploadAction");
				$("#uploadroot").trigger('click');
			}
			
			
			
			function handleImgFileSelect(e){
				console.log("함수 실행 되는 타이밍");
				//이미지 정보들 초기화
				sel_files = [];
				
				
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
				
				
				
			if(count < 3) {
				
				if(filesArr.length <4){
				filesArr.forEach(function(f){
					
					console.log("count=index에서  count:" + count);
					console.log("count=index에서  index:" + index);
					if(count<3){

					
					//이미지 파일 아닌것 걸러내는 필터
					if(!f.type.match("image.*")){
						alert("이미지 파일만 업로드 가능합니다.");
						return;
					}
					
					//이미지 파일 f 를 sel files 배열에 push로 넣어주기
					sel_files.push(f);
					
					var reader = new FileReader();
					

					
					reader.onload = function(e){
						
						
						
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+index+")\" id=\"img_id_"+index+"\" style =\"padding-left:1px;padding-right:1px;\"><img src=\""+e.target.result 
								+ "\" data-file='"+f.name+"' class='selProductFile' title='클릭시 제거'></a>";
						index++;
						//ImgPreview div에 html 붙이고 인덱스 증가
						$(".ImgPreview").append(html);
					}
					count++;
					console.log("index : " +index);
					console.log("count : " + count);
			
						reader.readAsDataURL(f);	
						
						
						
				}else{
					alert("최대 세장까지 업로드 가능합니다.");
					
				}
				});
					}else{
						alert("최대 세장까지 업로드 가능합니다.");
					}
				
				}
					
			}
			
			
			//클릭시 사진 제거하는 펑션				
			function deleteImageAction(index){
				console.log("index : " + index);
				sel_files.splice(index,1);
				
				var img_id = "#img_id_" + index;
				$(img_id).remove();
				
				console.log(sel_files);
				count--;
				console.log("지울 떄 : " + count);
			}
		</script>
		
		
</body>
</html>