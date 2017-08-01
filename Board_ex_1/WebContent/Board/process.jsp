<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Process</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");	//한글 깨짐 처리
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		String mode = request.getParameter("mode");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String modifyId = request.getParameter("mId");
		String deleteId = request.getParameter("dId");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/board_ex_1", "root", "kimsk1");
			
			if(mode.equals("W")){
				ps = conn.prepareStatement("insert into board (title, writer, contents) values (?,?,?)");
				ps.setString(1, title);
				ps.setString(2, writer);
				ps.setString(3, contents);
				ps.executeUpdate();
				
				response.sendRedirect("list.jsp");
			}else if(mode.equals("M")){
				ps = conn.prepareStatement("update board set title=?, writer=?, contents=?, mod_date=current_timestamp where id=?");
				ps.setString(1, title);
				ps.setString(2, writer);
				ps.setString(3, contents);
				ps.setString(4, modifyId);
				ps.executeUpdate();
				
				response.sendRedirect("contentsView.jsp?viewId="+modifyId);
			}else if(mode.equals("D")){
				ps = conn.prepareStatement("delete from board where id = ?");
				ps.setString(1, deleteId);
				ps.executeUpdate();
				
				response.sendRedirect("list.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>