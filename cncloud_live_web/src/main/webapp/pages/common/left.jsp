<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${BASE}/static/assets/dist/img/user2-160x160.jpg"
					class="img-circle" alt="User Image" />
			</div>
			<div class="pull-left info">
				<p>
					<a href="${BASE}/index">刘基城</a>
				</p>
				<i class="fa fa-circle text-success"></i>
				<c:if test="${sessionScope.roleId=='1'}">超级管理员</c:if>
				<c:if test="${sessionScope.roleId=='0'}">普通用户</c:if>
				<c:if test="${sessionScope.roleId=='2'}">总编室用户</c:if>
			</div>
		</div>
		<ul class="sidebar-menu">
			<c:if test="${sessionScope.roleId=='0'}">
			<li class="header">导航栏</li>
				<li>
					<a href="${BASE}/switch"><i class="fa fa-circle-o text-blue"></i>全局切换</a>
				</li>
				<li>
					<a href="${BASE}/activity/preload"><i class="fa fa-circle-o"></i>新增活动</a>
				</li>
				<li>
					<a href="${BASE}/activity/list/1"><i class="fa fa-circle-o text-yellow"></i>活动管理</a>
				</li>
				<li class="header">系统设置</li>
				<li>
					<a href="${BASE}/channel/monitor/1"><i class="fa fa-circle-o text-yellow"></i>直播监控</a>
				</li>
				<li>
					<a href="${BASE}/channel/list/1"><i class="fa fa-circle-o text-green"></i>频道管理</a>
			    </li>
				<li>
					<a href="${BASE}/wowza/list/1"><i class="fa fa-circle-o text-blue"></i>播出服务管理</a>
				</li>
				<li>
					<a href="${BASE}/signal/list/1"><i class="fa fa-circle-o text-red"></i>信源管理</a>
			    </li>
				<li class="header">导航栏</li>
				<li>
					<a href="${BASE}/activity/preload"><i class="fa fa-circle-o"></i>新增活动</a>
				</li>
				<li>
					<a href="${BASE}/activity/list/1"><i class="fa fa-circle-o text-yellow"></i>活动管理</a>
				</li>
				<li class="header">系统设置</li>
				<li>
					<a href="${BASE}/channel/monitor/1"><i class="fa fa-circle-o text-yellow"></i>直播监控</a>
				</li>
				<li>
					<a href="${BASE}/channel/list/1"><i class="fa fa-circle-o text-green"></i>频道管理</a>
			    </li>
			</c:if>
				<c:if test="true">
				    <li class="header">UGC直播审查</li>
				    <li>
						<a href="${BASE}/user/list/1"><i class="fa fa-circle-o text-yellow"></i>主播管理</a>
					</li>
					<li>
						<a href="${BASE}/check/list/1"><i class="fa fa-circle-o text-red"></i>直播审查</a>
					</li>
					<li>
						<a href="${BASE}/video/check/1"><i class="fa fa-circle-o text-green"></i>点播审查</a>
					</li>
					<li>
						<a href="${BASE}/live/alllive/1"><i class="fa fa-circle-o text-yellow"></i>直播管理</a>
					</li>
					<li>
						<a href="${BASE}/word/list"><i class="fa fa-circle-o text-yellow"></i>敏感词管理</a>
					</li>
				</c:if>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>