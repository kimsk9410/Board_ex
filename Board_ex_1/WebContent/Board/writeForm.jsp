<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WriteForm</title>
<style type="text/css">
	* {font-size: 9pt;}
	table tbody tr th {background-color: gray; color: white;}
</style>
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
			if (!confirm("등록하시겠습니까?")){
				location.href="list.jsp";
				return false;
			}
			return true;
		}
	</script>

	<form name="writeForm" action="process.jsp" method="post" onsubmit="return writeCheck();">
	<input type="hidden" name="mode" value="W" />
	<table border="1" summary="게시판 등록 폼">
		<caption>게시판 등록 폼</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td><input type="text" name="title" size="80" maxlength="100" /></td>
			</tr>
			<tr>
				<th align="center">작성자</th>
				<td><input type="text" name="writer" maxlength="20" /></td>
			</tr>
			<tr>
				<th align="center">내용</th>
				<td><textarea name="contents" cols="80" rows="10"></textarea></td>
			</tr>
		</tbody>
	</table>
	<p>
		<input type="button" value="목록" onclick="location.href='list.jsp'" />
		<input type="submit" value="글쓰기"/>
	</p>
	</form>
</body>
</html>