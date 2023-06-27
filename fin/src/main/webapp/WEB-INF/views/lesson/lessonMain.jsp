<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lessons</title>
<link rel="stylesheet" href="${contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${contextPath}/resources/css/lesson.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
    
    <section class="firstSec">
	    <div class="titleBox lessonSvgBox" onclick="location.href='${contextPath}/lesson'">
	        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1367.59 762">
	            <g id="lessonPage">
	              <path class="lessonBackPath" d="m.5,115.5c5.81-1.71,15.25-4.49,27-8,16.52-4.93,19.25-5.82,25-7,16.05-3.3,27.49-3.11,31-3,7.31.22,13.35.45,21,3,2.03.68,9.16,3.18,17,9,9.67,7.18,14.78,15.22,19,22,2.84,4.56,7.42,12.71,11,24,2.68,8.45,2.59,11.68,6,40,1.74,14.41.02-.83,5,34,1.61,11.27,2.42,17.31,7,24,1.63,2.38,7.86,11.49,17,12,2.08.12,3.56-.25,11-3,13.11-4.84,18-7,18-7,16.35-7.21,24.53-10.82,25-11,9.46-3.59,16.94-5.47,27-8,10.35-2.6,15.51-3.94,23-5,8.06-1.15,18.11-2.51,31-1,5.71.67,14.03,1.7,24,6,3.91,1.69,10.79,4.71,18,11,7.26,6.33,11.18,12.74,15,19,2.2,3.61,5.29,8.72,8,16,3.07,8.24,2.48,10.72,6,20,.7,1.83,2.68,6.89,6,13,5.52,10.15,11.41,17.1,14,20,2.06,2.31,8.34,9.16,18,16,5.73,4.06,13.16,9.32,18,9,.66-.04,3.66-.35,7,1,.89.36,1.73.39,2,1,.53,1.2-1.1,3.7-3,4-2.16.34-3.25-2.39-5-2-1.62.36-2.29,3.05-3,6-.47,1.96-.8,4.12-1,10-.14,4.27-.22,6.41,0,8,.45,3.31.77,6.38,3,9,.67.79,1.38,1.38,4,3,3.73,2.31,5.6,3.46,9,5,3.24,1.47,2.33,1.34,16,9,7.12,3.99,13.73,7.7,22,12,2.53,1.32,1.88.95,18,9,5.98,2.98,11.39,5.69,22,11,15.27,7.64,14.71,7.37,16,8,13.83,6.73,23.78,11.04,26,12,4.96,2.14,8.97,3.76,17,7,9.6,3.88,12.54,4.93,16,6,3.48,1.07,6.35,1.81,11,3,6.47,1.66,8.11,1.89,9,2,5.53.69,9.81.16,11,0,3.71-.51,4.75-1.2,11-3,5.19-1.5,5.84-1.41,12-3,8.39-2.16,8.21-2.58,17-5,7.76-2.14,8.34-1.93,20-5,5.71-1.5,9.99-2.71,11-3,8.33-2.36,11.22-3.4,20-6,5.4-1.6,4.99-1.41,14-4,12.7-3.65,19.05-5.47,27-8,3.26-1.04,2.78-.91,21-7,4.3-1.44,8.77-2.68,15-5,5.73-2.13,8.8-3.46,10-4,6.59-2.99,7.35-3.29,8-4,2.49-2.7,2.66-6.13,3-13,.2-4.05.3-6.74-1-10-.75-1.89-1.61-4.24-4-6-1.77-1.3-3.33-1.4-7-2-5.8-.95-1.9-.66-10-2-5.48-.91-8.82-1.3-14-2-1.13-.15-5.42-.77-14-2-10.62-1.53-16.76-2.57-32-5-7.13-1.13-15.42-2.42-32-5-25.17-3.91-25.26-3.86-32-5-13.67-2.3-24.7-4.41-33-6-18.21-3.49-19.26-3.98-31-6-8.27-1.42-10.73-1.69-25-4-7.66-1.24-15.53-2.58-24-4-5.98-1-9.99-1.67-18-3,0,0-7.2-1.2-20-3-5.48-.77-7.35-.99-10-1-3.58,0-7.1.7-14,2-5.48,1.03-5.52,1.19-10,2-7.02,1.28-7.79,1.05-13,2-2.92.53-7.28,1.69-16,4-15.25,4.04-11.05,3.46-14,4-3.23.6-5.77.84-6,2-.17.87,1.05,1.82,6,5,4.03,2.59,6.04,3.88,8,5,4.4,2.51,7.3,4.02,11,6,5.76,3.08,8.07,4.41,11,6,8.24,4.46,13.25,6.53,25,12,.98.46,9.66,4.64,27,13,21.5,10.37,21.69,10.48,25,12,10.39,4.75,19.04,8.69,31,13,4.63,1.67,1,.24,22,7,4.34,1.4,7.45,2.41,12,3,4.25.55,7.68.46,14,0,9.05-.66,13.58-.99,20-2,15.73-2.47,25.9-5.22,44-9,20.59-4.31,20.93-3.57,41-8,15.76-3.48,14.51-3.71,26-6,11.03-2.2,21.99-4.72,33-7,0,0,8.54-1.77,15-5,.33-.16.93-.51,2-1,1.44-.66,2-.77,2-1,0-.48-2.6-.81-4-1-3.37-.47-6.66-1.39-10-2-4.96-.91-6.76-1.36-10-2-6.06-1.19-8.29-1.22-21-3-4.4-.62-5.26-1.65-7-1-3.64,1.35-3.83,5.66-7,10-1.87,2.56-5.29,4.34-12,8-5.53,3.01-9.78,5.33-16,7-3.79,1.02-6.86,1.34-13,2-3.9.42-8.09.74-15,1-12.29.46-18.92.71-28,0-4.48-.35-8.32-.9-16-2-8.19-1.17-14.72-2.11-23-4-10.42-2.38-16.27-4.38-18-5-4.29-1.54-7.2-3.03-13-6-5.5-2.81-7.06-3.98-8-6-1.53-3.27-.74-7.29,1-10,.99-1.54,2.87-3.55,11-6,6.66-2.01,11.99-2.65,15-3,9.03-1.05,13.54-1.57,20-2,7.56-.51,17.17-1.13,30-1,4.6.05,12.84.2,23,1,8.12.64,12.35,1.29,16,2,4.17.82,7.05,1.62,12,3,5.74,1.6,9.81,2.97,14,5,0,0,2.21,1.07,5,3,3,2.08,4.51,3.16,5,5,.63,2.38-.72,4.55-1,5-.52.85-1.58,2.17-6,4-2.74,1.13-5.87,2.09-11,3-3.29.58-5.8.87-7,1-11.34,1.26-17.01,1.88-19,2-4.21.25-4.27.06-18,0-14.91-.07-13.66.15-18,0-11.39-.4-20.09-1.94-26-3-12.74-2.29-10.46-3.07-25-6-2.47-.5-16-3.19-32-7-5.75-1.37-9.97-2.44-10-4-.03-1.57,4.24-2.72,15-6,5.34-1.63,10.65-3.39,16-5,11.35-3.41,14.94-4.33,15-6,.05-1.44-2.58-2.57-6-4-4.77-1.99-8.72-2.8-23-5-2.54-.39-4.44-.68-7-1-5.24-.66-7.86-.99-11-1-4.29-.01-7.52.55-10,1-2.85.51-3.04.74-14,4,0,0-4.5,1.34-12,4-3.68,1.31-6.11,2.24-6,3,.08.58,1.61.84,3,1,5.45.62,9.82-.23,14-1,9.61-1.77,10.78-1.76,15-3,3.39-.99,4.67-1.24,6-2,.94-.54,1.83-1.18,2-1,.27.28-.61,1.94-2,3-.81.62-1.58.86-2,1-3.01.98-5.98,2.07-9,3-2.14.66.04,0-3,1-2.64.86-3.54,1.11-4,2-.3.59-.44,1.54,0,2,.69.72,2.44-.1,5-1,2.58-.91-.27.3,7-2,4.75-1.5,7.11-2.28,9-3,3.46-1.31,8.6-3.48,13-4,.49-.06,1.94-.23,2,0,.04.18-.79.51-2,1-3.18,1.28-4.77,1.91-5,2-1.38.51-3.09,1.15-5,2-4.38,1.95-3.62,2.26-6,3-1.85.58-3.52.77-4,2-.03.08-.27.69,0,1,.48.56,2.14-.27,4-1,2.38-.93,1.48-.28,7-2,3.02-.94,2.74-.96,6-2,3.68-1.17,5.52-1.75,7-2,2.99-.5,3.76-.15,6-1,1.53-.58,2.73-1.33,3-1,.31.37-.85,1.81-1,2-1.88,2.33-4.3,3.32-6,4-3.51,1.4-5.8,2.2-8,3-4.65,1.7-4.79,1.93-8,3-2.27.75-4.25,1.41-7,2-2.96.64-5.56,1.18-9,1-1.13-.06-3.35-.24-6-1-4.16-1.19-4.65-2.43-10-5-4.42-2.13-9.2-3.73-10-4-2.23-.74-3.82-1.5-7-3-2.43-1.15-3.02-1.54-3-2,.04-1.03,3.13-1.34,9-3,.83-.24,3.55-1.16,9-3,2.08-.7,5.3-1.81,9-4,1.96-1.16,2.9-1.93,3-3,.17-1.79-2.09-3.37-3-4-1.6-1.11-3.03-1.5-5-2-4.91-1.26-7.36-1.89-8-2-4.19-.74-7.31-.85-12-1-4.02-.13-6.53-.21-10,0-1.39.08-3.6.26-14,2-6.14,1.03-9.21,1.54-11,2-.89.23-6.39,1.66-13,5-4.66,2.35-6.35,3.88-7,6-.17.55-.91,2.49,0,4,1.07,1.78,3.77,1.93,5,2,17.22.99,14.27,1.04,16,1,10.17-.26,9.37.49,17,0,7.71-.5,11.2-1.45,13-2,7.85-2.41,10.13-5.52,11-7,.51-.87,1.92-3.26,1-5-.96-1.82-3.95-1.97-7-2-8.29-.07-14.76.83-16,1-5.2.71-11.5,1.54-19,1-6.24-.45-10.44-.82-14-4-.6-.54-5.74-4.95-5-10,.75-5.09,7.02-7.75,17-12,1.57-.67,6.42-2.66,13-4,3.45-.7,6.22-1.24,10-1,4.76.31,8.19,1.67,9,2,2,.82,6.51,2.67,10,7,1.89,2.34,2.34,4.01,5,6,1.42,1.07,4.17,2.75,5,2,.89-.8-.74-4.1-2-6-1.35-2.03-2.77-3.2-5-5-2.68-2.17-3.87-2.7-7-5-4.37-3.22-5-3.35-5-4,0-1.38,2.39-2.33,13-6,6.42-2.22,9.68-3.34,12-4,5.58-1.58,9.09-2.58,14-3,4.3-.37,6.49-.7,9,0,1.87.52,4.24,2.01,9,5,2.26,1.42,3.51,2.28,6,4,0,0,1.44.99,6,5,1.05.92,2.27,2.02,2,3-.14.52-.65.81-1,1-1.43.79-3.1.28-4,0-4.2-1.32-7-3-7-3-3.51-2.11-5.98-4.13-7-5-2.55-2.16-4.26-3.61-6-6-1.84-2.52-3.82-5.24-4-9-.15-3.13,1.22-5.46,4-10,2.41-3.94,5.31-7.35,11-14,3.81-4.45,5.71-6.67,6-7,3.91-4.39,4.33-4.54,5-6,1.77-3.86-.06-5.26,2-10,.68-1.57,1.83-3.61,4-5,.82-.53,1.82-1.14,3-1,1.22.15,2.3,1.07,4,4,1.75,3.01,3.29,5.68,4,10,.74,4.52-.32,5.39,1,8,1.16,2.3,2.98,3.58,5,5,1.48,1.04,3.76,2.61,7,3,1.05.13,1.68.07,3,0h10c3.33,0,6.67-.02,10,0,5.82.04,7.87.15,12,0,7.28-.27,8.8-.9,10-2,2.26-2.07,2.89-5.37,3-6,.24-1.37.15-2.37,0-4-.18-1.92-.59-4.55-2-9-1.61-5.1-2.24-5.34-2-7,.38-2.63,2.27-4.4,4-6,2.79-2.59,5.69-3.57,7-4,2.47-.81,4.34-.89,7-1,3.51-.15,6.45-.27,7,1,.32.74-.45,1.27-2,4-1.14,2-2.64,4.7-3,8-.09.81-.1,1.55,0,3,.33,4.96,1.28,9.07,2,12,.82,3.35,1.59,6.45,3,11,2.13,6.85,3.19,10.28,5,13,2.76,4.15,6.05,6.7,8,8,.86.58,4.14,2.7,9,4,4.34,1.16,7.72,1.08,11,1,1.14-.03,6.4-.19,13-2,3.25-.89,5.5-1.93,10-4,1.95-.9,3.09-1.5,3-2-.05-.28-.5-.76-7-1-4.3-.16-6.45-.24-9,0-3.42.32-5.75.91-10,2-3.09.79-6.12,1.7-10,3-8.68,2.91-9.81,3.85-19,7-3.9,1.33-4.28,1.37-9,3-6.59,2.28-8.43,2.75-11,4-2.29,1.11-4.24,2.39-8,5-5.44,3.78-6.12,4.76-13,10-6.6,5.03-8.14,5.78-11,9-3.77,4.25-4.96,7.31-5,10-.04,2.7,1,5,1,5,.41.9.93,2.06,2,3,1.72,1.52,3.17.99,9,2,1.46.25,2.79.53,5,1,3.85.81,4.07.95,5,1,3.41.17,6.1-1.46,7-2,3.63-2.19,3.01-4.1,7-7,2.17-1.58,4.15-2.31,6-3,.69-.26,3.96-1.44,9-2,6-.66,7.14.38,9-1,2.31-1.72,2.66-4.92,3-8,.31-2.84.62-5.63-1-8-1.38-2.02-3.6-2.71-8-4-4.17-1.23-7.7-1.63-11-2-3-.33-5.98-.98-9-1-1.85-.01-3.49.1-5-1-1.39-1.01-2.57-2.97-2-4,.53-.96,2.39-.72,9,0,8.34.9,8.01.79,9,1,2.09.44,4.64,1.14,11,4,7.28,3.27,12.68,6.27,14,7,11.75,6.56,10.72,7.41,14,8,5.95,1.07,10.95-1.44,20-6,6.2-3.12,10.35-6.23,14-9,7.76-5.88,11.65-8.83,14-14,2.81-6.17,2.23-11.97,2-14-.61-5.43-2.65-9.05-6-15-2.11-3.74-4.41-6.83-9-13-3.76-5.05-5.64-7.58-8-10-3.44-3.53-6.28-5.59-11-9-6.76-4.89-10.15-7.34-15-9-5.42-1.86-9.93-2.01-12-2-4.25.03-8.82.05-13,3-3.4,2.39-7.49,7.37-6,11,1.17,2.86,5.29,3.67,7,4,3.58.7,6.46-.18,9-1,4.75-1.53,8.18-2.63,10-6,2.35-4.36,1.1-10.83-3-14-1.03-.8-2.35-1.21-5-2-5.54-1.66-10.2-1.86-14-2-3.95-.15-5.27-.09-6,0-3.18.41-5.32,1.35-7,2-1.9.73-5.27,1.49-12,3-2.65.6-5.05,1.08-16,3-10.35,1.81-15.58,2.72-18,3-6.35.72-10.93.84-17,1-11.13.29-16.77.4-21-1-7.64-2.54-12.4-7.28-14-9-5.65-6.07-7.32-12.49-9-19-2.02-7.8-3.95-15.27-1-24,.75-2.22,3.47-9.91,11-15,4.32-2.92,8.54-3.61,17-5,7.4-1.21,12.89-2.12,20-1,3.43.54,8.62,2.69,19,7,11.11,4.61,13.91,6.44,16,8,4.06,3.04,3.17,3.4,9,8,3.2,2.53,6.44,4.76,10,9,2.19,2.61,2.99,4.18,3,6,.01,3.11-2.29,5.32-3,6-.24.23-3.45,3.22-8,3-1.67-.08-4.02-.62-10-6-3.3-2.97-6.86-6.21-11-12-5.19-7.26-4.28-8.7-8-12-4.27-3.79-8.98-4.98-13-6-6.42-1.63-11.59-1.32-17-1-2.7.16-7.7.48-14,2-5.69,1.37-8.97,2.88-14,2-1.97-.34-5.18-.91-6-3-1.08-2.75,2.61-6.53,6-10,4.53-4.64,8.83-7.29,10-8,6.9-4.17,12.96-5.89,17-7,2.05-.56,10.04-2.69,21-3,7.21-.2,13.33-.38,21,2,5.82,1.8,10.19,4.35,13,6,2.88,1.7,6.8,4.04,11,8,2.35,2.22,7.38,7.05,11,15,4.19,9.18,4.1,17.26,4,22-.14,6.46-.26,12.16-4,18-3.41,5.32-8.06,8.01-10,9-.97.5-3.27,1.6-13,3-4.83.7-7.66.92-20,2-11.02.97-10.97.98-12,1-6.7.1-10.13-.63-17,0-.85.08-4.05-.62-7,1-1.63.89-1.92,1.74-2,2-.53,1.83,1.33,3.98,3,5,1.07.66,2.05.84,3,1,5.73.97,8,1,8,1,8.53.11,12.79.16,15,0,5.6-.42,9.67-1.18,14-2,4-.75,8.08-1.52,13-3,6.95-2.08,11.82-4.45,17-7,14.12-6.94,16.79-7.99,19-11,1.82-2.47,4.78-6.52,4-10-.12-.54-.48-1.72,0-3,.57-1.54,1.78-1.71,3-3,2.21-2.34,2.05-5.83,2-7-.11-2.42-1-4.26-2-6-4.25-7.36-10-12-10-12-7.19-5.8-14.24-7.74-19-9-6.73-1.78-10.53-1.47-13-1-4.41.84-6.51,2.58-7,3-.73.63-5.06,4.36-4,9,.76,3.31,3.75,4.87,4,5,4.21,2.12,10.01-.18,12-4,1.55-2.97.4-6.13-1-10-.77-2.14-2.78-7.48-8-12-1.63-1.41-6.5-5.28-18-7-6.94-1.04-14.96-.03-31,2-14.92,1.88-22.38,2.83-25,4-1.16.52-4.16,1.94-5,1-1.03-1.16,1.68-5.38,4-8,1.01-1.14,3.1-3.27,8-6,5.87-3.27,10.9-4.7,12-5,1.85-.51,5.94-1.54,20-2,8.59-.28,12.88-.43,19,0,7.45.52,12.51.87,19,3,5,1.64,10.13,3.32,15,8,4.82,4.63,6.76,9.67,8,13,1.15,3.08,5.87,15.76,0,25-1.74,2.74-3.5,3.73-4,4-4.19,2.22-10.33,1.19-14-2-1.99-1.73-5.3-5.88-7-8-.44-.55-1.45-1.83-3-2-.3-.03-1.34-.1-3,1-2.61,1.73-3.74,4.36-4,5-1.53,3.79-.38,8.24,2,17,1.28,4.71,2.25,7.29,4,10,2.23,3.45,4.06,4.54,5,5,2.11,1.04,4.09,1.06,6,1,7.81-.26,14-2,14-2,9.82-2.76,14.73-4.14,17-8,1.02-1.74,2.09-4.66,2-8-.02-.63-.1-2.28-1-5-2.23-6.78-5.36-7.73-5-10,.75-4.65,14.8-6.07,24-7,6.52-.66,9.84-.97,13,0,7.53,2.31,11.67,8.71,15,14,14.72,23.43,22.08,35.14,27,49,3.24,9.14,4.81,15.75,7,25,7.77,32.79,4.87,43.61,2,50-.99,2.21-1.87,4.77-4,7-1.05,1.1-3.72,3.58-14,6-2.31.54-5.08,1.1-20,3-7.67.98-6.41.76-8,1-14.18,2.12-17.05,4.61-22,3-4.08-1.33-6.33-4.38-9-8-4.54-6.16-3.27-8.88-8-23-4.4-13.12-5.66-11.25-10-21,0,0-.94-2.11-4-5-.55-.52-1.36-1.23-2-1-.66.24-.57,1.26-1,2-1.15,1.96-5.69,1.27-8,1-3.97-.46-8,.11-12,0-5.28-.15-6.48.27-17,1-10.6.74-15.84,1-20,1-4.64,0-6.96,0-7,0-1.15-.17-2.42-.46-4,0-.56.16-2.4.7-3,2-.85,1.82,1.3,3.94,3,7,2.14,3.85,2.5,7.26,3,12,.56,5.28.98,9.25-1,13-1.01,1.92-2.13,2.79-11,8-19.17,11.27-14.94,7.79-18,10-.6.43-4.03,2.92-9,4-1.39.3-3.56.77-4,0-.71-1.23,3.33-4.93,6-7,2.29-1.78,5.25-3.64,14-7,7.71-2.96,11.62-4.43,14-4,6.07,1.1,10.72,6.51,12,8,1.02,1.19,1.9,2.44,3,4,3,4.27,4.12,6.68,5,8,2.15,3.23,6.06,4.69,23,7,7.5,1.02,11.24,1.53,17,2,12.8,1.04,19.72,1.61,29,1,6.96-.46,16.52-1.09,28-5,8.55-2.92,18.22-7.67,25-11,1-.49,2.11-1.79,4-2,6.41-.72,12.62,9.46,16,15,2.21,3.62,3.49,6.39,6,12,5.71,12.79,7.11,16.52,10,23,8.06,18.09,10.28,18.31,12,27,1.35,6.8,2.73,13.75-1,20-2.09,3.51-6.73,6.34-16,12-7.63,4.66-8.69,4.33-9,4-.59-.63.44-2.53,4-8,5.67-8.71,8.5-13.06,10-14,5.35-3.35,10.75.13,25,4,6.33,1.72,15.55,3.15,34,6,11.92,1.84,17.89,2.41,29,5,12.11,2.82,16.29,4.76,20,8,6.48,5.65,8.69,12.78,10,17,2.82,9.1,1.83,16.08,0,29-1.88,13.22-4.38,15.77-6,17-5.3,4.01-12.46,2.39-14,2-5.87-1.5-9.22-5.49-13-10-3.15-3.76-7.31-8.71-9-16-1.35-5.84,1.39-7.29,6-27,1.97-8.43-.41.2,1-12,.18-1.59.5-4.09-1-6-1.03-1.32-2.51-1.84-3-2-2.24-.76-4.29-.19-5,0,0,0-1.94.52-15,3-3.92.74-7.28.5-14,0-5.21-.38-9.47-1.28-18-3-8.78-1.77-9.37-2.2-12-2-1.47.11-8.76.67-14,6-4.84,4.93-2.54,8.45-8,15-2,2.4-5.74,6.89-11,7-4.07.09-7.08-2.5-10-5-1.29-1.1-4.12-3.73-10-14-4.75-8.3-3.88-8.3-5-9-7.31-4.6-20.36,10.49-49,23-3.29,1.44-6.63,2.76-10,4-4.13,1.53-6.07,2.08-7,4-1.37,2.83.6,6.3,1,7,.95,1.67,2.66,3.64,8,6,3.58,1.58,8.49,3.21,16,4,7.05.74,10.57,1.11,14,0,4.41-1.43,7.61-4.62,14-11,6.49-6.47,6.93-8.28,10-9,3.72-.87,5.23,1.29,14,5,9.23,3.9,12.06,3.42,21,8,6.52,3.34,7.52,4.88,8,6,.49,1.14,1.83,5-5,16-3.19,5.14-9.07,13.29-20,22-5.82,4.63-9.71,7.68-16,10-10.02,3.7-17.37,2.33-19,2-3.33-.69-9.79-2.01-11-6-1.04-3.41,2.86-5.19,7-13,1.95-3.68,6.96-13.13,6-24-.34-3.87-1.24-5.61,0-8,1.94-3.75,6.9-4.76,13-6,2.49-.51,1.97-.21,15-1,6.33-.38,8.46-.57,10,1,2.58,2.62,1.1,7.69,1,8-1.12,3.66-4.36,7.25-14,11-6.9,2.69-19.22,7.49-36,5-10.78-1.6-17.73-5.36-30-12-8.28-4.48-13.55-8.41-18-14-2.17-2.72-8.87-11.16-6-16,1.17-1.98,3.49-2.6,5-3,32.19-8.46,9.65-4.63,37-10,10.5-2.06,11.3-2.13,14-3,1.34-.43,4.11-1.37,8-2,4.16-.68,6.27-.99,8,0,2.95,1.7,2.07,5.37,4,10,2.16,5.17,6.26,7.75,13,12,5.02,3.17,10.17,5.48,18,8,5.35,1.73,16.06,4.88,32,7,13.65,1.82,24.88,1.95,30,2,5.51.06,17.97,0,18,0,1.01-.28,2.29-.83,3-2,1.06-1.74.3-3.93,0-5-.37-1.31.08-5.22,1-13,1.15-9.7,1.72-14.55,2-15,3.03-4.86,8.59-4.79,27-9,10.22-2.34,2.32-.94,16-4,22.11-4.94,41.67-8.34,56-11,21.32-3.96,37.33-7.45,49-10,16.68-3.64,27.5-7.71,47-11,0,0,8.02-1.83,22-3,0,0,4.1-.34,10,0,6.15.36,9.5.55,10,2,.77,2.25-5.83,6.1-13,11-10.76,7.35-7.06,6.28-24,19-14.28,10.72-14.42,9.61-30,21-2.91,2.13-10.94,8.42-27,21-4.22,3.31-12.34,9.7-22,19-9.97,9.6-13.41,14.41-13,20,.36,5.03,3.69,8.6,5,10,5.45,5.84,12.87,7.05,21,8,18,2.09,32,2.01,33,2,16.39-.1,7.74.63,39,1,24.46.29,25.08-.21,48,0,24.25.22,36.64.37,50,2,6.98.85,20.41,2.75,37,7,13.83,3.54,23.66,6.06,36,12,13.68,6.59,23.1,13.84,31,20,9.44,7.35,9.34,8.52,27,24,14.79,12.97,22.18,19.45,27,22,14.75,7.81,33.19,11.76,39,13,2.07.44,3.8.78,5,1"/>
	            </g>
	        </svg>
	    </div>
	</section>
	
	<section class="filterSec">
	
		<a href="lessonWriting" class="lessonA"><i class="bi bi-pencil-square"></i></a>
	    <div>
	        <button class="labelLesson lessonList" onclick="selctLesson()" id="lessonBtn"><span id="lessonBtnTitle">LESSON</span><i class="bi bi-caret-down" id="bi"></i></button>
	        <ul class="listBox" id="lessonId">
				<li class="list">GUITAR</li>
	            <li class="list">BASS</li>
	            <li class="list">KEYBOARD</li>
	            <li class="list">VOCAL</li>
	            <li class="list">DRUM</li>
	            <li class="list">HORN</li>
	            <li class="list">작곡/편곡</li>
	            <li class="list">음향/미디어</li>
	        </ul>
	    </div>
	
		
	    <div>
			<button class="labelLocation locationListBtn" onclick="selectLocation()" id="locBtn"><span id="locBtnTitle">LOC</span><i class="bi bi-caret-down" id="bi2"></i></button>
			<ul class="listBox locationListBox" id="locId">
				<li class="list locationList">서울</li>
				<li class="list locationList">대전</li>
				<li class="list locationList">대구</li>
				<li class="list locationList">부산</li>
				<li class="list locationList">광주</li>
				<li class="list locationList">충청도</li>
				<li class="list locationList">경상북도</li>
				<li class="list locationList">경상남도</li>
				<li class="list locationList">전라북도</li>
				<li class="list locationList">전라남도</li>
				<li class="list locationList">제주도</li>
			</ul>
    	</div>
 		<c:if test="${!empty loginUser}">
		<div>
			<a href="lessonWriting" id="writingBtn">WRITING</a>
		</div>
		</c:if>

	</section>

	<hr>
	
	
	<section class="secondSec">

	    <c:choose>
			<c:when test="${!empty lessonList}">
				<c:forEach items="${lessonList}" var="lesson">
					
					<input type="hidden" value="${lesson.lessonNo}">
					<div class="imgCotentWrap" id="firstBox" onclick="location.href='${contextPath}/lessonDetail?lessonNo=${lesson.lessonNo}'">
						<div class="imgBox">
							<img src="" alt="">
						</div>
						<div class="contentBox">
							<p id="scrollOver">${lesson.motto}</p>
							<span>${lesson.writingDate}</span>
							<p>${lesson.region}</p>
							<p>by.&nbsp${lesson.userNick}</p>
						</div>
					</div>
				</c:forEach>
			</c:when>

			<c:otherwise>
				<div>
					<h1>NO DATA!</h1>
				</div>
			</c:otherwise>
		</c:choose>
	
	   
	    
	</section>

    
    
    

    
  	<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
	<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		const message = "${message}";
		if(message.trim() !== ""){
			alert(message);
		}

		const msg = "${msg}";
		if(msg.trim() !== ""){
			alert(msg);
		}

	</script>
    
    <script src = "${contextPath}/resources/js/lesson.js"></script>
</body>
</html>