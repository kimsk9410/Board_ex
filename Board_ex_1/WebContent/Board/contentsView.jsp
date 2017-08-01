<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contents View</title>
<style type="text/css">
	* {font-size: 9pt;}
	table tbody tr th {background-color: gray; color: white;}
</style>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	
		String viewId = request.getParameter("viewId");
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/board_ex_1", "root", "kimsk1");
			ps = conn.prepareStatement("select title, writer, contents from board where id=?");
			ps.setString(1, viewId);
			rs = ps.executeQuery();
			
			if(rs.next()){
	%>

	<table border="1" summary="게시글 내용">
		<caption>게시글 내용</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><%=rs.getString("title") %></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><%=rs.getString("writer") %></td>
			</tr>
			<tr>
				<th align="center">내용</th>
				<td><%=rs.getString("contents") %></td>
			</tr>
		</tbody>
	</table>
	<p>
		<input type="button" value="목록" onclick="location.href='list.jsp'" />
		<input type="button" value="수정" onclick="location.href='modifyForm.jsp?mId=<%=viewId %>&mTitle=<%=rs.getString("title") %>&mWriter=<%=rs.getString("writer") %>&mContents=<%=rs.getString("contents") %>'"/>
		<input type="button" value="삭제" onclick="deleteCheck()"/>
	</p>

	<%			
			}else{
				//내용 없다는 오류메시지 발생.
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
		}
	%>
	
	<script type="text/javascript">
		function deleteCheck(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
			location.href="process.jsp?dId=<%=viewId %>&mode=D";
			return true;
		}
	</script>
</body>
</html>