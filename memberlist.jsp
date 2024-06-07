<%@page import="spring.mybatis.service.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정</h1>
<!-- SpringMybatisController
@RequestMapping("/membersearchlist")
메소드(HttpServletRequest req)
or
메소드 (String item, String searchword)
1. item이 이름 검색이면 item="membername"
2. searchword = "%" + searchword + "%"
3. select * from members where item컬럼명 검색 like searchword sql 실행 service 요청 (dao - sql 추가 선택적)
4. List<MemberDTO> 리턴
5. 모델 저장
6. mybatis/memberlist.jsp 전달

select * from members where ${} like #{}
select * from members where item컬럼명 like '%searchword%' 
 -->

<form action="membersearchlist">
<select name="item">
	<option>이름 검색</option>
	<option selected="selected">아이디 검색</option>
	<option>폰번호 검색</option>
	<option>이메일 검색</option>
</select>
검색어:<input type=text name="searchword">

<input type=submit value="검색">
</form>
<hr>
<hr>

 <hr>
 <c:forEach items="${memberlist}" var="dto">
 <h1>
 ${dto.memberid }
 ${dto.membername }
 ${dto.email }
 ${dto.phone }
 ${dto.regdate }
 </h1> 
 </c:forEach>
 
</body>
</html>
