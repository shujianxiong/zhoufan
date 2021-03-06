<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>考勤管理</title>
    <meta name="decorator" content="adminLte"/>
    <style type="text/css">
        tr{ 
            cursor: pointer;    /*手形*/   
        } 
    </style>
</head>
<body>
<div class="content-wrapper sub-content-wrapper">
    
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body box-profile">
                        
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>员工</b> 
                                <a class="pull-right">${attendance.sysUser.name}</a>
                            </li>
                            <li class="list-group-item">
                                <b>考勤日期</b> 
                                <a class="pull-right"><fmt:formatDate value="${attendance.attendanceDate}" pattern="yyyy-MM-dd"/></a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>考勤类型</b> 
                                <a class="pull-right"><span class="label label-primary">${fns:getDictLabel(attendance.attendanceType, 'hrm_at_attendance_type', '')}</span></a>
                            </li>
                            <li class="list-group-item">
                                <b>考勤时间</b> 
                                <a class="pull-right">${attendance.attendanceTime}</a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>考勤结果</b> 
                                <a class="pull-right"><span class="label label-primary">${fns:getDictLabel(attendance.result, 'hrm_at_attendance_result_type', '')}</span></a>
                            </li>
                            <li class="list-group-item">
                                <b>数据来源类型</b> 
                                <a class="pull-right"><span class="label label-primary">${fns:getDictLabel(attendance.sourceType, 'hrm_at_attendance_source_type', '')}</span></a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>数据来源详情</b> 
                                <a class="pull-right">${attendance.sourceDetail}</a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>创建人</b> 
                                <a class="pull-right">${fns:getUserById(attendance.createBy.id).name }</a>
                            </li>
                            <li class="list-group-item">
                                <b>创建时间</b> 
                                <a class="pull-right"><fmt:formatDate value="${attendance.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
                            </li>
                            
                            <li class="list-group-item">
                                <b>更新人</b> 
                                <a class="pull-right">${fns:getUserById(attendance.updateBy.id).name }</a>
                            </li>
                            <li class="list-group-item">
                                <b>更新时间</b> 
                                <a class="pull-right"><fmt:formatDate value="${attendance.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/></a>
                            </li>
                            <li class="list-group-item">
                                <b>备注</b> 
                                <a class="pull-right">${attendance.remarks}</a>
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
</div>
</body>
</html>