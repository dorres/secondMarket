<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
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
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">

	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>
		
		<!-- Main -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="row">
						<!-- primary Card -->
						<div class="col-xl-3 col-md-6" >
							<div class="card bg-primary text-white mb-4" >
								<div class="card-body" >금 주 매출</div>
								<div class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="sales.mdo">자세히보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<!-- primary Card -->
						
						<!-- Warning Card -->
						<div class="col-xl-3 col-md-6">
							<div class="card bg-warning text-white mb-4">
								<div class="card-body">금 달 매출</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="sales.mdo">
									자세히보기</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<!-- Warning Card -->
						
						<!--  Success Card -->
						<div class="col-xl-3 col-md-6">
							<div class="card bg-success text-white mb-4">
								<div class="card-body">주문 요청(결제완료)</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="admin_orderWaitList.mdo">
									${orderCount.count}건</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
						<!--  Success Card -->
						
						
						<!-- Danger Card -->
						<div class="col-xl-3 col-md-6">
							<div class="card bg-danger text-white mb-4">
								<div class="card-body">1:1 문의/상품 문의</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link" href="gqnaList.mdo">
									${gqnaCount.count }건</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Danger Card -->
					
					
					<div class="row">
						<!-- Area Chart Example -->
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> 일별 차트
								</div>
								<div class="card-body">
									<canvas id="myAreaChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						<!-- Area Chart Example -->
						
						<!-- Bar Chart Example-->
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> 월별 차트
								</div>
								<div class="card-body">
									<canvas id="myBarChart" width="100%" height="40"></canvas>
								</div>
							</div>
						</div>
						
					</div>
					
					<!-- 리스트 형태 -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Best Top Ten!
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
									<th style="background:#CCCCCC;">랭크</th>
									<th style="background:#CCCCCC;">상품명</th>
									<th style="background:#CCCCCC;">판매횟수</th>
									<th style="background:#CCCCCC;">총 판매금액</th>
								</tr>
							</thead>
							
							<c:forEach var="best" items="${bestList }">
							<c:set var="i" value="${i+1 }"/>
								<tr>
									<td style="background:#CCCCCC;">${i }위</td>
									<td>${best.category_goods_name}</td>
									<td>${best.order_goods_count}</td>
									<td>${best.order_goods_price}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</main>
			
			<jsp:include page="default/footer.jsp"></jsp:include>
		</div>
		<!-- Main -->
	</div>
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
                 maxTicksLimit: 6
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
	    console.log(filterDate);
	    
	    const data2 = [...data];
	    const filterDatapoints = data2.slice(indexstartdate,indexenddate +1);
	    myLineChart.data.datasets[0].data = filterDatapoints;
	    
	    myLineChart.update();
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
	console.log(jsonChart2);
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
                 maxTicksLimit:12
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

</body>
</html>