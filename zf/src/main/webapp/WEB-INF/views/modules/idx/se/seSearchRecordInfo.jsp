<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>搜索记录管理</title>
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
    
    <form:form id="inputForm" modelAttribute="seSearchRecord" action="${ctx}/idx/se/seSearchRecord/info" method="post" class="form-horizontal">
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h5>搜索记录信息</h5>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            
                            <strong>关键词</strong>
                            <p class="text-primary">
                                ${seSearchRecord.keyword}
                            </p>
                            <hr class="zf-hr">
                            
                            <strong>类型</strong>
                            <p class="text-primary">
                                <span class="label label-primary">${fns:getDictLabel(seSearchRecord.type, 'idx_se_search_record_type', '')}</span>
                            </p>
                            <hr class="zf-hr">
                            
                            <strong>搜索量</strong>
                            <p class="text-primary">
                                ${seSearchRecord.searchNum}
                            </p>
                            <hr class="zf-hr">
                            
                            <strong>更新时间</strong>
                            <p class="text-primary">
                                <fmt:formatDate value="${seSearchRecord.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </p>
                            <hr class="zf-hr">
                            <strong>备注信息</strong>
                            <p class="text-primary">
                                ${seSearchRecord.remarks}
                            </p>
                            <hr class="zf-hr">
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