<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>日常菜谱下菜品编辑</title>
    <meta name="decorator" content="adminLte"/>
    <script type="text/javascript">
        $(document).ready(function() {
            
            $('input').iCheck({
                checkboxClass : 'icheckbox_minimal-blue',
                radioClass : 'iradio_minimal-blue'
            });
        });
    </script>
</head>
<body>
    <div class="content-wrapper sub-content-wrapper">
    <section class="content-header content-header-menu">
    	 <h1>
            <small><i class="fa-list-style"></i><a href="${ctx}/hrm/di/diet/">菜谱列表</a></small>
            <small>|</small>
            <small><i class="fa-list-style"></i><a href="${ctx}/hrm/di/dish/list?id=${dish.diet.id}">菜品列表</a></small>
            <small>|</small>
            <small class="menu-active">
                <i class="fa fa-repeat"></i><a href="${ctx}/hrm/di/dish/info?id=${dish.id}">菜品详情</a>
            </small>
        </h1>
    </section>
    <sys:tip content="${message}"/>
    <section class="content">
        <div class="row">
            <div class="col-md-6">
                <form:form id="inputForm" modelAttribute="dish" action="${ctx}/hrm/di/dish/save" method="post" class="form-horizontal" onsubmit="return ZF.formSubmit();">
                    <div class="box box-success">
                        <div class="box-header with-border zf-query">
                            <h5>菜品详情</h5>
                            <div class="box-tools">
                               <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <form:hidden path="id" />
                            <form:hidden path="diet.id" />
                            <div class="form-group    ">
                                <label class="col-sm-2 control-label">菜谱日期</label>
                                <div class="col-sm-9">
                                    <input id="diet.date" name="diet.date" readonly="readonly" value="<fmt:formatDate value='${dish.diet.date}' pattern='yyyy-MM-dd'/>" class="form-control zf-input-readonly"/>
                                </div>
                            </div>
                            <div class="form-group    ">
                                <label class="col-sm-2 control-label">三餐类型</label>
                                <div class="col-sm-9">
                                    <input id="dish.type" readonly="readonly" value="${fns:getDictLabel(dish.type,'hrm_di_mealType','') }" class="form-control zf-input-readonly"/>
                                </div>
                            </div>
                            <div class="form-group    ">
                                <label class="col-sm-2 control-label">菜品名称</label>
                                <div class="col-sm-9">
                                    <input id="dish.name" readonly="readonly" value="${dish.name}" class="form-control zf-input-readonly"/>
                                </div>
                            </div>
                            <div class="form-group    ">
                                <label class="col-sm-2 control-label">评价得分</label>
                                <div class="col-sm-9">
                                    <sys:inputverify id="score" name="score" tip="请输入评价得分" verifyType="0"  isSpring="true" forbidInput="true" isMandatory="false"></sys:inputverify>
                                </div>
                            </div>
                            <div class="form-group    ">
                                <label class="col-sm-2 control-label">备注信息</label>
                                <div class="col-sm-9">
                                    <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="form-control" readonly="true"/>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <div class="pull-left box-tools">
                                <button type="button" class="btn btn-default btn-sm" onclick="window.location.href='${ctx}/hrm/di/dish/list?id=${dish.diet.id}'"><i class="fa fa-mail-reply"></i>返回</button>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
    </div>
    
</body>
</html>