<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<!-- interface -->
						<div class="sb-sidenav-menu-heading">메뉴</div>
						
						<!--회원/관리자  -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 회원/관리자
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								
								<!-- 회원 -->
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> 회원
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="admin_userList.mdo">회원관리</a>
										<a class="nav-link" href="terms_agreeList.mdo">약관관리</a>
									</nav>
								</div>
								<!--회원 -->
								
								<!-- 매니저관리 -->
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> 매니저관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="admin_adminList.mdo">매니저관리/등록</a>
									</nav>
								</div>
								<!-- 매니저관리 -->
							</nav>
						</div>
						
						<!-- 상품/판매 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages1" aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div>
							상품/판매
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						
						<div class="collapse" id="collapsePages1" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
								
								<!-- 카테고리 -->
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
									카테고리<br>조회/등록/수정
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="admin_categoryMainList.mdo">1차(메인)</a>
										<a class="nav-link" href="admin_categorySubList.mdo">2차(서브)</a>
										<a class="nav-link" href="admin_categoryGoodsList.mdo">3차(상품)</a>
									</nav>
								</div>
								<!--카테고리 -->
								
								<!-- 판매 -->
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
									상품<br>조회/등록/수정
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="getGoodsList.mdo">조회/수정</a>
										<a class="nav-link" href="registration.mdo">등록</a>
									</nav>
								</div>
								<!-- 판매 -->
							</nav>
						</div>
						
						
						<!-- 주문/환불 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 주문/환불
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_orderWaitList.mdo">주문관리(결제완료)</a>
								<a class="nav-link" href="admin_orderdeliveryList.mdo">주문관리(배송과정)</a>
								<a class="nav-link" href="admin_orderFinishList.mdo">주문관리(구매완료)</a>
								<a class="nav-link" href="admin_orderRefundList.mdo">환불관리</a>
								<a class="nav-link" href="admin_orderReturnList.mdo">반품관리</a>
								<a class="nav-link" href="admin_orderCancleList.mdo">취소관리</a>
							</nav>
						</div>
						
						<!-- 정산관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts1" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 정산관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="#">정산내역</a>
								<a class="nav-link" href="#">주별정산</a>
								<a class="nav-link" href="#">월별정산</a>
							</nav>
						</div>
						
						<!-- 게시글 관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 게시글관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_noticeList.mdo">공지사항</a>
								<a class="nav-link" href="admin_FAQList.mdo">자주하는 질문</a>
								<a class="nav-link" href="admin_personalQnaWaitList.mdo">1:1문의-답변대기</a>
								<a class="nav-link" href="admin_personalQnaFinishList.mdo">1:1문의-답변완료</a>						
							</nav>
						</div>
						
						<!-- 리뷰관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 리뷰관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">리뷰</a>
								<a class="nav-link" href="layout-sidenav-light.html">문의</a>
							</nav>
						</div>
						<!-- 리뷰관리 -->
						
						<!-- 마케팅 관리 -->
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 마케팅 관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="admin_bannerList.mdo">배너</a>
								<a class="nav-link" href="layout-sidenav-light.html">쿠폰</a>	
								<a class="nav-link" href="admin_membershipList.mdo">적립금</a>														
							</nav>
						</div>
						<!-- 마케팅 관리 -->

					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Market Kurlyty</div>
					Admin_index
				</div>
			</nav>
		</div>