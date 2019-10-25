<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.DateFormat"  import="java.util.Calendar" import="java.text.SimpleDateFormat" import="java.util.Date"%>
    
<%
	 Calendar cal = Calendar.getInstance();
     cal.setTime(new Date());
     
     DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
     cal.add(Calendar.DATE, +5);
     
     String time = df.format(cal.getTime());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 정보등록</title>
	
	<input id="data" type="hidden" value="<%=time%>">
    
    <script type="text/javascript">
        function setParentText(){
        	
        	var pName = document.getElementById("cInput1");
        	var pPrice = document.getElementById("cInput2");
        	var pCount = document.getElementById("cInput3");
        	var pAdd1 = document.getElementById("sample6_address");
        	var pAdd2 = document.getElementById("sample6_detailAddress");
        	var pDay = document.getElementById("cInput5");
        	var pPeriod = document.getElementById("cInput6");
        	data1 = document.getElementById("data");
        	
        	if(pName.value=="" || pPrice.value=="" || pCount.value=="" || pAdd1.value=="" || pAdd2.value=="" || pDay.value=="" || pPeriod.value==""){
        		alert("입력되지 않은 항목이 있습니다.");
        		return false;
        	}
        	if(!(pPrice.value >= '0' && pPrice.value <= '9')){
        		alert("가격은 숫자만 입력 가능합니다.")
        		return false;
        	}
        	if(!(pCount.value >= '0' && pCount.value <= '9')){
        		alert("재고량은 숫자만 입력 가능합니다.")
        		return false;
        	}
        	if(pPeriod.value < (document.getElementById("data").value)){
        		alert("유통기한은 현재 날짜로부터 5일 이후인 상품만 등록이 가능합니다. \n" + (document.getElementById("data").value) + "부터 설정가능합니다.");
        		return false;
        	}
        	
        	opener.document.getElementById("pInput1").value = document.getElementById("cInput1").value
            opener.document.getElementById("pInput2").value = document.getElementById("cInput2").value
            opener.document.getElementById("pInput3").value = document.getElementById("cInput3").value
            opener.document.getElementById("add1").value = document.getElementById("sample6_address").value
            opener.document.getElementById("add2").value = document.getElementById("sample6_detailAddress").value
            opener.document.getElementById("add3").value = document.getElementById("sample6_extraAddress").value
            opener.document.getElementById("pInput5").value = document.getElementById("cInput5").value
            opener.document.getElementById("pInput6").value = document.getElementById("cInput6").value
            window.close();
   
        }
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


</head>
<body>

 

	<div style="margin-left: auto; margin-right:auto; border: 1px solid red; width: 600px;">
					
					<table>
							<tr>
								<td width="100px">판매 물품명</td> 
								<td>
									<input type="text" id="cInput1" size="30" name="title" value="" maxlength="15" placeholder="최대 20자 까지  등록이 가능합니다.">
								</td> 
							</tr>
							
							<tr>
								<td width="100px">가격</td>
								<td><input type="text" id="cInput2" size="20" name="title" style="text-align: right;">원<br></td>
							</tr>
							
							<tr>
								<td width="100px">재고량</td>
								<td><input type="text" id="cInput3" name="title" style="text-align: right;">개<br></td>
							</tr>
							
							<tr>
								<td width="100px">원산지</td>
								<td>
									<input type="text" id="sample6_address" placeholder="주소" readonly="readonly"><br>
									<input type="text" id="sample6_detailAddress" placeholder="상세주소" >
									<input type="text" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
								<br></td>
							</tr>

							<tr>
								<td width="100px">생산일자</td>
								<td><input type="date" id="cInput5" size="45" name="title"><br></td>
							</tr>
							
							<tr>
								<td width="100px">유통기한</td>
								<td><input type="date" id="cInput6" size="45" name="title">까지<br></td>
							</tr>

					</table>
					
					<input type="button" value="등록하기" onclick="setParentText()" style=" margin-left:40%; margin-right:40%; margin-top:20px; height:35px; width:90px;">
					<br><br>
	</div>
</body>
</html>