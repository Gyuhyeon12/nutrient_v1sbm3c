<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link rel="shortcut icon" href="/images/shortcut.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

</head>
 
<body>
<c:import url="/menu/top.do" />
 
  <div class='title_line'>${resVO.resname } > 글 등록</div>
  
  <aside class="aside_right">
    <a href="./create.do?resno=${resVO.resno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
    <span class='menu_divide' >│</span>
    <a href="./list_by_resno_search_paging.do?resno=${resVO.resno }">기본 목록형</a>    
    <span class='menu_divide' >│</span>
    <a href="./list_by_resno_grid.do?resno=${resVO.resno }">갤러리형</a>
  </aside>
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_resno_search_paging.do'>
      <input type='hidden' name='resno' value='${resVO.resno }'>  <%-- 게시판의 구분 --%>
      
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' class='input_word'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' class='input_word'>
        </c:otherwise>
      </c:choose>
      <button type='submit' class='btn btn-info btn-sm'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' class='btn btn-info btn-sm' 
                    onclick="location.href='./list_by_resno_search.do?resno=${resVO.resno}&word='">검색 취소</button>  
      </c:if>    
    </form>
  </div>
  
  <div class='menu_line'></div>
  <!-- enctype="multipart/form-data"이 선언을 빼면 파일 전송이 안된다. -->
  <form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="resno" value="${param.resno }">
    <!-- 개인 프로젝트에서 <input type="hidden" name="resno" value="${param.resno }">을 변경해야 한다. -->
    <div>
       <label>제목</label>
       <input type='text' name='title' value='신창 식당' required="required" 
                 autofocus="autofocus" class="form-control" style='width: 100%;'>
    </div>
    <div>
       <label>내용</label>
       <textarea name='rescontent' required="required" class="form-control" rows="12" style='width: 100%;'>식사는 언제나 즐거운 시간이었어요! </textarea>
    </div>
    <div>
       <label>검색어</label>
       <label style='float:right; margin-right: 180px'>메뉴</label>
       <input type='text' name='word' value='신창,음식,식당' required="required" 
                 class="form-control" style='float:left; width: 80%;'>
       
      <select id='foodno' name="foodno" class="form-select " style='width: 20%; '>
        <c:forEach var="foodVO" items="${list }" varStatus="info">
          <option id='foodno' value='${foodVO.foodno }'>${foodVO.foodname }</option>
        </c:forEach>
      </select>
    </div>   
    <div>
       <label>이미지</label>
       <input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택">
    </div>   
    <div>
       <label>패스워드</label>
       <input type='password' name='passwd' value='1234' required="required" 
                 class="form-control" style='width: 50%;'>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">등록</button>
      <button type="button" onclick="location.href='./list_by_resno_search_paging.do?resno=${param.resno}'" class="btn btn-secondary btn-sm">목록</button>
    </div>
  
  </form>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
