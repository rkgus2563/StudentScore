<%@page import="test.StudentVO"%>
<%@page import="test.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	/* int score = Integer.parseInt(request.getParameter("score")); */
	
	int check = dao.checkId(id); // 다오의 checkId(아이디가 있는지 확인하는 것)에 check 값 넣기
	if(check != -1){ // 아이디 값이 있으면
		/* StudentVO st = new StudentVO(id,pw,score); */
		dao.removeStudent(check); // 그 아이디 값을 지운다
		%>
		<script>
		alert("탈퇴가 완료되었습니다.");
		location.href='index.jsp';
		</script>
		<%
	}else{
%>
	<script>
	alert("존재하지 않는 아이디입니다.");
	history.go(-1); //전으로 돌아가기
	</script>
<%
	}
%>
</body>
</html>