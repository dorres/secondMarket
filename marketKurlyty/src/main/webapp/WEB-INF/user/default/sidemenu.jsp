<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div.quick-navigation{
	position: absolute;
    z-index: 1;
    left: 1420px;
    top: 330px;
    width: 80px;
    font: normal 12px/16px "Noto Sans";
    color: #333;
    letter-spacing: -0.3px;
    transition: top 0.2s;
}
div#quickNavi div.side_menu{
	width: 80px;
    border: 1px solid #ddd;
    border-top: 0 none;
    background-color: #fff;
}
div#quickNavi div.side_recent{
	position: relative;
    margin-top: 6px;
    border: 1px solid #ddd;
    background-color: #fff;
}
div#quickNavi .link_menu{
	display: block;
    height: 29px;
    padding-top: 5px;
    border-top: 1px solid #ddd;
    text-align: center;
}
div#quickNavi .link_menu:hover{
	color: #5f0080;
}
div.quickNaviFixed{
	position: fixed;
    z-index: 1;
    left: 1420px;
    top: 330px;
    width: 80px;
    font: normal 12px/16px "Noto Sans";
    color: #333;
    letter-spacing: -0.3px;
    transition: top 0.2s;
}
</style>
<script>
$(document).ready(function(){
	var boffset = $("#quickNavi").offset();
	
	$(window).scroll(function(){
		if($(document).scrollTop()>boffset.top-400){
			$("#quickNavi").attr("class","quickNaviFixed");
		}
		else{
			$("#quickNavi").attr("class","quick-navigation");	
		}
	});
});
</script>
	<div id="quickNavi" class="quick-navigation">
	
		<div class="bnr_qnb" id="brnQuick"></div>
	
	
		<div class="side_menu">
			<a href="/shop/main/html.php?htmid=event/kurly.htm&name=lovers"
				class="link_menu ">등급별 혜택</a> <a
				href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a> <a
				href="/shop/goods/goods_review_best.php" class="link_menu ">베스트
				후기</a>
		</div>
		<div class="side_recent" style="display: none">
			<strong class="tit">최근 본 상품</strong>
			<div class="list_goods" data-height="209">
				<ul class="list"></ul>
			</div>
			<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
			<button type="button" class="btn btn_down">최근 본 상품 아래로 내리기</button>
		</div>
	
	</div>