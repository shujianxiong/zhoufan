<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>扫描电子码管理</title>
    <meta name="decorator" content="adminLte"/>
    <style type="text/css">
        tr{ 
            cursor: pointer;    /*手形*/   
        } 
    </style>
</head>
<body>
<div class="content-wrapper sub-content-wrapper">
    <sys:tip content="${message}"/>
    
    <form:form id="inputForm" modelAttribute="video" action="${ctx}/bas/video/info" method="post" class="form-horizontal">
        <section class="content">
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <ul class="list-group list-group-unbordered">
	                           <li class="list-group-item">
	                               <b>编码</b> 
	                               <a class="pull-right">${video.code}</a>
	                           </li>
	                           <li class="list-group-item">
	                               <b>类型</b> 
	                               <a class="pull-right"><span class="label label-primary">${fns:getDictLabel(video.type, 'bas_video_type', '')}</span></a>
	                           </li>
	                           <li class="list-group-item">
	                               <b>视频文件</b> 
	                               <video width="320" height="240" controls="controls" style="object-fit:fill;">
										<source src="http://img.chinazhoufan.com/${video.fileUrl }" type="video/mp4">
									</video>
	                           </li>
	                           <li class="list-group-item">
	                               <b>标签</b> 
	                               <a class="pull-right"><span class="label label-primary">${video.tag}</span></a>
	                           </li>
	                           
	                           <li class="list-group-item">
	                               <b>创建者</b> 
	                               <a class="pull-right">${fns:getUserById(video.createBy.id).name}</a>
	                           </li>
	                           <li class="list-group-item">
	                               <b>创建时间</b> 
	                               <a class="pull-right"><fmt:formatDate value="${video.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
	                           </li>
	                           
	                           <li class="list-group-item">
                                   <b>更新者</b> 
                                   <a class="pull-right">${fns:getUserById(video.updateBy.id).name}</a>
                               </li>
                               <li class="list-group-item">
                                   <b>更新时间</b> 
                                   <a class="pull-right"><fmt:formatDate value="${video.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
                               </li>
	                           
	                           <li class="list-group-item">
	                               <b>备注</b> 
	                               <a class="pull-right">${video.remarks }</a>
	                           </li>
                            </ul>
                        </div>
                        
                        <div class="box-footer">
                            <button type="button" class="btn btn-default btn-sm" onclick="javascript:history.go(-1)">
                                <i class="fa fa-mail-reply"></i>返回
                            </button>
                        </div>
                    </div>
               </div>
            </div>
         </section>
    </form:form>
</div>
</body>
</html>