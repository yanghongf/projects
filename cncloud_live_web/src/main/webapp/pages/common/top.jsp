<%@ page language="java" pageEncoding="utf-8"%>
<header class="main-header">
	<!-- Logo -->
	<a class="logo"><span class="logo-mini"><b><f:message key="common.h5title"/></b> </span> <span
		class="logo-lg"><b><f:message key="common.title"/></b> </span> </a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">菜单</span>
		</a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a class="dropdown-toggle"
					data-toggle="dropdown"> <img
						src="${BASE}/static/assets/dist/img/user2-160x160.jpg"
						class="user-image" alt="User Image" /> <span class="hidden-xs"><%=session.getAttribute("userName") %></span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="${BASE}/static/assets/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image" /></li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">个人信息</a>
							</div>
							<div class="pull-right">
								<a href="/logout" class="btn btn-default btn-flat">退出</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>