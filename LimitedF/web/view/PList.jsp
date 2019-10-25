<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR:200,300&display=swap&subset=korean" rel="stylesheet">
<meta charset="EUC-KR">
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>상품 등록페이지</title>
<style>


	.mainInfo{
	   
		border: 1px solid;
		border-color: #ddd #ddd #CACACA;
		width: 935px;
    	height: 461px;
    	margin-left:auto;
        margin-right:auto;
        margin-top:50px;

	}

	.mainArea{
		width: 935px;

    	border: 1px solid;
    	border-color: #ddd #ddd #CACACA;
    	margin-left:auto;
        margin-right:auto;
        margin-top:10px;
	}
	.btnArea{
		width: 100px;
		margin-left: auto;
	}

	.info {
    display: block;
    overflow: hidden;
    height: 13px;
    width: 100%;
    font-size: 15px;
    line-height: 13px;
    color: #999;
    white-space: nowrap;
    letter-spacing: -1px;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-wrap: normal;
    }
    
    
	.title {
	    min-height: 86px;
	    margin: 9px 0 26px 0;
	    font-size: 21px;
	    line-height: 29px;
	    color: #333;
	    font-weight: bold;
	    letter-spacing: -1px;
	    word-wrap: break-word;
	    word-break: break-all;
	}
	.dearArea {
		display:inline;float:left; width:466px; border: 0px solid;
	}
	

	.layer{
		margin-top: auto; 
	}
	
	.navList{
		padding: 0;
		margin: 0;
		list-style: none;
	}

	.tab ul {
		display: flex;
		height: 60px;
		border-bottom: 1px solid #5da62b;
	}
	
	.tab ul li {
		flex:1; 
	}

	.tab ul li:first-child a {
		border-left: 1px solid #ddd; 
	}
	.tab ul li a {
		display: block;
		height: 59px;
		border: 1px solid #ddd; 
		border-left: none;
		border-bottom: none;
		font-size: 14px;
		color: 505050;
		text-align: center;
		line-height: 59px; 
		text-decoration: none;
	}
	.tab ul li a.on:hover{
		position: relative;
		height: 58px;
		border-color: #5da62b;
		border-top-width: 2px;
		line-height: 57px;
		border-bottom: 1px solid #fff;
	}

	#imgArea{
		display:inline;
		float:left;
		width:465px; 
		height:460px;
		border: 1px solid; 
		border-color: #ddd #ddd #CACACA;
	}
	#imgArea:hover {
		cursor: pointer;
	}
	#imgs1:hover {
		cursor: pointer;
	}
	#imgs2:hover {
		cursor: pointer;
	}
	#imgs3:hover {
		cursor: pointer;
	}
	#imgs4:hover {
		cursor: pointer;
	}
	#imgs5:hover {
		cursor: pointer;
	}
	a.top {
	  position: fixed;
	  left: 50%;
	  bottom: 50px;
	  display: none;
	}
	 
</style>

<script>
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 200 ) {
			$( '.top' ).fadeIn();
		} else {
			$( '.top' ).fadeOut();
		}
	} );
	
	$( '.top' ).click( function() {
		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
		return false;
	} );
</script>


