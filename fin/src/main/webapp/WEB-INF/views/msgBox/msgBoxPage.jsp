<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messageBoxPage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/messageBoxPage.css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPagebootStrap.css">
<link rel="stylesheet" href="${contextPath}/resources/css/msgBoxModal.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${contextPath}/resources/js/modal.min.js"></script>
<style>
	dl, ol, ul {
	    margin-top: 0;
	    margin-bottom: 0;
	    padding-left: 0;
	}
	body{
		line-height: normal;	
	}
	button, input, optgroup, select, textarea {
	    font-family : revert;
	    font-size: revert;
	    line-height: inherit;
	}

    p{
        margin-bottom: 0;
    }
	
	a:hover {
    color: revert;
	}
</style>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <c:if test="${!empty msgList}">
        	<ul class="messageWrapper">
            
            <c:forEach items="${msgList}" var="msgList" varStatus="status">
              <li>
                <img src="${contextPath}/resources/images/guitarduck.png" alt="">
                <div class="content">
                    <h4>${msgList.sendUserNick}</h4>
                    <p>
                      ${msgList.msgContent}<br> 
                      <span>${msgList.sendDate}</span>
                      <br>
                      <button class="msgDeleteBtn bi bi-trash" type="button"></button>
                      <input type="hidden" value="${msgList.msgNo}" id="msgNo">
                      <button type="button" class="msgReplyBtn bi-envelope js-static-modal-toggleSendMsg"></button>
                      <input type="hidden" value="${msgList.sendUserNo}" class="receiverUserNo"> <!--표시되는 건 보냈던 사람인데 답장시에는 받을 사람의 정보 -->
                    </p>
                </div>
              </li>

              
               

            </c:forEach>
          </ul>
        </c:if>

          

        <c:if test="${empty msgList}">
            <div class="emptyMsgBox">
                <h1>NO MESSAGE!</h1>
            </div>
        </c:if>

         

   
        <input type="hidden" value="" id="hiddenUserNo">

    

    
        <!-- block Modal -->
        <div class="container">

          <!-- <button class=" js-static-modal-toggle btn btn-primary " type="button">test</button> -->
          <div id="static-modalBlock" class="modal fade" tabindex="-1" role="dialog" style="display: none; padding-right: 17px; z-index: 9999;">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                </div>
                <div class="modal-body">
                  
                  <div class="sendMsgModalBox">
                    <h1>REPLY MESSAGE</h1>
                    <textarea name="" id="replyMsgText" cols="" rows=""></textarea>
                    <button id="msgSendModalBtn" class="bi bi-envelope" onclick="replyMsg()" type="button"></button>
                  </div>

                  
                </div>
                <div class="modal-footer">
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
          </div>
        </div>

    


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
      function opModal(receiverUserNo){
          document.getElementById("hiddenUserNo").value = receiverUserNo;
      }
    </script>

    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src = "${contextPath}/resources/js/messageBoxPage.js"></script>
</body>
</html>