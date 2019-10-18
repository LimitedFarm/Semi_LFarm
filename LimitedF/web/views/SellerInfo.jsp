<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="LF.seller.model.vo.*"%>
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
	
	Seller s = new Seller();
	
	String bName = "사업자명";
	String bNum = "사업자번호";
	String cpNum = "법인번호";
	String bStatus = s.getbStatus() != 'Y' ? "판매 권한 검토중입니다" : "승인 완료";
	
	String bankName = "은행명";
	String acNum = "계좌번호";
	String acName = "예금주";
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>

</head>
<body>
<!-- 사업자 인증이 완료된 경우에만 사업자 정보 확인 가능 -->
<!-- 사업자 정보 페이지는 사업자 등록정보만 확인 가능 -->
<!-- 전화번호, 이메일, 주소, 비밀번호, 비밀번호 확인 등의 계정 정보 수정은 마이페이지에서 수정 -->
<!-- 사업자 등록 진행상황(미신청, 대기, 완료), 사업자 등록번호, 판매승인여부,  -->
	<h1>사업자 정보 확인</h1>
<%-- 	<%@ include file="../common/menubar.jsp"  %>  나중에 기본페이지 정해지면 변경해서 활성화--%>
	<div class="SellerInfoArea">
	<!-- memberJoinForm.jsp에 있는 table을 복사해서 쓰자 -->
<%-- 	<form id="updateForm" action="<%=request.getContextPath() %>/selregist.me" method="post"> --%>
		<form id = "bChange" >
		<table border="1px gray solid" style="border-collapse:collapse">
			<tr>
				<td width="150px" align="left">	사업자명   </td>
				<td> <%=bName %></td>
				<td><button id="bNameChange" onclick="bPopup(this.form)">사업자명 변경</button></td>
				<td><input type="hidden" id="bName" name="bName" value="<%=bName %>">
			</tr>
			<tr>
				<td width="150px">	사업자 등록번호   </td>
				<td> <%=bNum %> </td>
				<td><input type="hidden" value="<%=bNum %>">
			</tr>
			<tr>
				<td width="150px">	법인 번호   </td>
				<td> <%=cpNum %> </td>
				<td><input type="hidden" value="<%=cpNum %>">
			</tr>
		</table>
		</form>
		<table>	
			<tr>
				<td width="150px">판매 권한 승인 여부   </td>
				<td> <%=bStatus %> </td>
				<td style="width:200px"></td>
			</tr>
			<tr>
				<td width="150px">	입금계좌  </td>
				<td> <%=bankName %> / <%=acNum %> <%=acName %> </td>
				<td><button id="bankAccount" onclick="acPopup();">입금계좌 변경</button></td>
				<td style="width:200px"></td>
			</tr>
			
			
			
			
			

			<tr>
				<td width="150px">사업자등록증 :  </td>
				<td><%=acName %></td>
				<td style="width:200px"></td>
			</tr>
				
			</table>
			<br>
			<div class="btns" align="center">
				<button id="goMain" onclick="goMain();">메인으로</button>
			</div>

	</form>
	</div>
	<script>
		function goMain(){
			location.href="/LimitedF/index.jsp";
		}
		
		function bPopup(bChange){
			
            //var url="/testServlet";
            var url = "/LimitedF/views/bpopup.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
            /* 
            bChange.action = "testServlet";
            bChange.target = name;
            bChange.method = "post";
            bChange.submit(); */
           
            
        }
		
		function acPopup(){
			var url = "/LimitedF/views/acpopup.jsp";
            var name = "popup test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
            
		}
		/* 
		$("#bNameChange").click(function(){
			var bName = prompt("변경할 사업자명 입력 : ");
			
			$.ajax({
				url:"/LimitedF/bnc.do",		//SellerBNCServlet
				data:{bName:bname},
				type:"post",
				success:function(data){
					window.alert("사업자명 변경 완료");
				},
				error:function(data){
					window.alert("에러");
				}
			}); 
		});*/
		
	</script>
	
	
	









</body>
</html>