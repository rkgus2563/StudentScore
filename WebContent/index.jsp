<%@ page import = "test.StudentVO" %>
<%@ page import = "test.StudentDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적 관리 프로그램 20102 김가현</title>
<style>
*{
	text-align : center;
	color : #D9849B;
	font-family : Arial;
	align-items : center;
}

button {
	width : 80px;
	height : 30px;
	border-radius : 10px;
	color : white;
	border : none;
	background-color : pink;
}

hr{
	 border : 1px dashed #D9849B; 
}
th{
border : none;
background-color : 	#F2D0A7;
color : BF7AA0;
}
td{
	padding : 10px;
	border : none;
	background-color : #F2CBBD;
}
table{	
	width : 30%;
	margin : auto;
	text-align : center;
	border : 1px solid pink;
}

.submit{
	width : 70px;
	height : 30px;
	background-color : white;
}

input{
	border : 1px solid pink;
	height : 20px;
	border-radius : 3px;
}
</style>
</head>
<body>	

<img src = "https://t1.daumcdn.net/cfile/tistory/990B403359EFF4D204" width = "100" height = "100"> 
	<h3>학생 성적 관리 프로그램</h3>
	<button onclick = "location.href = 'index.jsp?btn=1'">가입</button>
	<button onclick = "location.href = 'index.jsp?btn=2'">탈퇴</button>
	<button onclick = "location.href = 'index.jsp?btn=3'">정렬</button>
	<button onclick = "location.href = 'index.jsp?btn=4'">출력</button>
	<br><br><hr>
	
	<%
		request.setCharacterEncoding("utf-8");
   		StudentDAO dao = StudentDAO.getInstance();	
		ArrayList<StudentVO> list = dao.getAllList();
		if(request.getParameter("btn")!=null){
			int btn = Integer.parseInt(request.getParameter("btn"));
		if(btn ==1){
	%>	
		<h3>가입</h3>
		<form action = "insertStudent.jsp" method = "get">
			Id : <input type = "text" name = "id" required placeholder = "아이디를 입력해요"><br><br>
			Password : <input type = "password" name = "password" required placeholder = "비밀번호를 입력해요"><br><br>
			Score : <input type = "text" name = "score" required placeholder = "점수를 입력해요"><br><br>
			Grade : 1학년 <input type = "radio" name = "grade" value = "1">  
					2학년 <input type = "radio" name = "grade" value = "2">
					3학년 <input type = "radio" name = "grade" value = "3"><br><br>
			<input type = "submit" value = "등록" class = "submit">
		</form>
		<%
		}else if(btn ==2){
		%>
		<h3>탈퇴</h3>
		<form action = "deleteStudent.jsp" method = "get">
		Id : <input type = "text" name = "id" required placeholder = "아이디를 입력해요"><br><br>
		<input type = "submit" value = "확인" class = "submit">
		</form>
		<%
		}else if(btn == 3){
		%>
		<table border = "1">
		<tr>
		<th>이름</th>
		<th>학번</th>
		<th>점수</th>
		<th>학년</th>
</tr>
		<%
		dao.sortData(); // dao의 sortData불러오기 (정렬하는 것) -> 정렬 완료
		
		 for(int i = 0; i < list.size(); i++){ //리스트 사이즈만큼 for문 실행
			StudentVO vo = list.get(i); //vo에서 리스트 가져오기
			out.println("<tr><td>");
			out.println(vo.getId()); //ID가져오기
			out.println("</td><td>");
			out.println(vo.getPw()); //PW가져오기
			out.println("</td><td>");
			out.println(vo.getScore()); //SCORE가져오기
			out.println("</td><td>");
			out.println(vo.getGrade()); //GRADE가져오기
			out.println("학년</td></tr>");
		} 	
		%>
		</table>
		<h4>정렬이 완료되었어요! <br>다시 출력을 누르면 정렬이 된 상태로 출력이 돼요.</h4>
		<%
		}else if(btn == 4){
		%>
		<table border = "1">
<tr>
<th>이름</th>
<th>학번</th>
<th>점수</th>
<th>학년</th>
</tr>
<%
 for(int i = 0; i < list.size(); i++){ //리스트 사이즈만큼 for문 실행
	StudentVO vo = list.get(i); //vo에서 리스트 가져오기
	out.println("<tr><td>");
	out.println(vo.getId()); //ID가져오기
	out.println("</td><td>");
	out.println(vo.getPw()); //PW가져오기
	out.println("</td><td>");
	out.println(vo.getScore()); //SCORE가져오기
	out.println("</td><td>");
	out.println(vo.getGrade()); //GRADE가져오기
	out.println("학년</td></tr>");
} 	
%>
</table>
		<%
		}
		}
		%>
</body>
</html>