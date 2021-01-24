<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
function checkId() {
	id = document.getElementById("id").value; 
	var httpRequest = new XMLHttpRequest();
	var resultText = httpRequest.responseText;
	console.log(id);
	$.ajax({
		data : {id : id},
		url : './IdCheck.me',
		type : 'post',
		success : function (resultText) {
				console.log(resultText);
				if(resultText == 0){
					$("#id_check").text("사용중인 아이디");
					$("#id").css("background-color", "#FFCECE");
				} else if(resultText == 1){
					$("#id_check").text("사용가능한 아이디입니다.");
					$("#id").css("background-color", "#4CAF50");
				} else if(resultText == 2){
					$("#id_check").text("");
					$("#id").css("background-color", "#FFCECE");
				}
			
		},error : function() {
			console.log("실패");
		}
		
	});
};

function MemberCheck() {
	id = document.getElementById("id").value;
	if (id == "") {
		alert("아이디를 적어주세요.");
		document.getElementById("id").focus();
		return false;
	}
	
	httpRequest = new XMLHttpRequest();
	resultText = httpRequest.responseText;
	if(resultText == 0){
		alert("중복된 아이디입니다."); 
		document.getElementById("id").focus();
		return false;
	}
	
	name = document.getElementById("name").value;
	if (name == "") {
		alert("이름을 적어주세요.");
		document.getElementById("name").focus();
		return false;
	}
	
	password = document.getElementById("password").value;
	if (password == "") {
		alert("비밀번호를 적어주세요.");
		document.getElementById("password").focus();
		return false;
	}
	
	passwordcheck = document.getElementById("passwordcheck").value;
	if (passwordcheck == "") {
		alert("비밀번호 확인을 적어주세요.");
		document.getElementById("passwordcheck").focus();
		return false;
	} else if(passwordcheck != password){
		alert("비밀번호가 같지 않습니다.");
		document.getElementById("passwordcheck").focus();
		return false;
	}
	
	email = document.getElementById("email").value;
	atpos = email.indexOf("@");
	dotpos = email.indexOf(".");
	if (atpos < 1 || atpos+2 > dotpos || dotpos+2 > email.length) {
		alert("이메일을 적어주세요.");
		document.getElementById("email").focus();
		return false;
	}
	
	phonenumber= document.getElementById("phonenumber").value;
	if (phonenumber == "") {
		alert("전화번호를 적어주세요.");
		document.getElementById("phonenumber").focus();
		return false;
	}
	
	address = document.getElementById("address").value;
	if (address == "") {
		alert("주소를 적어주세요.");
		document.getElementById("address").focus();
		return false;
	}
}
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) { 

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = data.roadAddress;
           
        }
    }).open();
}
</script>
</head>
<body>
	
		<h1>회원가입</h1>
		
			<%-- <form action="./IdCheck.me" method="post">
				<table>
				<tr>
				<td width="87">아이디</td>
					<td><input type="text" name="id" id="id" value="${checkId}"></td>
					<td><button type="submit">중복체크</button></td>
					<td><c:choose>
						<c:when test="${check==0}">이미 사용중인 아이디입니다.</c:when>
						<c:when test="${check==1}">사용가능한 아이디입니다.</c:when>
					</c:choose>
					</td>
					</tr>
					</table>
				</form>  --%>
				
	<div align="left">
			<form action="./MemberService.me" method="post">
				<%-- <input type="hidden" name="id" id="id" value="${checkId}"> --%>
				
				
					<div>아이디</div>
					<div><input type="text" name="id" id="id" oninput="checkId()">
					<span id="id_check"></span></div>
					
					<div>성명</div>
					<div><input type="text" name="name" id="name"></div>
				
					<div>비밀번호</div>
					<div><input type="password" name="password" id="password"></div>
				
					<div>비밀번호 체크</div>
					<div><input type="password" name="passwordcheck" id="passwordcheck"></div>
				
					<div>이메일</div>
					<div><input type="text" name="email" id="email"></div>
				
					<div>핸드폰번호</div>
					<div><input type="text" name="phonenumber" id="phonenumber"></div>
					
				
				
				<div>주소</div>
				<div>
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				</div>
					
				<div>
					<input type="text" id="roadAddress" placeholder="도로명주소">
					<input type="text" id="detailAddress" placeholder="상세주소">
				</div>
				
			
			
			<div>
				<button type="submit" onclick="return MemberCheck()">회원가입</button>
				<button type="reset">초기화</button>
				 <button type="button" value="button" onclick="location.href='./main.jsp'">초기 화면</button>
			</div>
		</form>
	</div>
</body>
</html>