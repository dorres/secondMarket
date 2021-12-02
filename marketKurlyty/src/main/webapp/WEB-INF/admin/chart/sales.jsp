<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트</title>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/admin/styles.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
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
<!-- 챠트 -->
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
.btn1 {
	font-size: 20px;
	white-space: nowrap;
	width: 100px;
	height: 30px;
	font-family: Open Sans, Helvetica, Arial, sans-serif;
	text-decoration-line: none;
	line-height: 10px;
	display: inline-block;
	zoom: 1;
	color: #fff;
	text-align: center;
	position: relative;
	-webkit-transition: border .25s linear, color .25s linear,
		background-color .25s linear;
	transition: border .25s linear, color .25s linear, background-color .25s
		linear;
}

.btn1.btn-dark {
	background-color: #8f3cab;
	border-color: #8f3cab;
	-webkit-box-shadow: 0 3px 0 #8f3cab;
	box-shadow: 0 3px 0 #8f3cab;
}

.btn1.btn-dark:hover {
	background-color: #6633CC;
	color: #330033;
}

.btn1.btn-dark:active {
	top: 3px;
	outline: none;
	-webkit-box-shadow: none;
	box-shadow: none;
}
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
					
					
					<form method="post" id="form1">
						<div class="row" style="flex-wrap: nowrap;">
							<div class="col-lg-6" style="float:left">
								<div class="card mb-4">
									<div class="card-header" style="background:#FF6384;">
										<i class="fas fa-chart-area me-1"></i> 일별 매출 관리
									</div>
									<div class="card-body">
										<div style="text-align: center;">
											From: 
											<input type="date" name="startdate" id="startdate" onchange="filterData()" value="2021-11-20"> 
											To: <input type="date" name="enddate" id="enddate" onchange="filterData()">
										</div>
										<div align="center">
											<input type="button" id="ben1" class="btn1" value="Exel" style="margin-top:2%;">
										</div>
									</div>
								</div>
							</div>
						</form>
						
						&nbsp;&nbsp;&nbsp;
						<form method="post" id="form2">
						<div class="col-lg-6">
							<div class="card mb-4">
								<div class="card-header" style="background:#660099; color:white">
									<i class="fas fa-chart-bar me-1"></i> 월별 매출 관리
								</div>
								<div class="card-body" >
									<div style="text-align: center;">
										From: <input type="month" id="startdate2" name="startdate2"
											onchange="filter2Data()" value="2021-11"> To: <input
											type="month" id="enddate2" name="enddate2" onchange="filter2Data()">
									</div>
									<div align="center">
										<input type="submit" id="ben2" class="btn1" value="Exel" style="margin-top:2%;">
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
						
					
					
					<div class="row" style="flex-wrap: nowrap;">
						<div class="col-lg-6" style="float:left;" >
							<div class="card mb-4"  style="height:92%">
								<div class="card-header" style="background:#FF6384;">
									<i class="fas fa-chart-area me-1"></i> 일별 매출 차트
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="50%" height="23%"></canvas>
									<hr>
								</div>
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;
						<div class="col-lg-6">
							<div class="card mb-4">
								<div class="card-header" style="background:#660099;  color:white">
									<i class="fas fa-chart-bar me-1"></i> 월별 매출 차트
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="50%" height="22%"></canvas>
									<hr>
								</div>
							</div>
						</div>

					</div>

				</div>
			</main>

			<jsp:include page="../default/footer.jsp"></jsp:include>
		</div>
	</div>
	
<script type="text/javascript">
$("#ben1").click(function() {   
	   $("#form1").attr("action", "salesExel1.mdo");  
	   $("#form1").submit();
	});
$("#ben2").click(function() {   
	   $("#form2").attr("action", "salesExel2.mdo");  
	   $("#form2").submit();
	});
