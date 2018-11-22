<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프로젝트 - 타임라인 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/business.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/callyPlus/business/biz_dhtmlxgantt.css?v=5.2.0"/>
	<script src="${pageContext.request.contextPath}/lib/callyPlus/business/dhtmlxgantt/biz_dhtmlxgantt.js?v=5.2.0"></script>
	<script src="${pageContext.request.contextPath}/lib/callyPlus/business/dhtmlxgantt/biz_dhtmlxgantt_marker.js?v=5.2.0"></script>
<style>

.weekend {
	background: #f4f7f4 !important;
}

.gantt_selected .weekend {
	background: #FFF3A1 !important;
}

.well {
	text-align: right;
}

@media ( max-width : 991px) {
	.nav-stacked>li {
		float: left;
	}
}

.container-fluid .row {
	margin-bottom: 10px;
}

.gantt_container {
	border-radius: 4px;
}

.gantt_grid_scale {
	background-color: transparent;
}

.gantt_hor_scroll {
	margin-bottom: 1px;
}

}
</style>
<%@ include file="biz_sidemenu.jspf" %>
<script>
	$('#biz_pjActive').addClass('active');
	$('#biz_act_ti').addClass('active');
</script>
    <section id="main-content">
      <section class="wrapper site-min-height;">
        <h3><i class="fa fa-angle-right"></i> 타임라인</h3>
        <!-- page start-->
        <div class="row form-panel" style="height: 750px; overflow: hidden">
      	     <div class="gantt_wrapper panel" id="biz_gantt" style="height: 100%; width:100%; margin: 0 auto"></div>
        </div>
        <!-- page end-->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->

<style>
.biz_status_line { background-color: #FCB322; }
.gantt_task_progress_wrapper{ background-color: #5bc0de; }
</style>
<%@ include file="js.jspf" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
  <script>
   /* 타임라인 */
   var pj_list = '${pj_list}';
   var task_list = '${task_list}';
   var p_l = $.parseJSON(pj_list);
   var t_l = $.parseJSON(task_list);
   var list = [];
       for (var i = 0; i < p_l.length; i++) {
    	var start = moment(p_l[i].PJ_START).format('DD-MM-YYYY');
		var end = moment(p_l[i].PJ_END).format('DD-MM-YYYY');
		var duration = moment(p_l[i].PJ_START).diff(moment(p_l[i].PJ_END));
    	list.push({"id":p_l[i].PJ_CODE, "text":p_l[i].PJ_TITLE, "start_date":start, "end_date":end, "duration":duration, "type":gantt.config.types.project, open: true});
    		for (var j = 0; j < t_l.length; j++) {
   			if(p_l[i].PJ_CODE == t_l[j].PJ_CODE){
    			var start = moment(t_l[j].TASK_START).format('DD-MM-YYYY hh:mm:ss');
   				var end = moment(t_l[j].TASK_END).format('DD-MM-YYYY hh:mm:ss');
   				var duration = moment(t_l[j].TASK_START).diff(moment(t_l[j].TASK_END));
   				list.push({"text":t_l[j].TASK_TITLE, "start_date":start, "end_date":end, "duration":duration, "parent":p_l[i].PJ_CODE});
   			}
		}
	}
/*       
var a =	[{"id":1, "text":"내 프로젝트 1", "type":gantt.config.types.project, "order":"4", open: true},
	{"id":2, "text":"뭐하지", "start_date":"02/10/2018", "duration":"8", "parent":"1", open: true},
	{"id":3, "text":"일정 2", "start_date":"25/10/2018", "duration":"8",  "parent":"1", open: true},
	{"id":4, "text":"The employee relocation", "start_date":"23-10-2018", "parent":"1", open: true},
	{"id":5, "text":"Interior office", "start_date":"02-11-2018", "parent":"1", open: true},
	{"id":6, "text":"Air conditioners check", "start_date":"18-10-2018", "end_date":"18-10-2018", "parent":"1", open: true},
	{"id":7, "text":"Workplaces preparation", "start_date":"30-10-2018", "duration":"8", "parent":"1", open: true},
	{"id":11, "text":"내 프로젝트 2", "type":gantt.config.types.project, "order":"5", open: true},
	{"id":12, "text":"Perform Initial testing", "start_date":"31-10-2018", "duration":"5", "order":"3", "parent":"11", open: true},
	{"id":13, "text":"Development", "start_date":"18-10-2018", "duration":"7", "order":"3", "parent":"11", open: true}];
 */
	var demo_tasks = {
		data:list
	};
   
	var getListItemHTML = function (type, count, active) {
		return '<li' + (active ? ' class="active"' : '') + '><a href="#">' + type + 's <span class="badge">' + count + '</span></a></li>';
	};
	
	var updateInfo = function () {
		var state = gantt.getState(),
			tasks = gantt.getTaskByTime(state.min_date, state.max_date),
			types = gantt.config.types,
			result = {},
			html = "",
			active = false;

		// get available types
		result[types.task] = 0;
		result[types.project] = 0;
		result[types.milestone] = 0;

		// sort tasks by type
		for (var i = 0, l = tasks.length; i < l; i++) {
			if (tasks[i].type && result[tasks[i].type] != "undefined")
				result[tasks[i].type] += 1;
			else
				result[types.task] += 1;
		}
		// render list items for each type
		for (var j in result) {
			if (j == types.task)
				active = true;
			else
				active = false;
			html += getListItemHTML(j, result[j], active);
		}

		document.getElementById("gantt_info").innerHTML = html;
	};

	gantt.templates.scale_cell_class = function (date) {
		if (date.getDay() == 0 || date.getDay() == 6) {
			return "weekend";
		}
	};
	gantt.templates.task_cell_class = function (item, date) {
		if (date.getDay() == 0 || date.getDay() == 6) {
			return "weekend";
		}
	};

	gantt.templates.rightside_text = function (start, end, task) {
		if (task.type == gantt.config.types.milestone) {
			return task.text;
		}
		return "";
	};

	gantt.config.columns = [
		{name: "text", label: "프로젝트명", width: "*", tree: true},
		{
			name: "start_time", label: "시작일", template: function (obj) {
				return gantt.templates.date_grid(obj.start_date);
			}, align: "left", width: 90
		},
		{
			name: "end_time", label: "종료일", template: function (obj) {
				return gantt.templates.date_grid(obj.end_date);
			}, align: "left", width: 90
		},
		{name: "duration", label: "작업기간", align: "center", width: 60}
	];
	gantt.config.grid_width = 480;
	gantt.config.date_grid = "%F %d";
	gantt.config.scale_height = 60;
	gantt.config.drag_move = false;
	gantt.config.drag_links = false;
	gantt.config.drag_resize = false;
	gantt.config.drag_progress = false;
	gantt.config.gantt_task_content = false;
	
	gantt.config.subscales = [
		{unit: "week", step: 1, date: "%W번째 주"}
	];
	
	gantt.attachEvent("onAfterTaskAdd", function (id, item) {
		updateInfo();
	});
	gantt.attachEvent("onAfterTaskDelete", function (id, item) {
		updateInfo();
	});
	
	var date_to_str = gantt.date.date_to_str(gantt.config.task_date);
	var today = new Date();
	gantt.addMarker({
		start_date: today,
		css: "biz_status_line",
		text: "오늘",
		title: "Today: " + date_to_str(today)
	});

	gantt.init("biz_gantt");
	gantt.parse(demo_tasks);
	updateInfo();
	
	
  </script>