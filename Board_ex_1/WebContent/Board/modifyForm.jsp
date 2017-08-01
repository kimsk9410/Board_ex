<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
		function writeCheck() {
			var form = document.writeForm;
			if (form.title.value == '') {
				alert('제목을 입력하세요.');
				form.title.focus();
				return false;
			}
			if (form.writer.value == '') {
				alert('작성자을 입력하세요');
				form.writer.focus();
				return false;
			}
			if (!confirm("수정하시겠습니까?")){
				location.href="contentsView.jsp?viewId=<%=request.getParameter("mId") %>";
				return false;
			}
			return true;
		}
	</script>

	<form name="writeForm" action="process.jsp" method="post" onsubmit="return writeCheck();">
	<input type="hidden" name="mode" value="M" />
	<input type="hidden" name="mId" value=<%=request.getParameter("mId") %> />
	<table border="1" summary="게시판 수정 폼">
		<caption>게시판 수정 폼</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><input type="text" name="title" size="80" maxlength="100" value="<%=request.getParameter("mTitle") %>" /></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><input type="text" name="writer" maxlength="20" value="<%=request.getParameter("mWriter") %>" /></td>
			</tr>
			<tr>
				<th align="center">내용</th>
				<td><textarea name="contents" cols="80" rows="10"><%=request.getParameter("mContents") %></textarea></td>
			</tr>
		</tbody>
	</table>
	<p>
		<input type="button" value="목록" onclick="location.href='list.jsp'" />
		<input type="submit" value="수정"/>
	</p>
	</form>
</body>
</html>