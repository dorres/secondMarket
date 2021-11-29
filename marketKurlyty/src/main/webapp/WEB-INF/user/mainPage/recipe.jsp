<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/style/ItemListStyle.css">
</head>
<script>
$(document).ready(function(){
	console.log(${recipeList})
})
</script>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false">
	<a href="#top" id="gotoTop">맨 위로 가기</a>
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
		
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			
			<div id="main">
				<div id="content">
				
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->
					<div class="page_aticle">
						<div id="lnbMenu" class="lnb_menu">
							<div class="inner_lnb">
								<div class="ico_cate">
									<span class="tit">레시피</span>
								</div>
							</div>
						</div>
					</div>
					<div class="layout-wrapper">
						<div id="recipe" class="wrap">
							<table width="100%" align="center">
								<tbody>
									<tr>
										<td>
											<form name="frmList" action="/shop/board/list.php?&amp;"
												onsubmit="return chkFormList(this)">
												<input type="hidden" name="id" value="recipe">
												<table width="100%" id="recipe_table">
													<tbody>
														<c:forEach var="recipes" items="${recipeList }">
														<!-- 여기서부터 -->
															<tr class="recipe_tr">
																<c:forEach var="recipe" items="${recipes }">
																	<td align="left" valign="top">
																		<div>
																			<ul>
																				<li class="recipe_item"><a
																					href="recipeBookItemPage.do?recipe_serial=${recipe.recipe_serial }"> <img
																						src=${recipe.recipe_image_main }
																						width="480" height="480"
																						onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																					</a>
																					<p class="tit_recipe">${recipe.recipe_title }</p>
																				</li>
																			</ul>
																		</div>
																	</td>
																</c:forEach>
															</tr>
														</c:forEach>
														<tr class="recipe_tr">
														</tr>
													</tbody>
												</table>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>


				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</html>