<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
  <link rel="stylesheet" href="${contextPath}/resources/css/boardWrite.css">
    <script type="text/javascript" src="${contextPath}/resources/js/boardWrite.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
 <style>
 
 .cke_bottom {
    padding: 6px 8px 2px;
    position: relative;
    border-top: 1px solid #d1d1d1;
    background: #f8f8f8;
    display: none  !important ;
    }
    
.cke_button__exportpdf_icon {
    background: url(icons.png?t=4a1fb11f44) no-repeat 0 -528px !important;
    display: none !important;
    }
		#hh {
		  font-size: 20px;
		  margin-bottom: 20px;
		  color: #474554;
		  font-weight: bold;
		  padding-left:0;
		
		  
		}
		
</style>
    <title>WRITE</title>
   </head>
   <body>
 
<%-- request에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>
<c:if test="${ !empty message }">
    <script>
        alert("${message}");
        // EL 작성 시 scope를 지정하지 않으면
        // page -> request -> session -> application 순서로 검색하여
        // 일치하는 속성이 있으면 출력
    </script>
</c:if> 

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
       <form action="boardWrite" method="post"  onsubmit="return check();">
  <div class="container">
    <h1 id="hh">글쓰기</h1>
    <div class="tagsBox">
    <div class="tagsTitle">글머리</div>
    <div class="tagsBoxDetail">


      <label class="test_obj">
        <input type="radio" class="tagNotice" name="boardTag" value="1">
        <span>잡담</span>
    </label>
    <label class="test_obj">
      <input type="radio" class="tagBasic" name="boardTag" value="2">
      <span>질문</span>
  </label>

    </div>
    </div>
    
    <div class="boardTitle">제목</div>
   <div>
    <input type="text" name="boardTitle" class="title-input">
    </div>
    <div class="border"></div>
    <div class="boardContent">내용</div>

 <textarea id="content" name="boardContent" class="content-input"></textarea>
    
    
      <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
			CKEDITOR.replace('content',{
					 height:'350px'
					 ,filebrowserUploadUrl : '${contextPath}/fileupload.do'
			  });
		</script>
		
		
    <div class="submit-button">
      <button >작성</button>
 
    </div>
  </div>
</form>
<script>

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>