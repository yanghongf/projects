<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>500 | 直播管理系统</title>
		<meta
			content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
			name='viewport'>
		<jsp:include page="/pages/common/css.jsp"></jsp:include>
	</head>
	<body class="skin-blue sidebar-mini">
		<div class="wrapper">
			<jsp:include page="/pages/common/top.jsp"></jsp:include>
			<!-- Left side column. contains the logo and sidebar -->
			<jsp:include page="/pages/common/left.jsp"></jsp:include>
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
				<h1>
				</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#"><i class="fa fa-dashboard"></i> Home</a>
					</li>
					<li>
						<a href="#">Examples</a>
					</li>
					<li class="active">
						500 error
					</li>
				</ol>
				</section>
				<!-- Main content -->
				<section class="content">
				<div class="error-page">
					<h2 class="headline text-red">
						500
					</h2>
					<div class="error-content">
						<h3>
							<i class="fa fa-warning text-red"></i> Oops! Something went
							wrong.
						</h3>
						<p>
							系统内部错误！
						</p>
					</div>
				</div>
				</section>
			</div>
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="/pages/common/bottom.jsp"></jsp:include>
		<jsp:include page="/pages/common/js.jsp"></jsp:include>
	</body>
</html>