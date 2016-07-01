<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改活动 | <f:message key="common.title" /></title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<%@ include file="/pages/common/css.jsp"%>

<style type="text/css">
            span.error{
                padding-left: 15px;
                color: red;
            }
        </style>
<link
	href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet">
	 <script type="text/javascript" charset="utf-8" src="${BASE}/static/assets/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${BASE}/static/assets/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${BASE}/static/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
    
</head>
<body  class="skin-blue  fixed ">
	<div class="wrapper">
		<%@ include file="/pages/common/top.jsp"%>
		<%@ include file="/pages/common/left.jsp"%>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>${empty tActivity.id ? '新建活动':'编辑活动'}
					<small>${tActivity.title}</small> <small class="label label-warning"
						style="display: none" id="info_tab_span"><i
						class="fa fa-bell-o"></i>保存成功</small>
				</h1>
				<ol class="breadcrumb">
					<li><a><i class="fa fa-dashboard"></i> 首页</a></li>
					<li class="active">修改活动</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<form id="create_form" enctype="multipart/form-data" method="post" >
					<div class="row">
						<!-- right column -->
						<div class="col-md-12">
							<!-- general form elements disabled -->
							<div class="box box-warning">
								<div class="box-body">
									<div class="form-group">
										<label> 活动名称 </label>
										<div class="input-group">
											<span class="input-group-addon"><i class="fa  fa-font"></i>
											</span> <input type="text" value="${tActivity.title }" name="name"
												id="name" class="form-control">
												<input type="text" id="activity_id" name="activity_id" value="${tActivity.id}" hidden="">
										</div>
									</div>
									<div class="form-group">
										<label> 直播时间 </label>
										<div class="row">
											<div class="col-lg-6">
												<div class="input-group">
													<span class="input-group-addon"> 开始时间 </span> <input
														type="text" class="form-control form_datetime"
														value="<fmt:formatDate value="${tActivity.start_time}" pattern="yyyy-MM-dd HH:mm"/>"
														name="start_time" id="start_time"
														data-inputmask="'alias': 'yyyy-MM-dd HH:mm'" data-mask="" />
												</div>
											</div>
											<div class="col-lg-6">
												<div class="input-group">
													<span class="input-group-addon"> 结束时间</span> <input
														type="text" class="form-control form_datetime"
														value="<fmt:formatDate value="${tActivity.end_time}" pattern="yyyy-MM-dd HH:mm"/>"
														name="end_time" id="end_time"
														data-inputmask="'alias': 'yyyy-MM-dd HH:mm'" data-mask="">
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label>海报 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-file-word-o"></i> </span> <input id="input-22" type="file" value="${tActivity.poster}"name="input-22"  accept="image/*" class="file-loading">
										</div>
									</div>
									<div class="form-group">
										<label> 播出直播间 </label>
										<div class="box box-warning">
											<div class="box-body">
												<div class="form-group">
													<select class="form-control" name="t_room_id"
														id="t_room_id">
														<c:forEach var="item" items="${tRooms}"
															varStatus="stat">
															<option  id="t_room_id_${item.id}" ${item.id==tActivity.live_room_id ? 'selected="selected"':''}   value="${item.id}">${item.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label>活动简述 </label>
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-file-word-o"></i> </span> <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
										</div>
									</div>
									<div class="box-footer">
										<button type="submit" id="t_activity_save_btn"
											name="t_activity_save_btn" class="btn  btn-success">
											<i class="fa  fa-save "></i> 保存
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
		</div>
		</section>
	</div>
 </div>
	<%@ include file="/pages/common/bottom.jsp"%>
</div>
	 <!-- 信号选择结束 -->
	<%@ include file="/pages/common/js.jsp"%>
 
	<script type="text/javascript">
	 
	
      $(function () {
        //Money Euro
        $("[data-mask]").inputmask();
      });
		
       $(function () {
        $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                  ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                  },
                  startDate: moment().subtract('days', 29),
                  endDate: moment()
                },
        function (start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );
      });
    </script>


	<!-- Le javascript
  ================================================== -->
	<script
		src="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

	<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        //format: "dd MM yyyy - hh:ii",
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        pickerPosition: "bottom-right"
    });
</script>
	 
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor',{
	         autoHeightEnabled: true,
   	         autoFloatEnabled: true
    });


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    
    $(document).on('ready', function() {
		$("#input-22").fileinput({
			previewFileType : "image",
			browseClass : "btn btn-success",
			browseLabel : "Pick Image",
			browseIcon : "<i class=\"glyphicon glyphicon-picture\"></i> ",
			removeClass : "btn btn-danger",
			removeLabel : "Delete",
			removeIcon : "<i class=\"glyphicon glyphicon-trash\"></i> ",
			uploadClass : "btn btn-info",
			uploadLabel : "Upload",
			uploadIcon : "<i class=\"glyphicon glyphicon-upload\"></i> "
		});

		$(function() {
			$('#create_form').ajaxForm({
				type : 'post',
				url : '../../live/save',
				enctype : 'multipart/form-data',
				beforeSubmit : function() {
						return true;
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("错误");
				},
				success : function(result) {
					location.href = '../../live/list/1';
				}
			});
		});
	});
    
   /*  $(function() {
		$('#create_form').ajaxForm({
			type : 'post',
			url : '../live/save',
			enctype : 'multipart/form-data',
			beforeSubmit : function() {
				var cms_column_ref_id=$("#input-22").val();
				if(cms_column_ref_id==''){
					alert("请输入栏目名称，点击获取，然后选择！");
					return false;
			}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("错误");
			},
			success : function(result) {
				location.href = '../live/list/1';
			}
		});
	});
	 */
    
</script>
</body>
</html>
