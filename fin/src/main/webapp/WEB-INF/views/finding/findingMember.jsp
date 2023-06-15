<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/findingMember.css">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
    <script src="${contextPath}/resources/js/modal.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/3e3bbde124.js" crossorigin="anonymous"></script>
    
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
		
		a:hover {
	    color: revert;
		}
	</style>
    <title>SearchingMemberPage</title>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <section class="svgSec">
    	<div class="groupSvgBox">
	        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1276 1200">
	            <g id="searchBack">
	              <path class="groupPath" d="m0,351h81c15-.03,30.03.99,45,0,16.7-1.11,23.88-3.27,31,2,1.72,1.27,6.3,5.09,7,11,.86,7.21-4.47,14.03-10,17-5.8,3.12-8.53.22-12,3-4.57,3.67-2.01,10.45-2,30,0,14.14-1.34,14.18,0,20,.61,2.67,3.59,14.42,14,23,2.09,1.72,7.42,4.17,18,9,20.28,9.25,21.59,9.83,24,12,5.57,5.03,8.05,11.02,13,23,4.8,11.61,7.2,17.41,7,26-.15,6.47-.37,16.34-7,23-2.75,2.77-5.54,3.9-6,7-.39,2.66,1.03,6.1,7,11,16.55,13.58,35,14,35,14,22.71.51,41-7,41-7,2.18-.9,6.88-2.95,11-1,5.25,2.48,6.48,9.97,7,13,1.06,6.21,8.89,52.02,17,77,1.46,4.48,4.47,13.06,5,25,.08,1.83.3,8.32-1,17-2.32,15.43-6.16,15.81-11,34-3.21,12.07-3.46,19.18-10,26-2,2.08-4.4,4.52-8,5-7.18.96-11.5-6.84-16-5-3.19,1.3-4.27,6.53-4,10,.39,4.99,3.73,8.15,9,13,5.7,5.24,10.7,7.81,19,12,9.91,5,11.36,4.43,12,4,3.55-2.42,2.89-12.55-2-19-2.79-3.68-6.35-5.35-12-8-8.8-4.13-11.16-2.84-15-6-5.04-4.15-6.06-10.57-7-17-.53-3.66-1.39-11.99,2-27,4.06-17.95,8.73-21.26,8-33-.15-2.36-1.43-6.94-4-16-6.53-23.03-7.4-21.13-11-35-2.14-8.24-3.63-15.84-9-25-2.25-3.85-4.43-6.68-8-8-6.63-2.46-13.5,1.97-15,3-3.72,2.56-4.03,4.57-9,12-6.5,9.72-8.15,9.55-15,20-4.29,6.55-6.44,9.83-7,13-1.13,6.43,1.75,9.95,8,23,0,0,5.44,11.37,13,39,.72,2.63,1.81,6.83,0,11-1.6,3.69-4.43,4.98-10,9-6.9,4.98-10.35,7.48-13,11-1.69,2.24-3.46,8.5-7,21-.39,1.37-.8,2.91,0,4,1.93,2.62,9.59.76,15-2,6.35-3.25,5-5.4,14-12,5.45-4,8.38-4.99,10-9,1.1-2.73,1.05-5.48,1-8-.07-3.39-.14-7.2-2-8-1.61-.69-3.13,1.48-8,4-.7.36-4.87,2.52-8,3-6.25.96-11.97-4.2-15-7-6.69-6.19-8.5-11.5-16-27-6.78-14.02-6.69-12.54-13-26-6.52-13.91-9.79-20.97-10-26-.18-4.38.49-9.05,9-27,8.58-18.09,10.61-19.08,18-34,10.83-21.86,12.88-32.7,21-34,1.23-.2,1.33.03,12,3,17.14,4.77,19.57,4.95,21,5,6.17.23,10.52-1.21,19-4,10.22-3.37,15.33-5.05,19-9,6.49-6.98,5.84-17.04,5-30-1.06-16.32-5.44-25.3-3-39,.62-3.47,1.74-7.62,5-11,2.71-2.81,5.05-3.19,11-6,2.1-.99,6.06-3.33,14-8,9.73-5.73,14.6-8.6,16-10,6.44-6.44,7.87-14.58,9-21,.83-4.71.35-5.57-3-33-1.42-11.59-1.99-16.83-6-19-3.74-2.03-6.74.63-12-2-4.66-2.33-6.84-6.69-8-9-1.7-3.39-4.06-8.1-2-12,1.77-3.35,5.82-4.27,9-5,2.49-.57,7.33-1.67,12,1,.74.43,6.05,3.46,6,8-.05,4.84-6.14,8.03-8,9-4.6,2.41-6.52,1.15-9,3-3.59,2.68-2.81,7.75-3,18-.04,2.3-.38,16.52-4,31-2.13,8.52-3.79,10.71-5,12-4.59,4.91-11.25,5.95-18,7-5.59.87-5.36.06-16,1-12.02,1.06-14.68,2.3-16,3-3.11,1.65-5.45,3.81-10,8-5.31,4.89-6.49,7.01-9,7-3.22-.01-4.22-3.5-8-7-3.95-3.65-6.7-3.4-27-8-8.23-1.87-12.25-2.92-16-4-11.67-3.36-14.86-5.28-16-6-1.95-1.23-7.74-4.97-12-12-4.47-7.38-5.55-15.58-6-19-.91-6.93-.27-11.58-3-13-1.73-.9-4.39-.44-6,1-5.94,5.29,2.41,23.52,4,27,2.64,5.76,5.4,9.73,7,12,4.32,6.14,7.87,11.18,14,15,2.64,1.64,8.13,3.12,19,6,9.98,2.65,15,3.97,17,4,13.76.22,22.67-7.89,25-10,2.49-2.26,5.25-4.84,5-8-.1-1.25-.65-2.32-7-9-4.63-4.87-5.24-5.25-6-7-1.24-2.86-.48-3.88-2-8-1.17-3.17-2.04-5.52-4-6-2.26-.56-5,1.59-6,4-1.6,3.84,1.56,7.5,2,8,.59.69,2.05,2.37,3,2,1.49-.58,1.03-5.98,0-10-1.47-5.76-3.35-5.86-6-13-1.74-4.69-2.3-8.36-2-12,.22-2.67.43-5.22,2-6,2.19-1.08,4.88,2.35,12,7,4.99,3.26,9.22,5.97,15,7,1.54.28,4.7.18,11,0,9.65-.28,11.44-.92,13-2,.43-.29,4.45-3.16,5-8,.59-5.22-3.28-9.2-6-12-1.2-1.24-4.15-4.2-9-6-6.98-2.58-12.99-.93-20,1-5.66,1.56-10.36,2.85-11,6-.67,3.3,3.51,6.62,4,7,3.1,2.4,6.12,2.32,13,3,7.74.76,11.61,1.14,14,2,8.92,3.21,13.33,11.67,14,13,5.21,10.34,1.85,20.45,1,23-2.08,6.24-4.19,6.04-8,14-3.95,8.26-7.49,20.66-4,23,2.3,1.54,5.3-2.87,15-6,8.11-2.62,9.08-.53,19-3,3.27-.82,10.8-2.95,19-8,5.2-3.21,7.81-4.81,10-8,2.6-3.79,2.79-6.97,4-19,1.71-16.94,2.07-17.88,3-19,1.89-2.29,4.97-3.95,27-4,10.28-.02,17.88-.04,29,1,3.84.36,11.56,1.57,27,4,12.56,1.97,18.66,3.04,26,7,7.38,3.98,9.23,7.22,10,9,2.21,5.1,1.85,12.59-3,17-.58.53-5.48,4.84-11,3-5-1.67-7.43-7.37-7-12,.07-.74.76-7.12,6-9,3.08-1.1,7.21-.47,9,2,1.69,2.34.18,4.78-1,12-.59,3.63-.73,7.75-1,16-.2,6.17.07,6.18,0,14-.14,15.94-1.28,17.82,0,25,.39,2.2,1.42,7.15,4,13,1.47,3.32,3.64,8.13,8,13,5.24,5.85,6.72,4.05,9,8,3.08,5.34.74,9.23,4,19,1.33,3.98,1.42,4.65,2,5,3.45,2.12,8.57-6.27,24-17,3.68-2.56,6.03-3.93,7-7,1.62-5.11-1.5-12.07-6-14-.58-.25-2.06-.5-5-1-4.14-.7-4.54-.53-7-1-2.71-.51-5.71-1.08-9-3-1.07-.62-3.02-1.88-5-4-.87-.93-2.62-2.96-4-6-2.04-4.49-2.15-8.64-2-11,.14-2.23.38-6.15,3-10,2.04-3.01,4.54-4.51,7-6,2.84-1.72,5.23-2.48,10-4,3.54-1.13,5.36-1.7,8-2,4.06-.46,7.39-.84,9,1,1.02,1.16.39,2.12,0,10-.14,2.85-.18,5.22,0,8,.17,2.59.45,4.27,1,6,.8,2.52,1.36,4.27,3,5,1.65.73,3.74.17,5-1,2.45-2.28,1.9-7.01,0-8-1.35-.7-3.28.54-4,1-1.17.75-3.6,2.65-7,15-1.11,4.05-1.28,5.37-1,7,.61,3.61,2.92,5.94,4,7,1.85,1.82,4.46,4.39,8,4,2.07-.23,4.21-1.59,7-6,1.26-1.99,6.17-10.16,7-28,.05-1.09.34-8.05-1-17-1.18-7.87-2.66-10.86-5-13-1.01-.92-3.88-3.55-7-3-2.61.46-3.28,2.76-8,5-2.01.95-3.23,1.53-4,1-1.94-1.35,2.28-7.59,0-11-1.66-2.48-5.92-2.23-10-2-9.69.54-16.76,4.62-19,6-6.49,4-10.21,8.7-12,11-3.07,3.95-6.81,8.77-8,16-.89,5.45.07,9.79,1,14,1.27,5.75,2.08,9.4,5,13,2.48,3.05,7.35,7.15,13,10,1.68.85,3.77,1.75,5,4,1.12,2.04,1.47,5.08,0,7-.97,1.26-2.38,1.61-4,2-7.68,1.86-11.54,2.8-12,3-3.36,1.44-2.46,2.43-9,7-4.01,2.81-6.06,4.2-8,4-2.59-.27-4.12-2.77-8-10-5.37-9.99-8.05-14.99-9-18-2.56-8.11-2.88-14.89-3-18-.11-2.79-.04-5.33,0-7,.09-3.51.2-7.68,1-13,.82-5.5,1.97-9.47,3-13,.92-3.16,2.01-6.37,4-10,1.29-2.35,2.89-5.27,4-5,1.28.31,1.41,4.8,1,8-.36,2.86-1.02,3.7-2,7-.84,2.82-1.22,5.88-2,12-.64,5.04-.96,7.55-1,10-.08,4.7.44,8.24,1,12,.19,1.27.78,5.08,2,10,.53,2.14,1.49,5.73,3,10,2.68,7.62,4.44,9.86,7,16,2.7,6.46,4.19,10.32,5,16,.57,4.03,1.21,8.48,0,14-.91,4.14-2.09,5.44-3,11-.64,3.91-.99,6.23,0,9,1.52,4.28,5.07,6.45,6,7,3.02,1.79,5.58,1.78,11,2,5.67.23,11.33.76,17,1,9.32.39,13.99.58,16,1,12.19,2.53,20.22,11.01,24,15,2.72,2.87,1,1.62,13,20,4.36,6.68,9.07,13.7,13,24,2.33,6.1,2.56,8.58,2,11-.55,2.36-2.2,6.08-14,13-10.83,6.35-14.52,6.19-27,13-8.32,4.54-7.11,4.85-12,7-10.67,4.7-20.09,4.86-28,5-12.33.21-21.21-1.95-25-3-7.59-2.1-11.38-3.15-14-6-1.34-1.46-4.46-5.48-2-31,.86-8.87,2.24-15.91,5-30,1.77-9.05,2.97-14,7-19,1.44-1.78,4.71-5.42,10-8,2.63-1.28,5.63-2.25,16-3,11.76-.86,17.64-1.28,24,0,4.56.92,10.2,2.06,16,6,1.61,1.1,5.47,3.93,15,20,7.06,11.91,10.6,17.99,11,24,.35,5.24-1.1,9.82-4,19-5.57,17.62-10.24,21.78-8,25,2.69,3.87,13.5,1.3,35-4,15.83-3.9,26-7,26-7,9.51-2.9,14.91-4.92,24-6,11.46-1.36,16.19.28,18,1,1.42.56,8.46,3.49,13,11,.37.62,5.26,8.83,3,11-2.41,2.31-9.56-5.43-21-7-6.15-.84-10.75.48-23,5-24.94,9.2-25.61,10.99-38,15-16.76,5.43-13.34,1.44-37,8-10.47,2.9-15.95,5.01-21,2-7.27-4.33-5.99-14.68-12-16-4.02-.88-9.14,2.74-11,7-2.51,5.75,2.15,9.83,5,21,1.73,6.78,1.49,13.85,1,28-.29,8.5-.95,14.56-2,24-2.63,23.73-4.13,22.9-4,33,.14,10.78,1.87,13.72,0,22-2.1,9.31-6.4,15.03-8,17-3.42,4.21-12.51,13.58-18,11-4.26-2-4.57-10.35-4-15,.79-6.46,3.78-9.97,6-14,3.06-5.55,3.69-10.32,3-39-.37-15.29-.56-22.93-1-30-.81-12.84-2.22-26.07-5-52-2.1-19.53-3.56-33.17-4-52-.33-14.44.14-23.12,4-33,1.6-4.1,5.82-14.54,16-23,4.12-3.42,4.5-2.6,11-7,6.59-4.46,18.3-12.38,26-26,3.62-6.39,5.01-12.23,7-20,2.99-11.66,1.79-14.15,5-22,1.56-3.82,4.78-11.47,12-18,6.33-5.73,9.78-5.21,17-12,2.4-2.25,6.14-5.77,9-11,7.21-13.16.47-21.88,8-35,1.55-2.7,3.72-6.38,8-9,3.98-2.44,5.76-1.48,9-4,5.51-4.29,5.97-11.41,6-12,.08-1.72.43-8.78-4-11-3.99-2-9.73.98-12,5-2.39,4.24-.55,8.99,1,13,3.16,8.16,10.23,8.04,13,16,.56,1.61.71,3.43,1,7,.47,5.95,1.12,14.83-1,26-1.36,7.13-2.41,12.66-6,19-3.71,6.54-8.81,10.69-19,19-6.31,5.14-11.71,9.54-20,14-7.93,4.27-13.26,5.77-13,7,.37,1.73,11.33.86,20,0,24.89-2.46,43.94-6.06,49-7,18.41-3.43,31.35-5.3,50-8,5.02-.73,25.52-3.62,52-4,18.11-.26,22.78.89,27,4,3.86,2.85,7.96,13.27,16,34,5.86,15.1,8.79,22.66,9,24,.8,5.05.95,10.26,5,14,2.84,2.63,6.29,3.31,10,4,6.42,1.19,10.89.56,17,0,8.95-.81,15.1-.88,26-1,10.43-.11,13.87.33,17,1,8.25,1.76,12.46,4.66,15,7,2.1,1.94,5.44,5.02,5,9-.03.26-.47,3.73-3,5-3.23,1.62-5.93-2.29-13-4-7.61-1.84-14.13.37-16,1-4.44,1.5-7.25,3.71-9,5-7.47,5.49-15.65,8.33-32,14-10.31,3.57-17.09,5.93-27,7-10.05,1.09-16.29,1.67-22-2-8.23-5.29-10-15.99-11-22-2.33-14.05,2.94-18.27,0-34-.73-3.89-2.71-14.52-7-15-3.16-.35-6.58,4.92-8,9-1.13,3.26-1.36,6.82,1,17,2.65,11.44,4.38,13.19,6,22,1.61,8.77,2.42,13.15,0,17-3.94,6.27-13.23,6.75-18,7-3.72.19-12.82.67-20-5-6.7-5.29-8.01-13.01-10-26-2.32-15.14-1.4-28.3,0-38,1.97-13.68,5.79-26.86,7-31,4.85-16.55,8.59-23.15,5-30-3.46-6.61-9.52-5.37-12-12-2.08-5.55.59-11.44,6-23,2.53-5.4,2-3.33,11-20,11.74-21.77,7.55-15.86,9-18,1.07-1.58,2.67-3.78,3-7,.47-4.52-1.84-8.15-3-10-8.83-14.13-1.01-5.85-15-27-5.47-8.27-4.48-6.23-11-16-6.05-9.07-8.13-12.65-14-21-8.63-12.26-6.66-8.08-9-12-2.06-3.45-3.16-5.97-5-6-2.63-.05-2.78,5.04-7,7-4.83,2.25-9.12-2.33-12,0-2.32,1.88-2.2,7.03,0,10,.87,1.17,2.08,2.02,9,4,8.51,2.43,8.88,1.77,11,3,1.94,1.13,3.85,2.98,8,13,3.78,9.11,5.8,16.32,6,17,2.04,6.83,4.69,15.72,8,25,5.88,16.47,6.44,13.44,10,25,1.91,6.2,2.1,8.22,4,9,7.14,2.95,19.58-19.28,29-16,3.22,1.12,4.2,4.57,10,6,1.7.42,4.3,1.06,7,0,3.47-1.37,5.06-4.75,7-9,2.84-6.24,1.35-7.25,4-11,0,0,.7-.99,7-7,1.06-.17,4.58-.88,7-4,.5-.64,2.85-3.66,2-7-.15-.59-.55-2.18-2-3-1.7-.96-3.59-.17-4,0-1.69.71-2.49,2.11-3,3-.68,1.2-.87,2.26-1,3-.17.99-.31,1.83,0,2,.51.28,2.36-1.15,3-3,.79-2.28-.81-3.62-2-8-.87-3.18-.94-5.84-1-8-.14-4.94.79-5.55,0-8-.1-.31-1.37-4.09-5-6-2.77-1.46-5.55-.99-11,0-4.5.82-7.4,1.2-11,3-1.77.89-5.01,2.54-8,6-1.33,1.53-4.28,4.94-5,10-.25,1.77.16,4.2,1,9,1,5.72,1.53,8.65,3,12,1.45,3.31,2.49,5.59,5,7,2.43,1.36,4.93,1.17,7,1,1.32-.11,4.19-.48,9-3,6.26-3.29,5.37-4.75,9-6,4.24-1.46,5.09.65,14,0,5.62-.41,7.92-1.45,9-2,2.66-1.37,4.25-3.08,6-5,.83-.91,3.84-4.31,7-11,2.95-6.26,4.43-9.39,4-13-.51-4.3-3.02-7.48-5-10-2.74-3.48-3.48-2.77-7-7-2.62-3.14-2.76-4.19-6-8-2.26-2.66-3.39-3.99-5-5-3.24-2.04-6.52-2.01-10-2-18.7.04-16.8-.61-22,0-3.39.4-8.53,1.01-15,3-3.89,1.2-6.65,2.05-10,4-3.16,1.84-8.84,5.15-12,12-2.48,5.38-2.19,10.32-2,13,.29,4.08,1.41,7.32,4,13,5.84,12.8,10.23,22.4,19,29,1.43,1.08,4.46,3.32,9,5,.73.27,4.06,1.48,9,2,3.27.35,10.77,1.06,19-2,6.18-2.3,6.47-4.39,13-6,3.5-.87,6.77-1.62,10,0,3.69,1.86,5.15,5.72,6,8,.81,2.15,2.08,5.53,1,9-1,3.22-3.28,4.09-10,9-5.85,4.27-9.02,6.58-12,10-1.67,1.92-4.95,6.1-7,12-1.71,4.94-1.2,7.15-2,21-.52,9-.81,13.53-2,15-4.14,5.11-12.97,4-29,2-2.23-.28-11.3-1.48-22-6-7.44-3.15-9.14-5.14-10-7-1.94-4.2-.03-8.75,3-16,1.93-4.61,2.36-4.24,9-16,4.4-7.8,5.14-9.61,8-12,1.5-1.26,5.43-4.45,11-5,5.35-.52,6.49,1.95,12,2,5.47.05,9.57-2.35,14-5,7.28-4.36,11.59-9.34,14-12,6.77-7.47,14.85-13.65,31-26,10.82-8.28,7.3-4.55,23-16,4.92-3.59,21.09-15.5,29-14,4.58.87,7,3,7,3,1.21,1.06,1.39,1.7,3,3,2.45,1.97,3.44,1.63,5,3,2.17,1.91,2.62,4.67,3,7,.41,2.53,1.03,6.31-1,8-1.53,1.28-3.83.76-7,0-6.2-1.48-7.39-3.82-11-4-2.37-.12-4.19.78-9,4-9.81,6.58-16,12-16,12-8.24,7.22-7.32,7.41-14,13-7.16,5.99-10.47,7.66-10,9,.7,2.01,9.03.65,21-1,20.9-2.87,12.75-1.19,33-4,18.01-2.5,30.02-4.5,33-5,19.46-3.27,12.95-2.47,17-3,10.74-1.39,15.51-1.07,19-5,1.51-1.7,2.34-4.14,4-9,1.33-3.89,2.53-7.55,1-9-1.33-1.25-3.43.36-5-1-1.3-1.12-.63-2.87-1-7-.27-3.02-.51-5.57-2-8-.62-1.01-2.88-4.3-7-5-.7-.12-3.36-.53-6,1-2.51,1.45-3.48,3.77-4,5-.25.6-.7,1.8-1,6-.2,2.88-.42,5.9,0,10,.35,3.46.74,3.66,1,7,.26,3.4.07,5.93,0,7-.07,1.12-.05,8.08,0,22,.07,20.36.17,30.71,3,39,.24.71,2.53,7.22,8,14,3.32,4.11,5.74,7.03,9,7,4.89-.05,8.3-6.69,10-10,3.44-6.69,3.09-12.81,3-14-.22-3.1-1.15-5.73-3-11-2.08-5.91-2.61-5.65-4-10-1.73-5.39-2.62-11.12-3-14-.6-4.6-.62-7.5-3-10-.15-.16-2.58-2.67-4-2-1.59.75-.74,4.98,0,11,1.92,15.55.46,21.08,5,28,1.36,2.08,2.57,3.22,4,4,3.78,2.06,7.69.75,12,0t17,0c6.67,0,13.33.08,20,0,19.74-.24,21.21-1.19,25,1,2.63,1.52,6.24,4.48,13,8,1.15.6,3.17,1.62,6,2,1.9.25,5.11.69,8-1,5.27-3.08,5.02-10.65,5-11-.05-.94-.21-6.52-4-9-2.12-1.39-3.79-.77-8-1-5.26-.29-9.06-1.62-13-3-6.13-2.14-9.97-3.48-13-7-1.73-2.01-1.72-3-5-18-2.06-9.41-2.74-12.1-1-15,2.09-3.47,6.15-4.73,7-5,4.1-1.28,5.07.58,10,0,6.31-.75,7.22-4.1,13-4,1.26.02,4.33.08,7,2,1.83,1.32,3.07,3.23,5,11,.8,3.22,2.24,9.54,3,20,.49,6.72.21,8.49-1,10-2.15,2.67-5.82,2.75-10,3-20.15,1.23-21.62,4.84-27,2-5.73-3.03-2.57-9.73-10-16-1.05-.88-3.64-2.91-7-5-4.14-2.57-5.38-2.73-7-4-3.62-2.85-4.13-7.39-5-14-.88-6.67-1.63-12.34,1-19,.95-2.4,2.92-7.41,8-11,4.29-3.03,8.55-3.46,14-4,6.82-.68,12.24.34,15,1,2.57.62,8.02,2.16,14,6,3.32,2.13,7.61,4.89,11,10,2.51,3.78,3.37,7.57,5,15,2.09,9.53,2.88,18.58,3,20,.4,4.7,1.75,9.29,2,14,.11,2.06.1,3.53,1,4,2.22,1.17,7.82-4.78,11-9,4.24-5.64,3.68-7.55,8-13,3.65-4.6,5.58-7.03,9-8,4.83-1.36,10.04.93,17,4,5.32,2.35,6.15,3.5,8,3,2.12-.58,4.66-3.1,7-17,1.78-10.57,1.96-18.92,2-23,.06-6.14-.17-4.61-2-33,0,0-.56-8.74-5-20-.81-2.06-2.16-5.14-5-6-1.58-.48-3.85-.33-5,1-.66.77-.76,1.71,0,8,.51,4.2.75,5.44,0,7-.24.49-1.14,2.19-3,3-3.11,1.36-5.59-1.2-7,0-1.88,1.6.81,7.59,1,8,1.41,3.07,2.58,3.42,4,6,1.58,2.88,1.75,5.41,2,10,.2,3.69.46,8.32-1,14-1.8,7.01-4.19,7.79-6,16-1.13,5.15-.74,7.34,0,9,1.37,3.07,4.15,4.83,6,6,3.11,1.96,4.31,1.69,7,3,5.49,2.68,10.72,8.84,10,14-.3,2.14-1.5,3.25-4,6-8.68,9.57-6.46,9.82-15,19-6.03,6.48-6.27,5.43-11,11-3.65,4.3-6.91,8.21-9,14-1.69,4.68-1.85,8.44-2,13-.41,12.4,2.9,14.46,3,28,.04,5.82-.55,7.32,0,13,.31,3.23.83,8.15,3,14,2.24,6.02,5.4,10.77,7,13,2.88,4.01,4.52,5.19,6,9,1.06,2.72,2.35,6.05,1,9-.86,1.88-2.45,2.85-10,6-5.08,2.12-7.62,3.18-10,4-6.92,2.38-12.8,4.41-21,6-7.05,1.37-11.15,2.17-17,2-4.3-.12-5.43-.65-17-2-11.11-1.3-12.65-1.11-14,0-2.69,2.21-1.51,5.5-2,17-.35,8.12-.93,6.4-2,21-.68,9.27-1,16-1,16-.22,4.67-.78,9.33-1,14-.27,5.68-.27,9.39-3,12-.55.53-1.99,1.9-4,2-3.08.15-4.85-2.82-9-7-.6-.6.37.4-11-9-6.21-5.13-7.4-6.18-10-8-3.76-2.64-5.12-4.5-8-5-2.97-.51-5.45.4-7,1-3.42,1.31-5.56,3.35-9,7-8.13,8.61-6.68,8.31-9,10-3.77,2.76-8.85,3.51-19,5-9.41,1.38-10.5.6-11,0-2.53-3.02,1.74-11.14,6-16,2.42-2.76,5.98-4.88,13-9,14.05-8.25,16.62-7.93,18-7,1.57,1.06,2.18,3.33,2,5-.38,3.41-4.1,4.48-6,7-4.28,5.68,1.9,17.11,4,21,3.29,6.09,6.94,10.57,27,29,10.05,9.23,14.33,12.88,20,17,10.84,7.88,16.37,9.96,21,11,5.15,1.16,12.33,2.78,18-1,2.05-1.37,4.52-3.86,8-17,2.21-8.32,3.54-16.1,5-28,.78-6.39,1.47-12.96,3-24,1.24-8.94,2.12-14.34,6-20,4.42-6.45,8.96-7.73,10-8,.96-.24,5.56-1.41,9,1,1.68,1.18,1.59,2.15,4,6,2.49,3.96,3.4,4.23,6,8,2.22,3.22,2.27,4.06,5,9,1.65,2.98,5.1,9.21,10,16,3.84,5.32,5.67,6.97,5,9-.97,2.92-6.15,3.72-8,4-4.61.71-8.23-.27-11-1-13.01-3.41-19.61-5.09-24-4-1.61.4-7.25,1.8-10,7-1.96,3.7-1.99,8.45,0,12,2.27,4.04,6.53,5.42,12,7,14.31,4.15,24.42,6.11,33,8,6.7,1.47,12.8,2.97,22,4,6.97.78,10.85.74,15-1,4.79-2.01,7.67-5.32,10-8,2.98-3.42,6.35-7.31,7-13,.38-3.36-.41-5.91-2-11-1.51-4.83-2.68-6.73-6-14-4.32-9.46-3.81-9.46-7-16-2.86-5.86-3.51-6.34-7-13-4.28-8.17-3.84-8.46-9-19-8.51-17.39-5.81-8.62-12-21-1.55-3.1-3.29-6.79-7-8-2.34-.76-4.65-.27-8,1-8.53,3.22-10.78,6.5-16,9-4.57,2.19-10.05,2.13-21,2-8.64-.1-14.01-.16-21-2-7.11-1.87-19.02-5.01-23-14-1.69-3.81-.54-5.5,0-15,.51-8.96-.33-16.97-2-33-.15-1.41-1.21-11.3-4-24-2.02-9.21-3.07-11.29-5-13-2.96-2.61-4.56-1.33-20-5-8.58-2.04-5.76-1.89-11-3-3.63-.77-5.84-1.03-6-2-.22-1.32,3.46-3.16,6-4,6.32-2.1,11.47,0,21,3,0,0,10.67,3.36,28,7,5.15,1.08,9.05,1.76,14,1,2.92-.45,7.33-1.13,12-4,3.89-2.39,5.09-4.53,7-4,1.72.48,2.02,2.57,5,8,1.58,2.88,2.37,4.32,3,5,3.37,3.61,9.24,3.17,13,3,7.67-.34,15.34,1.49,23,1,17.96-1.15,36,.12,54,0,19-.13,38,0,57,0h139"/>
	            </g>
	        </svg>
    	</div>
    </section>

    
    <section class="checkBoxSection">
		<p id="tt">CHECK!</p>
		<form action="checkSelect" method="post">
			<div class="checkWrapper">

				<p id="genderP">*GENDER*</p>
				<div class="genderBox">
					<table class="genderTable">
						<tr>
							<td>
								<input type="radio" id="MAN" name="gender" value="M">
								<label for="MAN">MAN</label>
							</td>
							<td>
								<input type="radio" id="WOMAN" name="gender" value="W">
								<label for="WOMAN">WOMAN</label>
							</td>
						</tr>
					</table>
				</div>

				<p id="positionP">POSITION</p>
				<div class="checkPosition">
					<table class="positionTable">
						<tr>
							<td>
								<input type="radio" id="GUITAR" name="inst" value="기타">
								<label for="GUITAR">GUITAR</label>
							</td>
							<td>
								<input type="radio" id="BASS" name="inst" value="배스">
								<label for="BASS">BASS</label>
							</td>
							<td>
								<input type="radio" id="DRUM" name="inst" value="드럼">
								<label for="DRUM">DRUM</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="VOCAL" name="inst" value="보컬">
								<label for="VOCAL">VOCAL</label>
							</td>

							<td>
								<input type="radio" id="KEYBOARD" name="inst" value="키보드">
								<label for="KEYBOARD">KEYBOARD</label>
							</td>

							<td>
								<input type="radio" id="HORN" name="inst" value="혼">
								<label for="HORN">HORN</label>
							</td>
						</tr>
					</table>
				</div>

				<p id="genreP">GENRE</p>
				<div class="checkGenre">
					
					<table class="genreTable">
						<tr>
							<td>
								<input type="radio" id="ELECTRONIC" name="genre" value="일렉트로닉">
								<label for="ELECTRONIC">ELECTRONIC</label>
							</td>

							<td>
								<input type="radio" id="ROCK" name="genre" value="락">
								<label for="ROCK">ROCK</label>
							</td>

							<td>
								<input type="radio" id="FOLK" name="genre" value="포크">
								<label for="FOLK">FOLK</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="POP" name="genre" value="팝">
								<label for="POP">POP</label>
							</td>

							<td>
								<input type="radio" id="R&B" name="genre" value="알앤비">
								<label for="R&B">R&B</label>
							</td>

							<td>
								<input type="radio" id="JAZZ" name="genre" value="재즈">
								<label for="JAZZ">JAZZ</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="METAL" name="genre" value="메탈">
								<label for="METAL">METAL</label>
							</td>
						</tr>
					</table>
					
				</div>

				<p id="locationP">REGION</p>
				<div class="checkLoc">
					<table class="locationTable">
						<tr>
							<td>
								<input type="radio" id="seoul" name="region" value="서울">
								<label for="seoul">서울</label>
							</td>
							<td>
								<input type="radio" id="gyeonggi" name="region" value="경기도">
								<label for="gyeonggi">경기도</label>
							</td>
							<td>
								<input type="radio" id="incheon" name="region" value="인천">
								<label for="incheon">인천</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="daejeon" name="region" value="대전">
								<label for="daejeon">대전</label>
							</td>

							<td>
								<input type="radio" id="daegu" name="region" value="대구">
								<label for="daegu">대구</label>
							</td>
							<td>
								<input type="radio" id="busan" name="region" value="부산">
								<label for="busan">부산</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="radio" id="ulsan" name="region" value="울산">
								<label for="ulsan">울산</label>
							</td>
							<td>
								<input type="radio" id="sejong" name="region" value="세종">
								<label for="sejong">세종</label>
							</td>
							<td>
								<input type="radio" id="gwangju" name="region" value="광주">
								<label for="gwangju">광주</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="gangwon" name="region" value="강원도">
								<label for="gangwon">강원도</label>
							</td>
							<td>
								<input type="radio" id="N-chungcheong" name="region" value="충북">
								<label for="N-chungcheong">충북</label>
							</td>
							<td>
								<input type="radio" id="S-chungcheong" name="region" value="충남">
								<label for="S-chungcheong">충남</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="N-gyeongsang" name="region" value="경북">
								<label for="N-gyeongsang">경북</label>
							</td>

							<td>
								<input type="radio" id="S-gyeongsang" name="region" value="경남">
								<label for="S-gyeongsang">경남</label>
							</td>
							<td>
								<input type="radio" id="N-jeolla" name="region" value="전북">
								<label for="N-jeolla">전북</label>
							</td>
						</tr>

						<tr>
							<td>
								<input type="radio" id="S-jeolla" name="region" value="전남">
								<label for="S-jeolla">전남</label>
							</td>
							<td>
								<input type="radio" id="jeju" name="region" value="제주도">
								<label for="jeju">제주도</label>
							</td>
						</tr>
					</table>
				</div>

				<div class="searchBtnBox">
					<button type="submit">SUBMIT</button>
				</div>
			</div>
		</form>

	</section>
	
	<jsp:include page="/WEB-INF/views/faq/faq.jsp"/>
	<jsp:include page="/WEB-INF/views/chatting/chatRoomList.jsp"/>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="${contextPath}/resources/js/findingMember.js"></script>    
</body>
</html>