<script>
			$(function() {
				if(false){
					alert("비정상적인 접근입니다! (허가되지 않은 사용자)\n로그인후 이용해주세요!");
					window.close();
				}
				
				$("#fileArea").hide();
				
				$("#imgArea").click(function() {
					$("#mainImg").click();
				});
				
				$("#imgs1").click(function() {
					$("#ImgList1").click();
				});
				$("#imgs2").click(function() {
					$("#ImgList2").click();
				});
				$("#imgs3").click(function() {
					
					$("#ImgList3").click();
				});
				$("#imgs4").click(function() {
					$("#ImgList4").click();
				});
				$("#imgs5").click(function() {
					$("#ImgList5").click();
				});
				
				index = 1;
				// 추가버튼 클릭시 작동
				$("#addTable").click(function(){
					
					$addDiv = $("#ImgsTextArea");
					if(index <6){
						/* var $div = $("<div>").attr("id", "imgss"+index); */
						var $img = $("<img>").attr("id","imgs"+index).css({"width":"751px","height":"600px","margin-left":"3%","margin-right":"3%"});
						var $input = $("<input>").attr({"type":"file",
														"id":"ImgList"+index,
														"multiple":"multiple",
														"name":"pImg"+index,
														"onchange":"LoadImg(this,"+(1+index)+")"
														});
						
						var $textarea =$("<textarea>").attr({"rows":"15",
															 "cols":"104",
															 "id":"textList"+index,
															 "name":"pText"+index
														}).css({"margin-left":"3%","margin-right":"3%", "width":"745px"});
						$img.click(function(){
							$input.click();
						});
						$addDiv.append($img);
						$addDiv.append($textarea);
						$addDiv.append($input);
						
						index = index +1;
						
					}
					
				});
			});
 
			
			function LoadImg(value, num) {

				if(value.files[0]!=undefined) {	

					// value는 함수를 발동시킨 객체(file타입 input태그)이고

					// value.files[0]은 input태그로 파일을 선택 했으면 undefined가 아니고 선택 안했으면 undefined다.

					var reader = new FileReader();

					reader.onload = function(e) {

						switch (num) {
						case 1:
							$("#titleImg").attr("src",e.target.result);
							break;
						case 2:
							$("#imgs1").attr("src",e.target.result);
							break;
						case 3:
							$("#imgs2").attr("src",e.target.result);
							break;
						case 4:
							$("#imgs3").attr("src",e.target.result);
							break;
						case 5:
							$("#imgs4").attr("src",e.target.result);
							break;
						case 6:
							$("#imgs5").attr("src",e.target.result);
							break;
						
						}

					}

					reader.readAsDataURL(value.files[0]);

				}

			}
			
			  var idx;
			  var obj_table;
			  function my_init() {
			    idx = 0;
			    obj_table = document.all.Imgss.cloneNode(true);
			  }
			  function add_table() {
			    if (idx<4) {  //등록가능갯수 5개로 제한
			        idx++;
			        eval("document.all.Imgss"+(idx>1?idx-1:"")).insertAdjacentHTML("afterEnd",obj_table.outerHTML.replace("Imgss","Imgss"+idx));
			        
			    }
			  }
			  
	        function openChild() {
	            // window.name = "부모창 이름"; 
	            window.name = "PList.jsp";
	            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	            window.open("Popup.jsp",
	                    "childForm", "margin-left=auto margin-right=auto width=660, height=280, location = no, resizable = no, scrollbars = no");    
	        }
		</script>
	

</head>



