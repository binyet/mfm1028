<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://www.haze.com/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrap-3.3.5/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrap-3.3.5/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrapValidator/css/bootstrapValidator.min.css" />
<link type="text/css" rel="stylesheet" href="${ctx }/resource/frame/css/gs.ui.core.css">
<link type="text/css" rel="stylesheet" href="${ctx }/resource/easyui/css/gs.ui.datagrid.css">
<link type="text/css" rel="stylesheet" href="${ctx }/resource/ztree/css/metroStyle/metroStyle.css">
<script type="text/javascript" src="${ctx }/resource/frame/js/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/respond.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/html5shiv.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.datagrid.js"></script>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.datagrid-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.portal.js"></script>
<script type="text/javascript" src="${ctx }/resource/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.core.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.button.js"></script>
<script type="text/javascript" src="${ctx }/resource/ztree/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.window.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.msgtip.js"></script>
<script type="text/javascript" src="${ctx }/resource/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${ctx }/resource/swfupload/mySwfupload.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.diccombo.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.datagrid.edit.js"></script>
<!-- datagrid扩展 -->
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.datagrid.detailview.js"></script>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.datagrid.scrollview.js"></script>
<!-- 验证相关 -->
<script type="text/javascript" src="${ctx }/resource/bootstrapValidator/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${ctx }/resource/bootstrapValidator/js/myValidator.js"></script>
<script type="text/javascript" src="${ctx }/resource/bootstrapValidator/js/language/zh_CN.js"></script>
<!-- 提交后返回的信息 -->
<input type="hidden" id="message" name="message"  value="${message}"/>

