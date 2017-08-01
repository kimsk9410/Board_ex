<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<style type="text/css">
* {
	font-size: 9pt;
}

table thead tr th {
	background-color: gray;
	color: white;
}
</style>
</head>
<body>
	<table border="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="200" />
			<col width="100" />
			<col width="100" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록 일시</th>
			</tr>
		</thead>
		<tbody>

				<%
					Connection conn = null;
					PreparedStatement ps = null;
					ResultSet rs = null;
					
					boolean rsEmpty = true;	//게시물의 존재여부 확인

					try {
						// MySQL Driver 를 불러 들인다.
						Class.forName("com.mysql.jdbc.Driver");
						// 데이터베이스 커넥션을 위한 정보를 인자로 넘기며 커넥션을 얻는다.
						conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/board_ex_1", "root", "kimsk1");
						// 커넥션 객체를 얻은 후 질의문을 데이터베이스에 요청 한다.
						ps = conn.prepareStatement("select id, title, writer, reg_date from board");
						// 요청한 질의문을 실행 후 결과값을 받는다.
						rs = ps.executeQuery();
						while (rs.next()) {
							rsEmpty = false;
							// 검색된 게시물의 결과값을 표시
				%>
			<tr>
				<td align="center"><%=rs.getInt("id")%></td>
				<td><a href="contentsView.jsp?viewId=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a></td>
				<td align="center"><%=rs.getString("writer")%></td>
				<td align="center"><%=rs.getString("reg_date")%></td>
			</tr>
				<%
					}
						if (rsEmpty) {
				%>
				
				<td align="center" colspan="4">등록된 게시물이 없습니다</td>
				
				<%
					} else {
							rsEmpty = true;
						}
					} catch (Exception e) {
						e.printStackTrace();
						// try, catch 문 실행 완료 후 실행되는 데 사용객체들을 닫아준다.
					} finally {
						if (rs != null)
							rs.close();
						if (ps != null)
							ps.close();
						if (conn != null)
							conn.close();
					}
				%>

		</tbody>
		<tfoot>
			<tr>
				<td align="center" colspan="4">페이징없음</td>
			</tr>
		</tfoot>
	</table>
	<!-- //게시판 목록 영역 -->
	<p><input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'"/></p>
</body>
</html>