<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
    StudentDAO dao = StudentDAO.getInstance();
    String id = request.getParameter("id");
	String pw = request.getParameter("password");
	int score = Integer.parseInt(request.getParameter("score"));
	int grade = Integer.parseInt(request.getParameter("grade"));
	
	//int num = sc.nextInt();
	int check=dao.checkId(id); // 다오의 checkId(아이디가 있는지 확인하는 것)에 check 값 넣기
	if(check == -1){ //id값이 중복되지 않으면
		StudentVO st = new StudentVO(id,pw,score,grade);
		dao.addStudent(st); //가입할 때 적은 값을 넣음
		%>
		<script>
			alert("가입을 축하합니다!");
			location.href='index.jsp';
		</script>
		<% 
		
	}else{
	%>
	<script>
		alert("아이디가 중복됩니다.");
		history.go(-1);
	</script>
	<% 
	}
%>
</body>
</html>