<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "LF.faq.model.vo.Faq,java.util.ArrayList"%>
	
	<%
	ArrayList<Faq> flist = (ArrayList<Faq>)request.getAttribute("flist");
	%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  align : center;
  padding: 18px;
  width: 650px;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.accordion:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}


.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease-out;   
}
.FAQbox{
	margin : 0 Auto;
 	padding :50px 20px;
 	width : 650px;
}
#OboMove {
	
	color : white;
	background-color : #4279ff ;
	cursor: pointer;
	border: none;
	padding : 10px;
	float: right;
	border-radius: 5px;
	outline:none;
	
}

#OboMove:hover{
	background-color : #024bff;
}
</style>
</head>
<body>


	<div style = "margin-top:130px;">
		<h2 align = "center">FAQ</h2>
	</div>
	<hr><br>
	
	<div class = "FAQbox">
	
	<% if(flist.size() == 0) {%>
	<button class = "accordion">질문이 없습니다.</button><br>
	<% } else { %>
		<% for(int i=0; i<flist.size(); i++) {%>
			<button class = "accordion"><%=flist.get(i).getfTitle() %></button>
			<div class = "panel">
				<p>
				<%=flist.get(i).getfContent() %>
				</p>
			</div>
		<%} %>
	<%} %>
	<br>
	
	<input type = "button" id = "OboMove" value = "1:1문의로 가기" onclick ="goObo();">
	
	
	</div>
	
	<script>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
  		acc[i].addEventListener("click", function() {  //아코디언 메뉴 클릭하면 
    
	this.classList.toggle("active");
  
    var panel = this.nextElementSibling;

    if (panel.style.maxHeight) {
    	  panel.style.maxHeight = null;
   		 } else {
  	    panel.style.maxHeight = panel.scrollHeight + "px";
  	  
  	  }
  	});
}
	function goObo(){
		location = "<%=request.getContextPath()%>/obo.go";
	};
</script>

	</body>
</html>