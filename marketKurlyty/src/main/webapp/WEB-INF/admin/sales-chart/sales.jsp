<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>

 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <script src="jquery-3.6.0.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
   crossorigin="anonymous"></script>
<!--  -->
<script src="https://kit.fontawesome.com/d0b304acae.js"
   crossorigin="anonymous"></script>
<!-- fontawesomeCDN -->

<!-- Bootstrap CSS -->

<!-- Font Awesome -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!--  -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300|Rambla|Calligraffitti'
   rel='stylesheet' type='text/css'>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
		});
		function delete_check(url) {
			var answer = confirm("답변을 정말로 삭제합니까?");
			if (answer == true) {
				location.href = url;
			}
		}
		
	</script>
	<style type="text/css">
.btn1 {font-size: 20px; white-space:nowrap; width:100px; height:30px;  font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
		line-height:10px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative;
		-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
		transition: border .25s linear, color .25s linear, background-color .25s linear;

	}	
.btn1.btn-dark{background-color: #8f3cab; border-color: #8f3cab; -webkit-box-shadow: 0 3px 0 #8f3cab; box-shadow: 0 3px 0 #8f3cab;}
.btn1.btn-dark:hover{background-color:#5f0080;}
.btn1.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
 </style>
 
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		 <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">매출통계관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">매출</a></li>
                            <li class="breadcrumb-item active">Charts</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                일별 매출 관리
                            </div>
                            <div class="card-body">
                            <input type="hidden">
                           	<div style="text-align:center;">From: <input type="date" style="color:purple;">
                            To: <input type="date"><input type="button" value="조회" class="btn1"></div>
                            <canvas id="myAreaChart" width="50%" height="10"></canvas>
<script type="text/javascript">
 Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 Chart.defaults.global.defaultFontColor = '#292b2c';
 // Area Chart Example
 var total =0;
 var max =0;

 var jsonChart =  ${chartList};

 var labels = jsonChart.map(function(e){
    return e.daily_chart;
 })

 var data = jsonChart.map(function(e){
    total += e.sales_amount;
    
    if(e.sales_amount>max)
       max = e.sales_amount;
    
    return e.sales_amount;
 })
 $('#totalspan').html(total);
 var options = {
        scales: {
             xAxes: [{
               time: {
                 unit: 'date'
               },
               gridLines: {
                 display: false
               },
               ticks: {
                 maxTicksLimit: 7
               }
             }],
             yAxes: [{
               ticks: {
                 min: 0,
                 max: (max),
                 maxTicksLimit: 5
               },
               gridLines: {
                 color: "rgba(0, 0, 0, .125)",
               }
             }],
           },
           legend: {
             display: false
           }
  }

 var dataSets =  [{
     label: "sales amount",
     lineTension: 0.3,
     backgroundColor: "rgba(2,117,216,0.2)",
     borderColor: "rgba(2,117,216,1)",
     pointRadius: 5,
     pointBackgroundColor: "rgba(2,117,216,1)",
     pointBorderColor: "rgba(255,255,255,0.8)",
     pointHoverRadius: 5,
     pointHoverBackgroundColor: "rgba(2,117,216,1)",
     pointHitRadius: 50,
     pointBorderWidth: 2,
     data: data
   }];

 var chartData = {
     labels: labels,
     datasets: dataSets
   }

 var ctx = document.getElementById("myAreaChart").getContext('2d');
 var myLineChart = new Chart(ctx,{
      type: 'line',
      data:chartData,
      options: options
    });

 function newLineChart(){
    myLineChart.destroy();
    if($('#chartType').val()=='line'){
       $('#chartType').val('bar');
       chartType = $('#chartType').val();
       $('#barOrLine').text('line');
    }
    else{
       $('#chartType').val('line');
       chartType = $('#chartType').val();
       $('#barOrLine').text('bar');
    }
    
    ctx = document.getElementById("myChart");
     myLineChart = new Chart(ctx,{
         type: $('#chartType').val(),
         data: chartData,
         options: options
       });
 }

 </script>                            
                            </div>
                            &nbsp;&nbsp;&nbsp;
                            <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        월별 매출 관리
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="50%" height="10"></canvas></div>
                        </div>
                    </div>
                </main>

		<jsp:include page="../default/footer.jsp"></jsp:include>
	</div>
	</div>
	<!-- Main -->
	
	<!-- 건들지마세요 -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<%-- <script src="${pageContext.request.contextPath }/resources/js/chart-area.js"></script> --%>
	<script src="${pageContext.request.contextPath }/resources/js/chart-bar.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/chart-pie.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>