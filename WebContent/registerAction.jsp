<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="bbs.BbsDAO" %> <!-- bbsdao�� Ŭ���� ������ -->
<%@ page import="java.io.PrintWriter" %> <!-- �ڹ� Ŭ���� ��� -->
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%


String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}

String title = request.getParameter("title");
String content = request.getParameter("content");
String contract = request.getParameter("contract");
int req = Integer.parseInt(request.getParameter("request"));



BbsDAO bbsDAO = new BbsDAO(); //�ν��Ͻ�����
int result = bbsDAO.write(userID,title,content,contract,req);	
if(result!=-1){

	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('�Խñ��� �ۼ��Ǿ����ϴ�.')");
	script.println("location.href = 'list.jsp'");
	script.println("</script>");
}
%>

</body>
</html>