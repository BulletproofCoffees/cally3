<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>cally admin</title>

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/lib/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
 
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-datepicker/css/datepicker.css" />
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-timepicker/compiled/timepicker.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/bootstrap-datetimepicker/css/datetimepicker.css" />
  
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zabuto_calendar.css">
 
 <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet">
  
  
  <!-- 수지 추가 -->
<link href="${pageContext.request.contextPath}/sj/sj_css.css" rel="stylesheet">  
  <!-- /수지 추가 -->
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  
  <style type="text/css">

.black-bg {
    background: #000;
  
}

ul.top-menu > li > a {
    color: #eeeeee;
   
}

</style>
</head>
<body>

<div class="login-page" style="margin-top:5%;">
<div class="container">
<div class="login-wrap">
<form class="form-login" action="/cally/admin/login" method="post">
<h2 class="form-login-heading">Cally ADMIN LOGIN</h2>
<div class="login-wrap">
<input class="form-control" type="text" name="adm_id" placeholder="ID" value="admin">
<br></br>
<input class="form-control" type="password" name="adm_pw"placeholder="PASSWORD" value="123">
<br></br>
<p style="color:red; text-align:center; font-size: 0.8em;">${message}</p>
<br></br>
<button class="btn btn-block btn-theme" type="submit">로그인</button>
</div>
</form>
</div>
</div>
</div>
</body>
</html>
    <!--footer start-->
  
  <%-- <script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script> --%>
  <script src="${pageContext.request.contextPath}/lib/jquery-ui-1.9.2.custom.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/fullcalendar/fullcalendar.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="${pageContext.request.contextPath}/lib/jquery.scrollTo.min.js"></script>
  <script src="${pageContext.request.contextPath}/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="${pageContext.request.contextPath}/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script src="${pageContext.request.contextPath}/lib/calendar-conf-events.js"></script>
  <script src="${pageContext.request.contextPath}/lib/zabuto_calendar.js"></script>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-daterangepicker/moment.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
  <script src="${pageContext.request.contextPath}/lib/advanced-form-components.js"></script>