<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">

		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Exam++</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/exam.css" rel="stylesheet" type="text/css">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<style type="text/css">
			.question-body {
				padding: 30px 30px 20px 30px;
				background: #FFF;
			}
			
			ul#exampaper-body{
				margin-bottom: 0px;
			}
			
			ul#exampaper-body li{
				padding-bottom:0px;
			}
			.question-body{
				min-height:300px;
			}
			
		</style>
	</head>
	<body>
		<header>
			<div class="container">
				<div class="row">
					<div class="col-xs-5">
						<div class="logo">
							<h1><a href="#"><img alt="" src="resources/images/logo.png"></a></h1>
						</div>
					</div>
					<div class="col-xs-7" id="login-info">
						<c:choose>
							<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
								<div id="login-info-user">

									<a href="user-detail/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}" id="system-info-account" target="_blank">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
									<span>|</span>
									<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> ??????</a>
								</div>
							</c:when>
							<c:otherwise>
								<a class="btn btn-primary" href="user-register">????????????</a>
								<a class="btn btn-success" href="user-login-page">??????</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</header>
		<!-- Navigation bar starts -->

		<div class="navbar bs-docs-nav" role="banner">
			<div class="container">
				<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
					<ul class="nav navbar-nav">
						<li>
							<a href="home"><i class="fa fa-home"></i>??????</a>
						</li>
						<li class="active">
							<a href="start-exam"><i class="fa fa-edit"></i>????????????</a>
						</li>
						<li>
							<a href="student/usercenter"><i class="fa fa-dashboard"></i>????????????</a>
						</li>
						<li>
							<a href="student/setting"><i class="fa fa-cogs"></i>????????????</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Navigation bar ends -->

		<div class="content" style="margin-bottom: 100px;">

			<div class="container">
				<div class="row">
					<div class="col-xs-3" style="padding-right: 0px;padding-bottom:15px;">
						<div class="def-bk" id="bk-exam-control">

							<div class="def-bk-content" id="exam-control">

								<div>

									<span style="color:#428bca;">???????????????</span>
									<div>
										<span>${fieldName }</span>
									</div>
									<span style="color:#428bca;">????????????</span>
									<div>
										<span id="practice-type" class="pt-singlechoice">${questionTypeName }[ ??? <span class="pt-tno">${amount }</span> ??? ]<span class="pt-qcode" style="display:none;">qt-singlechoice</span></span>
									</div>
									<!-- <span style="color:#428bca;">???????????????</span>
									<div class="h-progress" style="margin-top:5px;" title="50%">
										<span></span>
									</div> -->
									<span id="exam-timestamp" style="display:none;">0</span>
									<div id="answer-save-info"></div>

								</div>
								<div id="question-submit">
									<button class="btn-success btn" style="width:100%;" id="switch-model-btn" data-exam="true"> 
										????????????
									</button>
								</div>
								<div id="exam-info" style="display:none;">
									<span id="answer-hashcode"></span>
								</div>
							</div>

						</div>

					</div>
					<div class="col-xs-9" style="padding-right: 0px;">
						<div class="def-bk" id="bk-exampaper">
							<div class="expand-bk-content" id="bk-conent-exampaper">
								<div id="exampaper-header">
									<div id="exampaper-title"  style="margin-bottom:15px;">
										<i class="fa fa-paper-plane"></i>
										<span id="exampaper-title-name"> ${fieldName } - ${practiceName } </span>

									</div>
									<!-- <div id="exampaper-desc-container">
									<div id="exampaper-desc" class="exampaper-filter">

									</div>
									</div> -->

								</div>
								<ul id="exampaper-body">
									${questionStr }

								</ul>
								<div id="exampaper-footer">
										
									
									<div id="question-switch">
										<button class="btn-success btn" id="previous-q-btn" style="width:160px;">
												<i class="fa fa-chevron-circle-left"></i>?????????

										</button>
										<button class="btn-success btn" id="next-q-btn" style="margin-left:60px;width:160px;">
												????????? <i class="fa fa-chevron-circle-right"></i>
										</button>
										<button class="btn-warning btn" id="submit-q-btn" style="width:160px;float:right;">
												<i class="fa fa-check-circle-o"></i>????????????

										</button>
									</div>
									<div id="question-navi">
										<div id="question-navi-controller">
											<i class="fa fa-arrow-circle-down"></i>
											<span>?????????</span>
										</div>
										<div id="question-navi-content" ></div>
									</div>

								</div>
							</div>
							<div class="expand-bk-content" id="bk-conent-comment" style="margin-top:40px;display:none;">
								<div id="comment-title" style="margin-bottom:15px;">
									<i class="fa fa-comments"></i>
									<span> ???????????? </span>

								</div>
								<ul class="comment-list">
									
									<li class="comment-list-item">
										<div class="comment-user-container">
											<div >
												<img src="resources/images/photo.jpg" class="comment-user-img">
											</div>
											<div class="comment-user-info">
												<div>
													yanhuan [????????????]
												</div>
												<div class="comment-date">
													????????? 1??????
												</div>
											</div>
										</div>
										<p class="comment-user-text">
											?????????B????????????
										</p>
										
									</li>
									<li class="comment-list-item">
										<div class="comment-user-container">
											<div >
												<img src="resources/images/photo.jpg" class="comment-user-img">
											</div>
											<div class="comment-user-info">
												<div>
													yanhuan [????????????]
												</div>
												<div class="comment-date">
													????????? 1??????
												</div>
											</div>
										</div>
										<p class="comment-user-text">
											?????????B????????????
										</p>
										
									</li>
								</ul>
								<div>
									<input type="hidden" id="idx_hidden" value="1">
									<button id="show_more_btn">????????????</button>
								</div>
								<form class="comment-form">
									<textarea rows="" cols="" style="width:100%;height:95px;"></textarea>
									<input class="btn btn-primary" type="submit" value="????????????">
								</form>
								
							</div>

						</div>
						
						
					</div>
				</div>
			</div>

		</div>
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="copy">
							<p>
								Exam++ Copyright ?? <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="." target="_blank">??????</a> | <a href="http://www.examxx.net/" target="_blank">????????????</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">????????????</a>
							</p>
						</div>
					</div>
				</div>

			</div>

		</footer>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js?v=0712"></script>
		<script type="text/javascript" src="resources/js/practice-improve.js"></script>

	</body>
</html>