</script>
	<!-- Main -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
	<script type="text/javascript">
	//매출차트 일별
 Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 Chart.defaults.global.defaultFontColor = '#292b2c';
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
                 maxTicksLimit: 9
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
     label: data,
     lineTension: 0.3,
     backgroundColor: "rgba(255,99,132,1)",
     borderColor: "rgba(255,99,132,1)",
     pointRadius: 5,
     pointBackgroundColor: "rgba(255,102,153,1)",
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
 function filterData(){
	    const labels2 = [...labels];
	    const startdate = document.getElementById('startdate');
	    const enddate = document.getElementById('enddate');
	    
	    const indexstartdate  = labels2.indexOf(startdate.value);
	    const indexenddate  = labels2.indexOf(enddate.value);
	    //console.log(indexstartdate);
	    
	    
	    
	    const filterDate = labels2.slice(indexstartdate,indexenddate +1);
	    myLineChart.data.labels = filterDate;
	    
	    const data2 = [...data];
	    const filterDatapoints = data2.slice(indexstartdate,indexenddate +1);
	    myLineChart.data.datasets[0].data = filterDatapoints;
	    
	    myLineChart.update(chartData);
	    console.log(data);
	    console.log(labels);
	    if(filterDate ==0)
	    	alert('매출이 있는 날짜를 선택해주세요');
	 }

 </script>

	<script type="text/javascript">
	//매출차트 월별
 Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
 Chart.defaults.global.defaultFontColor = '#292b2c';
 var total2 =0;
 var max2 =0;

 var jsonChart2 =  ${chartMonth};
 var labels2 = jsonChart2.map(function(e){
    return e.month_chart;
 })

 var data2 = jsonChart2.map(function(e){
    total2 += e.sales_amount;
    
    if(e.sales_amount>max2)
       max2 = e.sales_amount;
    
    return e.sales_amount;
 })
 $('#totalspan').html(total2);
 var options2 = {
        scales: {
             xAxes: [{
               time: {
                 unit: 'date2'
               },
               gridLines: {
                 display: false
               },
               ticks: {
                 maxTicksLimit: 12
               }
             }],
             yAxes: [{
               ticks: {
                 min: 0,
                 max: (max2),
                 maxTicksLimit: 8
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

 var dataSets2 =  [{
     label: data2,
     lineTension: 0.3,
     backgroundColor: "rgba(102,051,153,1)",
     borderColor: "rgba(255,99,132,1)",
     pointRadius: 5,
     pointBackgroundColor: "rgba(255,102,153,1)",
     pointBorderColor: "rgba(255,255,255,0.8)",
     pointHoverRadius: 5,
     pointHoverBackgroundColor: "rgba(2,117,216,1)",
     pointHitRadius: 50,
     pointBorderWidth: 2,
     data: data2
   }];

 var chartData2 = {
     labels: labels2,
     datasets: dataSets2
   }

 var ctxx = document.getElementById("myBarChart").getContext('2d');
 var myBarChart = new Chart(ctxx,{
      type: 'bar',
      data:chartData2,
      options: options2
    });
 function filter2Data(){
	    const labels3 = [...labels2];
	    const startdate2 = document.getElementById('startdate2');
	    const enddate2 = document.getElementById('enddate2');
	    
	    const indexstartdate2  = labels3.indexOf(startdate2.value);
	    const indexenddate2  = labels3.indexOf(enddate2.value);
	    //console.log(indexstartdate);
	    
	    
	    
	    const filterDate2 = labels3.slice(indexstartdate2,indexenddate2 +1);
	    myBarChart.data.labels = filterDate2;
	    
	    const data3 = [...data2];
	    const filterDatapoints2 = data2.slice(indexstartdate2,indexenddate2 +1);
	    myBarChart.data.datasets2[0].data2 = filterDatapoints2;
	    
	    myBarChart.update();
	    if(filter2Date ==0)
	    	alert('매출이 있는 날짜를 선택해주세요');
	    
	 }

 </script>


	<!-- 건들지마세요 -->
</body>
</html>