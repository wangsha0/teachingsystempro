<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">	
	<title>${sessionScope.COURSE_NAME} 课程详情</title>
	<link href="http://cdn.bootcss.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" rel="stylesheet">
	<link href="css/header.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<header class="navbar navbar-dark navbar-static-top bd-navbar" role="banner">
	  <div class="clearfix">	  
	    <button class="navbar-toggler pull-right hidden-sm-up" type="button" data-toggle="collapse" data-target="#bd-main-nav">
	      &#9776;
	    </button>
	    <a class="navbar-brand hidden-sm-up" href="#">
	     	 教学系统
	    </a>
	  </div>
	  <div class="collapse navbar-toggleable-xs" id="bd-main-nav">
	    <nav class="nav navbar-nav">
	      <a class="nav-item nav-link active" href="#">教学系统</a>
	      <a class="nav-item nav-link " href="courseCenter">课程中心</a>
	      <a class="nav-item nav-link " href="#">关于我们</a>
	    </nav>    
	  </div>
	  <nav id="headerright" class="nav navbar-nav navbar-right">	  	
	    <img src="${sessionScope.USER_URL }">  				    
	  	<div class="dropdown ">	  	 	     
	       <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"   aria-expanded="false">${sessionScope.USER_NAME}</a>		  		     	
		   <div class="dropdown-menu" aria-labelledby="dLabel">
		       <a class="dropdown-item" href="getInfo">修改资料</a>
		       <a class="dropdown-item" href="exit">退出</a>
		   </div>
	   </div>
	  </nav>
	</header>
	<hr style="margin-top:14px;">
		<div class="jumbotron" 
			style="background-image: url('img/cbg.jpg');background-size:cover;margin-top:14px;">
		  <h1 class="display-4">${course.cname}</h1>
		  <p class="lead">课程简介: ${course.ccontent}</p>
		  <hr class="m-y-md">
		  <p>学分:${course.ccredit} 学分.&nbsp;&nbsp;&nbsp;章节:${course.cchapter} 章节.&nbsp;&nbsp;&nbsp;课序号:
		  	<s:set value="false" scope="request" name="tag"></s:set>
		  	<s:iterator value="list[2]" id="sec">
		  		${sec[0]}&nbsp;
		  		<s:if test="#sec[1] == 1">
		  			<s:set value="true" scope="request" name="tag"></s:set>
		  		</s:if>
		  	</s:iterator>
		  	&nbsp;&nbsp;&nbsp;		  			  	
		  	<s:if test="#request.tag == true">
		  		管理员
		  	</s:if>
		  </p>
		</div>
		<div class="row">
			<div class="col-sm-9">
				<hr>
				<h3>教学视频:</h3>
				<s:if test="list[0].size()==0">
					还未上传教学视频.
				</s:if>
				<s:else>
					<ul class="list-group">
						<s:iterator value="list[0]" id="media">
							<!--  
							media.id:${media.id.cid },${media.id.mchapter },${media.id.mid }<br>
							media.mname:${media.mname }<br>
							media.murl:${media.murl }<br>
							media.mtype:${media.mtype }<br>
							media.mstatus:${media.mstatus }<br>
							-->
							<a class="list-group-item" href="play.jsp?url=${media.murl }&name=${media.mname }">
								第${media.id.mchapter }章  ${media.mname }
							</a>
						</s:iterator>
					</ul>
				</s:else>
			</div>
			<div class="col-sm-3">
				<hr>
				<div class="list-group">
				  	<a class="list-group-item" href="getposts">课程论坛</a>
				  	<a class="list-group-item" href="showstudents">查看学生</a>
				  	<a class="list-group-item" href="getpapers">考试系统</a>
				  	<s:if test="#request.tag == true">
					  	<a class="list-group-item" href="mgetvideos">资源管理</a>
					  	<a class="list-group-item" href="createQuestion.jsp">题库建设</a>
				  	</s:if>
				  	<a class="list-group-item" href="coursesystem.jsp">课程体系</a>
				</div>
				<hr>
				<h4>资料下载</h4>
				<s:if test="list[1].size()==0">
					还未上传ppt资源
				</s:if>
				<s:else>
					<div class="list-group">
						<s:iterator value="list[1]" id="ppt">
							<a href="${ppt.purl}" class="list-group-item">${ppt.pname }</a>
						</s:iterator>
					</div>
				</s:else>
			</div>
		</div>		
	</div>
	<script src="http://cdn.bootcss.com/jquery/2.2.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"></script>
</body>
