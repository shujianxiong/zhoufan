<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>体验包体验记录管理</title>
    <meta name="decorator" content="adminLte"/>
    <style type="text/css">
        tr{ 
            cursor: pointer;    /*手形*/   
        } 
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            
        });
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<div class="content-wrapper sub-content-wrapper">
    <section class="content-header content-header-menu">
        <h1>
            <small class="menu-active"><i class="fa fa-repeat"></i><a href="${ctx}/spm/ep/experiencePackItem/">体验包体验记录列表</a></small>
        </h1>
    </section>
    <sys:tip content="${message}"/>
    <section class="content">
        <div class="box box-info">
            <div class="box-header with-border zf-query">
                <h5>查询条件</h5>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool"data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool"data-widget="remove"><i class="fa fa-remove"></i></button>
                </div>
            </div>
            
            <form:form id="searchForm" modelAttribute="experiencePackItem" action="${ctx}/spm/ep/experiencePackItem/" method="post" class="form-horizontal">
                <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div  class="form-group">
                                <label for="musercode" class="col-sm-3 control-label">会员账号</label>
                                <div class="col-sm-7">
                                    <sys:inputverify name="member.usercode" id="musercode" verifyType="0" tip="请输入会员账号" isSpring="true" isMandatory="false"></sys:inputverify>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div  class="form-group">
                                <label for="payType" class="col-sm-3 control-label">支付类型</label>
                                <div class="col-sm-7">
                                    <sys:selectverify name="payType" tip="请选择支付类型" verifyType="99" isMandatory="false" dictName="experience_pack_pay_type" id="payType"></sys:selectverify>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div  class="form-group">
                                <label for="payType" class="col-sm-3 control-label">状态</label>
                                <div class="col-sm-7">
                                    <sys:selectverify name="status" tip="请选择状态" verifyType="99" isMandatory="false" dictName="experience_pack_status" id="status"></sys:selectverify>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <div class="pull-right box-tools">
                        <button type="button" class="btn btn-default btn-sm" onclick="ZF.resetForm()"><i class="fa fa-refresh"></i>重置</button>
                        <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-search"></i>查询</button>
                    </div>
                </div>
            </form:form>
        </div>
    
        <div class="box box-soild">
            <div class="box-body">
                <div class="table-responsive">
                    <table id="contentTable" class="table table-bordered table-hover table-striped zf-tbody-font-size">
                        <thead>
                            <tr>
                                <th class="zf-dataTables-multiline"></th>
                                <th>会员账号</th>
                                <th>支付流水号</th>
                                <th>支付类型</th>
                                <th>支付时间</th>
                                <th>支付人openid</th>
                                <th>支付返回结果</th>
                                <th>启用日期</th>
                                <th>结束日期</th>
                                <th>体验包</th>
                                <th>已体验次数</th>
                                <th>状态</th>
                                <th style="display: none;">更新时间</th>
                                <th style="display: none;">备注信息</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${page.list}" var="experiencePackItem" varStatus="status">
                                <tr data-index="${status.index }">
                                    <td class="details-control text-center">
                                        <i class="fa fa-plus-square-o text-success"></i>
                                    </td>
                                    <td>
                                            ${fns:getMemberById(experiencePackItem.member.id).usercode}
                                    </td>
                                    <td>
                                            ${experiencePackItem.no}
                                    </td>
                                    <td>
                                        <span class="label label-primary">${fns:getDictLabel(experiencePackItem.payType, 'experience_pack_pay_type', '')}</span>
</td>
                                    <td>
                                        <fmt:formatDate value="${experiencePackItem.payTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
</td>
                                    <td>
                                        ${experiencePackItem.openid}
</td>
                                    <td>
                                        ${experiencePackItem.returnResult}
</td>
                                    <td>
                                        <fmt:formatDate value="${experiencePackItem.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
</td>
                                    <td>
                                        <fmt:formatDate value="${experiencePackItem.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
</td>
                                    <td>
                                            ${experiencePackItem.experiencePack.name}
                                    </td>
                                    <td>
                                            ${experiencePackItem.useTimes}
                                    </td>
                                    <td>
                                        <span class="label label-primary">${fns:getDictLabel(experiencePackItem.status, 'experience_pack_status', '')}</span>
                                    </td>
                                    <td data-hide="true">
                                        <fmt:formatDate value="${experiencePackItem.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
</td>
                                    <td data-hide="true">
                                        ${experiencePackItem.remarks}
</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="box-footer">
                <div class="dataTables_paginate paging_simple_numbers">${page}</div>
            </div>
        </div>
     </section>
    </div>
    
    <script>
      $(function () {
        
        ZF.bigImg();
         
        $('input').iCheck({
            checkboxClass : 'icheckbox_minimal-blue',
            radioClass : 'iradio_minimal-blue'
        });
          
        //表格初始化
        ZF.parseTable("#contentTable", {
            "paging" : false,
            "lengthChange" : false,
            "searching" : false,
            "ordering" : true,
            "order": [[ 0, "desc" ]],//指定默认初始化按第几列排序，默认排序升序，降序
            "columnDefs":[
                {"orderable":false,targets:1},
                {"orderable":false,targets:2}
                
            ],
            "info" : false,
            "autoWidth" : false,
            "multiline" : true,//是否开启多行表格
            "isRowSelect" : true,//是否开启行选中
            "rowSelect" : function(tr) {
                
            },
            "rowSelectCancel" : function(tr) {
                
            }
        })
      });
      
   </script>
</body>
</html>