<body onload=my_init()>

	<form action = "<%=request.getContextPath()%>/insert.bo" method="post" encType="multipart/form-data">

		<div class="layer">
		
			<div class="mainInfo">
				<div id="imgArea">
					<img src="../images/main.png" id="titleImg" width="465px" height="460px" name="pMainimg">
				</div>
				

			<br><br><br><br>
				<div class="dearArea">
					<div id="List">
	   						<font size="5em" color="black" style="font-family: Noto Serif KR">판매 물품명 : </font> <input type="text" name="pName" style=" width:305px; height:30px; font-size:20px; color:red; border: 0px;" id="pInput1" readonly="readonly">
	   						 <font size="5em" color="black" style="font-family: Noto Serif KR"">가격 : </font><input type="text" name="pPrice" style=" width:150px; text-align:right; font-size:20px; color:red; border: 0px;" id="pInput2" readonly="readonly" >원<br>
	   						 <font size="4em" color="black" style="font-family: Noto Serif KR"">재고량 : </font> <input type="text" name="pCount" style=" width:150px; text-align:right; font-size:18px; color:black; border: 0px;" id="pInput3" readonly="readonly">개<br>
	   						<font size="4em" color="black" style="font-family: Noto Serif KR""> 원산지 : </font>
								<input type="text" size="30" id="add1" name="add1" style="font-size:18px; color:black; border: 0px;" readonly="readonly"><br>
								<input type="text" style="border: 0px solid; width: 61px;" readonly="readonly">
								<input type="text" size="10"id="add2" name="add2" style="font-size:18px; color:black; border: 0px;" readonly="readonly">
								<input type="text" size="15" id="add3" name="add3"style="font-size:18px; color:black; border: 0px;" readonly="readonly"><br>
	   						 <font size="3em" color="black" style="font-family: Noto Serif KR"">생산일자 : </font> <input type="date" name="pDay" style="font-size:15px; color:black; border: 0px;" id="pInput5" readonly="readonly"><br>
	   						 <font size="3em" color="black" style="font-family: Noto Serif KR"">유통기한 : </font> <input type="date" name="pPeriod" style="font-size:15px; color:black; border: 0px;" id="pInput6" readonly="readonly"><br><br>
					
					</div>
   						 
   					<div>
   						<button type="button" id="resetAll" style="margin-left: 100px">모든 내용 지우기</button>
	   					<input type="button" value="기본정보 입력하기" onclick="openChild()" style="margin-left: 40px">
   					</div>
   					<script>
   						$("#resetAll").click(function() {
		   					$('#pInput1').val('');
		   					$('#pInput2').val('');
		   					$('#pInput3').val('');
		   					$('#add1').val('');
		   					$('#add2').val('');
		   					$('#add3').val('');
		   					$('#pInput5').val('');
		   					$('#pInput6').val('');
						});
   						
   					</script>
   					<br><br><br>
				</div>
				


				
			</div>
		</div>
		
		<div style="width: 935px; margin-left: auto; margin-right: auto;">
			<hr>
		</div>
		
		<div class="mainArea">
			<nav class="tab">
				<ul class="navList">
					<li><a href="#sList1" class="on">1. 상품정보</a></li>
					<li><a href="#sList2" class="on">2. 상품 유의사항</a></li>
					<li><a href="#sList3" class="on">3. 배송 유의사항</a></li>
					<li><a href="#sList4" class="on">4. 등록 및 승인요청</a></li>
				</ul>
			
			</nav>
			
			
			<div id="sList1" style="margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid; border-color: #ddd #ddd #CACACA;">
					<br>
					
					<!-- <div id="vedioArea" style="margin-left: auto; margin-right:auto;  width: 750px; height: 550px; border: 1px solid red;">
						<input type="file" value="동영상 업로드" name="pVideo">
					</div> -->
					
					<br>
					

					
					<div id="ImgsTextArea" style="margin-left: auto; margin-right:auto; width: 800px; height: 100%;">
						<div id ="Imgss">								
				     		
						</div>
					</div>
					
					<div style="margin-left: 45%; margin-right: 45%">
						<input id="addTable" type="button" value="내용 추가">
					</div>
					
					<br>
				
					
				</div>
				
			
			
			<div id="sList2" style="margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid; border-color: #ddd #ddd #CACACA;">
				상품 유의사항 작성
				<textarea name="pNotice" rows="10" cols="130" style="width: 927px; height: 250px"></textarea>
			</div>
			
			<div id="sList3" style="margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid; border-color: #ddd #ddd #CACACA;">
				배송 유의사항 작성
				<textarea name="pDelivery" rows="10" cols="130" style="width: 927px; height: 250px"></textarea>
			</div>
			
			<div id="sList4" style="margin-left: auto; margin-right: auto; margin-top: 20px; border: 1px solid; border-color: #ddd #ddd #CACACA;">
				<div style="width: 600px; height: 100px; margin-left: 45%; margin-right: 45%; margin-top: 5%">
					<input type="submit" value="게시글 등록요청">
				</div>
			</div>
			
		</div>
		<a href="#" class="top" style="margin-left: 40%"><img src="../images/upup.png"></a>

		<div id="fileArea">
			<input type="file" id="mainImg" multiple="multiple" name="mainImg" onchange="LoadImg(this,1)">
		</div>
				<br><br><br><br><br>
	
	</form>
	
</body>
</html>