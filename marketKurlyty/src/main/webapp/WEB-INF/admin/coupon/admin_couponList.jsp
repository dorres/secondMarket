<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<style type="text/css">
.btn1 {font-size: 15px; white-space:nowrap; width:200px; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
		line-height:10px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative;
		-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
		transition: border .25s linear, color .25s linear, background-color .25s linear;

	}
.btn1.btn-dark{background-color: #8f3cab; border-color: #8f3cab; -webkit-box-shadow: 0 3px 0 #8f3cab; box-shadow: 0 3px 0 #8f3cab;}
.btn1.btn-dark:hover{background-color:#5f0080;}
.btn1.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
 </style>
 <script type="text/javascript">

	function delete_check(url) {
		var answer = confirm("게시글를 정말로 삭제할꺼임?");
		if (answer == true) {
			location = url;
		}
	}
//-->
</script>

</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">쿠폰</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">쿠폰 종류</li>
					<li class="breadcrumb-item active">목록</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header" >
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									쿠폰 종류 목록
									<a href="admin_couponWrite.mdo" class="btn1 btn-dark" style="float:right;">쿠폰 등록</a>
								</div>
						</div>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>쿠폰 코드</th>
									<th>쿠폰 이름</th>
									<th>쿠폰 최소 사용 금액</th>
									<th>쿠폰 할인금액</th>
									<th>쿠폰 시작일</th>
									<th>쿠폰 만료일</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>쿠폰 코드</th>
									<th>쿠폰 이름</th>
									<th>쿠폰 최소 사용 금액</th>
									<th>쿠폰 할인금액</th>
									<th>쿠폰 시작일</th>
									<th>쿠폰 만료일</th>
								</tr>
							</tfoot>
							<tbody>
									<c:forEach var="coupon" items="${couponList }">
										<tr>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'">${coupon.rownum }</td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'">${coupon.coupon_code }</td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'">${coupon.coupon_name }</td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'">${coupon.coupon_min }</td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'">
												<c:if test="${coupon.coupon_type ==0 }">
													${coupon.coupon_discount }%
												</c:if>
												
												<c:if test="${coupon.coupon_type ==1 }">
													<fmt:formatNumber value="${coupon.coupon_discount }" pattern="#,###"/>원
												</c:if>
											</td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'"><fmt:formatDate value="${coupon.coupon_start}" pattern="yyyy-MM-dd"/></td>
											<td onclick="location.href='admin_coupon.mdo?coupon_serial=${coupon.coupon_serial }'"><fmt:formatDate value="${coupon.coupon_end}" pattern="yyyy-MM-dd"/></td>
											<td>
												<input type="button" value="삭제하기" onclick="javascript:delete_check('admin_couponDelete.mdo?coupon_serial=${coupon.coupon_serial }')"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>
						</table>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
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
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>