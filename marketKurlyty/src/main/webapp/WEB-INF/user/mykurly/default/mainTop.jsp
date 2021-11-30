<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<script>
$(document).ready(function(){
	$.ajax({
		url:"getMyInfo.do",
		type:"post",
		dataType:"JSON",
		success:function(res){
			$("div.grade_logo").text(res.user_membership_name.substring(0,4));
			$("strong#myName").text(res.user_id+"��");
			$("strong#pointRate").text("����"+res.pointRate+"%");
			$("p#myPoint").text(parseInt(res.user_point).toLocaleString("ko-KR")+"��");
			$("p#myCouponCount").text(res.couponCount+"��");
			$("strong#pointPagePoints").text(parseInt(res.user_point).toLocaleString("ko-KR")+"��");
		}
	})
})
</script>
<body>
<div id="myPageTop" class="page_aticle mypage_top">
	<h2 class="screen_out">����������</h2>
	<div class="mypagetop_user">
		<div class="inner_mypagetop">
			<div class="grade_user">
				<div class="grade_wrap">
					<div class="grade_logo class0"></div>
					<strong class="name" id="myName"></strong>
				</div>
				
				<div class="grade_bnenfit">
					<div class="benefit">
						<strong class="tit"> </strong>
						<strong id="pointRate"></strong>
					</div>
					<div class="benefit"></div>
				</div>
				
				<div class="next">
					<a href="#none" class="total_grade"> ��ü��� ���� </a> 
					<!-- <a href="#none" class="next_month"> ���� �� ������ ���� </a> -->
				</div>
			</div>
			
			<div class="list_mypage">
				<div class="list">
					<a href="point.do" class="link_wrap">
						<div class="link_title">������
							<img src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png" alt="" class="arrow_right">
						</div>
						<div class="spacer"></div>
							<p class="info" id="myPoint"></p>
					</a> 
					
					<a href="couponPage.do" class="link_wrap">
						<div class="link_title">����
							<img src="https://res.kurly.com/kurly/ico/2021/arrow_right_gray_56_56.png" alt="" class="arrow_right">
						</div>
						<div class="spacer"></div>
						<p class="info" id="myCouponCount"></p>
					</a> 
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>