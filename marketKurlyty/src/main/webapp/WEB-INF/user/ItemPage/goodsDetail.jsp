<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->


<!-- ! ! ! ! ! ! ! 원본 임시 저장 ! ! ! ! ! !   -->


<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/sortMenu.css">
</head>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">

			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->

			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->

					<div style="margin:0 auto; width: 1050px;">
						<!-- 베스트 -->
						<div style="padding-top: 26px;">
							<div class="MainIntroTitle">
								<div class="TitleDiv" align="center">
									<span>베스트</span>
								</div>
							</div>
						</div>
						
						
						<div id="sortbar">
							<div class="list_ability">
								<div class="sort_menu">
									<div class="">
										<p class="count">
											<span class="inner_count"> 총 463건 </span>
										</p>
										<div class="select_type user_sort">
											<!---->
											<a class="name_select">신상품순</a>
											<ul class="list">
												<li><a class="">추천순</a></li>
												<li><a class="on">신상품순</a></li>
												<li><a class="">인기상품순</a></li>
												<li><a class="">혜택순</a></li>
												<li><a class="">낮은 가격순</a></li>
												<li><a class="">높은 가격순</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					
						
						
						<div class="MainIntroContain">
							<ul class="foodList">
								<c:forEach begin="1" end="50" step="1">
									<li>
										<div class="foodImg">
											<a href="#"><img src="${pageContext.request.contextPath }/resources/images/Item/cream.png"></a>
										</div> <a class="info" href="#">
												<span class="name">[바이오] 크림치즈</span>
												<span class="cost"> <span class="dc">12%</span>
												<span class="price">6,500원</span> <span class="origin">1,800원</span>
												<span class="desc">꾸덕한 치즈크림</span>
										</span>
									</a>
									</li>
								</c:forEach>
							</ul>
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

<html lang="ko"><head>
<meta charset="euc-kr">
<meta name="title" content="">
<meta name="description" content=" :: Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta property="og:title" content="마켓컬리 :: 내일의 장보기, 마켓컬리">
<meta property="og:description" content="Love Food, Love Life. 마켓컬리! 당일 수확 채소, 과일, 맛집 음식까지 내일 아침 문 앞에서 만나요!">
<meta property="og:image" content="https://res.kurly.com/images/marketkurly/logo/logo_sns_marketkurly.jpg">
<meta property="og:url" content="https://www.kurly.com/shop/goods/goods_view.php?goodsno=4415">
<meta property="og:type" content="website">
<meta property="og:site_name" content="www.kurly.com">
<meta name="keywords" content="다이어트, 식단, 닭가슴살, 요리, 치아바타, 레시피, 요리, 상차림, 다이어트음식, 이유식, 건강이유식">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta name="naver-site-verification" content="58ff7c242d41178131208256bfec0c2f93426a1d">
<meta name="facebook-domain-verification" content="tyur3wmoos7t63tpkb7zosur6p98m1">

<script src="https://connect.facebook.net/signals/config/526625657540055?v=2.9.48&amp;r=stable" async=""></script><script async="" src="//connect.facebook.net/en_US/fbevents.js"></script><script async="" src="https://cdn.branch.io/branch-latest.min.js"></script><script type="text/javascript" integrity="sha384-vYYnQ3LPdp/RkQjoKBTGSq0X5F73gXU3G2QopHaIfna0Ct1JRWzwrmEz115NzOta" crossorigin="anonymous" async="" src="https://cdn.amplitude.com/libs/amplitude-5.8.0-min.gz.js"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script src="https://js.sentry-cdn.com/c1f07ee4a3fd45d5aa2ef4983ca9ad43.min.js" crossorigin="anonymous"></script>
<script>
  var environment = 'production';

  Sentry.onLoad(function() {
    Sentry.init({
      environment: environment,
      denyUrls: [
        /localhost/i,
        /dev\.kurly\.com/i
      ],
      traceSampler: function(samplingContext) {
        if (
					samplingContext.location.pathname === '/shop/mypage/mypage_coupon.php'
				) {
					return 1;
				} else {
	        return 0.01;
				}
      },
    });
  });
</script>

<script src="/asset/js/common.bundle.js?ver=1.42.6"></script>
<script type="text/javascript" src="https://res.kurly.com/js/lib/jquery-1.10.2.min.js"></script>
<link rel="shortcut icon" href="https://res.kurly.com/images/marketkurly/logo/favicon_v2.png" type="image/x-icon">
<link rel="apple-touch-icon" sizes="57x57" href="https://res.kurly.com/images/marketkurly/logo/ico_57.png">
<link rel="apple-touch-icon" sizes="60x60" href="https://res.kurly.com/images/marketkurly/logo/ico_60.png">
<link rel="apple-touch-icon" sizes="72x72" href="https://res.kurly.com/images/marketkurly/logo/ico_72.png">
<link rel="apple-touch-icon" sizes="76x76" href="https://res.kurly.com/images/marketkurly/logo/ico_76.png">
<link rel="apple-touch-icon" sizes="114x114" href="https://res.kurly.com/images/marketkurly/logo/ico_114.png">
<link rel="apple-touch-icon" sizes="120x120" href="https://res.kurly.com/images/marketkurly/logo/ico_120.png">
<link rel="apple-touch-icon" sizes="144x144" href="https://res.kurly.com/images/marketkurly/logo/ico_144.png">
<link rel="apple-touch-icon" sizes="152x152" href="https://res.kurly.com/images/marketkurly/logo/ico_152.png">
<link rel="apple-touch-icon" sizes="180x180" href="https://res.kurly.com/images/marketkurly/logo/ico_180.png">
<link rel="icon" type="image/png" sizes="32x32" href="https://res.kurly.com/images/marketkurly/logo/ico_32.png">
<link rel="icon" type="image/png" sizes="192x192" href="https://res.kurly.com/images/marketkurly/logo/ico_192.png">
<link rel="icon" type="image/png" sizes="16x16" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">
<script>
sessionStorage.setItem('user_no', '24197373')
sessionStorage.setItem('apiDomainV2', '')

var jwtToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjYXJ0X2lkIjoiNmNhMzg1NWMtMjc2ZS00Yjg1LTllM2MtMTFiNzdlY2YyOWU0IiwiaXNfZ3Vlc3QiOmZhbHNlLCJ1dWlkIjoiNTYzODJhYTYtMWRjOS01OTBiLTg2ZjUtYzIwZjE4M2Q1ODA5IiwibV9ubyI6MjQxOTczNzMsIm1faWQiOiJqb3N1bmd5dW4iLCJsZXZlbCI6MjAsInN1YiI6IjU2MzgyYWE2LTFkYzktNTkwYi04NmY1LWMyMGYxODNkNTgwOSIsImlzcyI6Imh0dHA6Ly9ta3dlYi5hcGkua3VybHkuc2VydmljZXMvdjMvYXV0aC9sb2dpbiIsImlhdCI6MTYzNjQ0MzU0NywiZXhwIjoxNjM2NDQ3MTQ3LCJuYmYiOjE2MzY0NDM1NDcsImp0aSI6InNrSUNxZHo1N0J1aENWZXQifQ.e9uObvJ8qCAHuDDugcjFlkoLye7Zsc9K5oSNVUICUr8';
var apiDomain = 'https://api.kurly.com';
var GD_ISMEMBER = !!Number('1');
var checkIsApp = true;// 해당스크립트관련으로 앱체크공용변수추가 생성.앱에서 불필요한 호출제거
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="//t1.daumcdn.net/postcode/api/core/211103/1635999227231/211103.js"></script>
<script src="/shop/data/skin/designgj/thefarmers.js?ver=1.42.6"></script>
<script src="/shop/data/skin/designgj/common.js?ver=1.42.6"></script>
<script src="/shop/data/skin/designgj/polify.js?ver=1.42.6"></script>
<script src="/shop/data/skin/designgj/ui_v2.js?ver=1.42.6"></script>

<script src="//res.kurly.com/js/vue/xdomain.min.js" slave="https://api.kurly.com/xdomain?ver=1"></script>

<script src="//res.kurly.com/js/vue/es6-promise.min.js"></script>
<script src="//res.kurly.com/js/vue/es6-promise.auto.min.js"></script>

<script type="text/javascript" src="//res.kurly.com/js/vue/axios.min.js"></script>


<script src="//res.kurly.com/js/vue/vue.min.js"></script>
<script src="/common_js/axios.js?ver=1.42.6"></script>
<link rel="styleSheet" href="/shop/data/skin/designgj/normalize.css?ver=1.42.6">
<link rel="styleSheet" href="/shop/data/skin/designgj/section1.css?ver=1.42.6">
<link rel="styleSheet" href="/shop/data/skin/designgj/common.css?ver=1.42.6">

<script async="" src="https://www.googletagmanager.com/gtag/js?id=G-2K2GN0FFY0"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-2K2GN0FFY0', {
    'user_id' : '6ca3855c-276e-4b85-9e3c-11b77ecf29e4'
  });
</script>

<style>.async-hide { opacity: 0 !important} </style>
<script type="text/javascript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-90734988-1', 'auto');//'UA-90734988-1'
<!-- KM-201 장차석 : 구글 옵티마이즈&태그 메니저 -->
<!-- End KM-201 장차석 : 구글 옵티마이즈&태그 메니저 -->

var uuidCheck = "56382aa6-1dc9-590b-86f5-c20f183d5809";
var cookie_uuid = null;

function setCookieGa(cookieName, value){
	var exdays = 365;
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue +"; path=/;"
}

function getCookieGa(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

function deleteCookieGa(cookieName){
	var expireDate = new Date();
	//어제 날짜를 쿠키 소멸 날짜로 설정한다.
	expireDate.setDate( expireDate.getDate() - 1 );
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}


/* 로그인 */
if(uuidCheck !== "") {
	if( !getCookieGa('ga_uuid') ){
		setCookieGa('ga_uuid', uuidCheck);
	}else{
		if( getCookieGa('ga_uuid') !== uuidCheck){
			deleteCookieGa('ga_uuid');
			setCookieGa('ga_uuid', uuidCheck); /* 로그인 사용자쿠키 추가 */
		}
	}
	ga('set', 'userId', uuidCheck);
	ga('send', 'pageview',{'dimension1':  uuidCheck});
}else{
	ga('send', 'pageview');
}

//edge browser correspondence
var disableSelection = true;
$(function(){
    $('input, textarea').on('focus', function(){
        disableSelection = false;
    }).on('blur', function(){
        disableSelection = true;
    });
});
</script>
<script>
(function(e,t){var n=e.amplitude||{_q:[],_iq:{}};var r=t.createElement("script")
;r.type="text/javascript"
;r.integrity="sha384-vYYnQ3LPdp/RkQjoKBTGSq0X5F73gXU3G2QopHaIfna0Ct1JRWzwrmEz115NzOta"
;r.crossOrigin="anonymous";r.async=true
;r.src="https://cdn.amplitude.com/libs/amplitude-5.8.0-min.gz.js"
;r.onload=function(){if(!e.amplitude.runQueuedFunctions){
	console.log("[Amplitude] Error: could not load SDK")}}
;var i=t.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i)
;function s(e,t){e.prototype[t]=function(){
	this._q.push([t].concat(Array.prototype.slice.call(arguments,0)));return this}}
	var o=function(){this._q=[];return this}
	;var a=["add","append","clearAll","prepend","set","setOnce","unset"]
	;for(var u=0;u<a.length;u++){s(o,a[u])}n.Identify=o;var c=function(){this._q=[]
			;return this}
	;var l=["setProductId","setQuantity","setPrice","setRevenueType","setEventProperties"]
	;for(var p=0;p<l.length;p++){s(c,l[p])}n.Revenue=c
	;var d=["init","logEvent","logRevenue","setUserId","setUserProperties","setOptOut","setVersionName","setDomain","setDeviceId", "enableTracking", "setGlobalUserProperties","identify","clearUserProperties","setGroup","logRevenueV2","regenerateDeviceId","groupIdentify","onInit","logEventWithTimestamp","logEventWithGroups","setSessionId","resetSessionId"]
	;function v(e){function t(t){e[t]=function(){
		e._q.push([t].concat(Array.prototype.slice.call(arguments,0)))}}
		for(var n=0;n<d.length;n++){t(d[n])}}v(n);n.getInstance=function(e){
		e=(!e||e.length===0?"$default_instance":e).toLowerCase()
		;if(!n._iq.hasOwnProperty(e)){n._iq[e]={_q:[]};v(n._iq[e])}return n._iq[e]}
	;e.amplitude=n})(window,document);

var amplitudeUid = uuidCheck;
if(amplitudeUid === null){
	amplitudeUid = '6ca3855c-276e-4b85-9e3c-11b77ecf29e4';
}
var appResult = {
	is_release_build: false,
	is_sess: false, // 로그인 유무
  isSession: false,
	appCheck: false,
	device: 'pc',
  timestamp: parseInt("1636444575763", 10)
}

<!---->
appResult.is_sess = true;
appResult.isSession = true;
<!---->
<!---->
appResult.is_release_build = true;
<!---->

var webStatus = appResult;
/* appResult 명을 */

<!---->
amplitude.getInstance().init("65bebb55595beb82e78d5d1ae808702c", amplitudeUid);
<!---->
</script>

<script src="/common_js/kurlytracker/kurlytracker.js?ver=1.42.6"></script>
<script>
  // KM-4988 : amplitude userProperties 업데이트
  var userProperties = {
    membership_level: '웰컴',
    cust_no: Number('24197373'),
  };
  KurlyTracker.setUserProperties(userProperties);
</script>

<script>
  // KM-1238 branch
  (function(b,r,a,n,c,h,_,s,d,k){if(!b[n]||!b[n]._q){for(;s<_.length;)c(h,_[s++]);d=r.createElement(a);d.async=1;d.src="https://cdn.branch.io/branch-latest.min.js";k=r.getElementsByTagName(a)[0];k.parentNode.insertBefore(d,k);b[n]=h}})(window,document,"script","branch",function(b,r){b[r]=function(){b._q.push([r,arguments])}},{_q:[],_v:1},"addListener applyCode autoAppIndex banner closeBanner closeJourney creditHistory credits data deepview deepviewCta first getCode init link logout redeem referrals removeListener sendSMS setBranchViewData setIdentity track validateCode trackCommerceEvent logEvent disableTracking".split(" "), 0);
  var BRANCHKEY = 'key_live_meOgzIdffiVWvdquf7Orkacksxa2LneN';
  if(!webStatus.is_release_build){
    BRANCHKEY = 'key_test_joIkrHgomhL3qaEreXL5QdigzEn6Ucd4';
  }
  branch.init(BRANCHKEY);
  branch.setIdentity(uuidCheck);
  branch.track("pageview");
</script>



<script src="/common_js/kurlytracker/facebookPixel.js?ver=1.42.6"></script>

<script src="/common_js/kurlytracker/facebookConversions.js?ver=1.42.6"></script>

<script src="/asset/js/useKurly/kurlyAPI.bundle.js"></script>
<style>.swal2-popup.swal2-toast{flex-direction:column;align-items:stretch;width:auto;padding:1.25em;overflow-y:hidden;background:#fff;box-shadow:0 0 .625em #d9d9d9}.swal2-popup.swal2-toast .swal2-header{flex-direction:row;padding:0}.swal2-popup.swal2-toast .swal2-title{flex-grow:1;justify-content:flex-start;margin:0 .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-loading{justify-content:center}.swal2-popup.swal2-toast .swal2-input{height:2em;margin:.3125em auto;font-size:1em}.swal2-popup.swal2-toast .swal2-validation-message{font-size:1em}.swal2-popup.swal2-toast .swal2-footer{margin:.5em 0 0;padding:.5em 0 0;font-size:.8em}.swal2-popup.swal2-toast .swal2-close{position:static;width:.8em;height:.8em;line-height:.8}.swal2-popup.swal2-toast .swal2-content{justify-content:flex-start;margin:0 .625em;padding:0;font-size:1em;text-align:initial}.swal2-popup.swal2-toast .swal2-html-container{padding:.625em 0 0}.swal2-popup.swal2-toast .swal2-html-container:empty{padding:0}.swal2-popup.swal2-toast .swal2-icon{width:2em;min-width:2em;height:2em;margin:0 .5em 0 0}.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:1.8em;font-weight:700}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{font-size:.25em}}.swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line]{top:.875em;width:1.375em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:.3125em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:.3125em}.swal2-popup.swal2-toast .swal2-actions{flex:1;flex-basis:auto!important;align-self:stretch;width:auto;height:2.2em;height:auto;margin:0 .3125em;margin-top:.3125em;padding:0}.swal2-popup.swal2-toast .swal2-styled{margin:.125em .3125em;padding:.3125em .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-styled:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(100,150,200,.5)}.swal2-popup.swal2-toast .swal2-success{border-color:#a5dc86}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line]{position:absolute;width:1.6em;height:3em;transform:rotate(45deg);border-radius:50%}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.8em;left:-.5em;transform:rotate(-45deg);transform-origin:2em 2em;border-radius:4em 0 0 4em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.25em;left:.9375em;transform-origin:0 1.5em;border-radius:0 4em 4em 0}.swal2-popup.swal2-toast .swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-success .swal2-success-fix{top:0;left:.4375em;width:.4375em;height:2.6875em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line]{height:.3125em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=tip]{top:1.125em;left:.1875em;width:.75em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=long]{top:.9375em;right:.1875em;width:1.375em}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-toast-animate-success-line-tip .75s;animation:swal2-toast-animate-success-line-tip .75s}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-toast-animate-success-line-long .75s;animation:swal2-toast-animate-success-line-long .75s}.swal2-popup.swal2-toast.swal2-show{-webkit-animation:swal2-toast-show .5s;animation:swal2-toast-show .5s}.swal2-popup.swal2-toast.swal2-hide{-webkit-animation:swal2-toast-hide .1s forwards;animation:swal2-toast-hide .1s forwards}.swal2-container{display:flex;position:fixed;z-index:1060;top:0;right:0;bottom:0;left:0;flex-direction:row;align-items:center;justify-content:center;padding:.625em;overflow-x:hidden;transition:background-color .1s;-webkit-overflow-scrolling:touch}.swal2-container.swal2-backdrop-show,.swal2-container.swal2-noanimation{background:rgba(0,0,0,.4)}.swal2-container.swal2-backdrop-hide{background:0 0!important}.swal2-container.swal2-top{align-items:flex-start}.swal2-container.swal2-top-left,.swal2-container.swal2-top-start{align-items:flex-start;justify-content:flex-start}.swal2-container.swal2-top-end,.swal2-container.swal2-top-right{align-items:flex-start;justify-content:flex-end}.swal2-container.swal2-center{align-items:center}.swal2-container.swal2-center-left,.swal2-container.swal2-center-start{align-items:center;justify-content:flex-start}.swal2-container.swal2-center-end,.swal2-container.swal2-center-right{align-items:center;justify-content:flex-end}.swal2-container.swal2-bottom{align-items:flex-end}.swal2-container.swal2-bottom-left,.swal2-container.swal2-bottom-start{align-items:flex-end;justify-content:flex-start}.swal2-container.swal2-bottom-end,.swal2-container.swal2-bottom-right{align-items:flex-end;justify-content:flex-end}.swal2-container.swal2-bottom-end>:first-child,.swal2-container.swal2-bottom-left>:first-child,.swal2-container.swal2-bottom-right>:first-child,.swal2-container.swal2-bottom-start>:first-child,.swal2-container.swal2-bottom>:first-child{margin-top:auto}.swal2-container.swal2-grow-fullscreen>.swal2-modal{display:flex!important;flex:1;align-self:stretch;justify-content:center}.swal2-container.swal2-grow-row>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-grow-column{flex:1;flex-direction:column}.swal2-container.swal2-grow-column.swal2-bottom,.swal2-container.swal2-grow-column.swal2-center,.swal2-container.swal2-grow-column.swal2-top{align-items:center}.swal2-container.swal2-grow-column.swal2-bottom-left,.swal2-container.swal2-grow-column.swal2-bottom-start,.swal2-container.swal2-grow-column.swal2-center-left,.swal2-container.swal2-grow-column.swal2-center-start,.swal2-container.swal2-grow-column.swal2-top-left,.swal2-container.swal2-grow-column.swal2-top-start{align-items:flex-start}.swal2-container.swal2-grow-column.swal2-bottom-end,.swal2-container.swal2-grow-column.swal2-bottom-right,.swal2-container.swal2-grow-column.swal2-center-end,.swal2-container.swal2-grow-column.swal2-center-right,.swal2-container.swal2-grow-column.swal2-top-end,.swal2-container.swal2-grow-column.swal2-top-right{align-items:flex-end}.swal2-container.swal2-grow-column>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-no-transition{transition:none!important}.swal2-container:not(.swal2-top):not(.swal2-top-start):not(.swal2-top-end):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-start):not(.swal2-center-end):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-start):not(.swal2-bottom-end):not(.swal2-bottom-left):not(.swal2-bottom-right):not(.swal2-grow-fullscreen)>.swal2-modal{margin:auto}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-container .swal2-modal{margin:0!important}}.swal2-popup{display:none;position:relative;box-sizing:border-box;flex-direction:column;justify-content:center;width:32em;max-width:100%;padding:1.25em;border:none;border-radius:5px;background:#fff;font-family:inherit;font-size:1rem}.swal2-popup:focus{outline:0}.swal2-popup.swal2-loading{overflow-y:hidden}.swal2-header{display:flex;flex-direction:column;align-items:center;padding:0 1.8em}.swal2-title{position:relative;max-width:100%;margin:0 0 .4em;padding:0;color:#595959;font-size:1.875em;font-weight:600;text-align:center;text-transform:none;word-wrap:break-word}.swal2-actions{display:flex;z-index:1;box-sizing:border-box;flex-wrap:wrap;align-items:center;justify-content:center;width:100%;margin:1.25em auto 0;padding:0 1.6em}.swal2-actions:not(.swal2-loading) .swal2-styled[disabled]{opacity:.4}.swal2-actions:not(.swal2-loading) .swal2-styled:hover{background-image:linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.1))}.swal2-actions:not(.swal2-loading) .swal2-styled:active{background-image:linear-gradient(rgba(0,0,0,.2),rgba(0,0,0,.2))}.swal2-loader{display:none;align-items:center;justify-content:center;width:2.2em;height:2.2em;margin:0 1.875em;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border-width:.25em;border-style:solid;border-radius:100%;border-color:#2778c4 transparent #2778c4 transparent}.swal2-styled{margin:.3125em;padding:.625em 1.1em;box-shadow:none;font-weight:500}.swal2-styled:not([disabled]){cursor:pointer}.swal2-styled.swal2-confirm{border:0;border-radius:.25em;background:initial;background-color:#2778c4;color:#fff;font-size:1.0625em}.swal2-styled.swal2-deny{border:0;border-radius:.25em;background:initial;background-color:#d14529;color:#fff;font-size:1.0625em}.swal2-styled.swal2-cancel{border:0;border-radius:.25em;background:initial;background-color:#757575;color:#fff;font-size:1.0625em}.swal2-styled:focus{outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-styled::-moz-focus-inner{border:0}.swal2-footer{justify-content:center;margin:1.25em 0 0;padding:1em 0 0;border-top:1px solid #eee;color:#545454;font-size:1em}.swal2-timer-progress-bar-container{position:absolute;right:0;bottom:0;left:0;height:.25em;overflow:hidden;border-bottom-right-radius:5px;border-bottom-left-radius:5px}.swal2-timer-progress-bar{width:100%;height:.25em;background:rgba(0,0,0,.2)}.swal2-image{max-width:100%;margin:1.25em auto}.swal2-close{position:absolute;z-index:2;top:0;right:0;align-items:center;justify-content:center;width:1.2em;height:1.2em;padding:0;overflow:hidden;transition:color .1s ease-out;border:none;border-radius:5px;background:0 0;color:#ccc;font-family:serif;font-size:2.5em;line-height:1.2;cursor:pointer}.swal2-close:hover{transform:none;background:0 0;color:#f27474}.swal2-close:focus{outline:0;box-shadow:inset 0 0 0 3px rgba(100,150,200,.5)}.swal2-close::-moz-focus-inner{border:0}.swal2-content{z-index:1;justify-content:center;margin:0;padding:0 1.6em;color:#545454;font-size:1.125em;font-weight:400;line-height:normal;text-align:center;word-wrap:break-word}.swal2-checkbox,.swal2-file,.swal2-input,.swal2-radio,.swal2-select,.swal2-textarea{margin:1em auto}.swal2-file,.swal2-input,.swal2-textarea{box-sizing:border-box;width:100%;transition:border-color .3s,box-shadow .3s;border:1px solid #d9d9d9;border-radius:.1875em;background:inherit;box-shadow:inset 0 1px 1px rgba(0,0,0,.06);color:inherit;font-size:1.125em}.swal2-file.swal2-inputerror,.swal2-input.swal2-inputerror,.swal2-textarea.swal2-inputerror{border-color:#f27474!important;box-shadow:0 0 2px #f27474!important}.swal2-file:focus,.swal2-input:focus,.swal2-textarea:focus{border:1px solid #b4dbed;outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-file::-moz-placeholder,.swal2-input::-moz-placeholder,.swal2-textarea::-moz-placeholder{color:#ccc}.swal2-file:-ms-input-placeholder,.swal2-input:-ms-input-placeholder,.swal2-textarea:-ms-input-placeholder{color:#ccc}.swal2-file::placeholder,.swal2-input::placeholder,.swal2-textarea::placeholder{color:#ccc}.swal2-range{margin:1em auto;background:#fff}.swal2-range input{width:80%}.swal2-range output{width:20%;color:inherit;font-weight:600;text-align:center}.swal2-range input,.swal2-range output{height:2.625em;padding:0;font-size:1.125em;line-height:2.625em}.swal2-input{height:2.625em;padding:0 .75em}.swal2-input[type=number]{max-width:10em}.swal2-file{background:inherit;font-size:1.125em}.swal2-textarea{height:6.75em;padding:.75em}.swal2-select{min-width:50%;max-width:100%;padding:.375em .625em;background:inherit;color:inherit;font-size:1.125em}.swal2-checkbox,.swal2-radio{align-items:center;justify-content:center;background:#fff;color:inherit}.swal2-checkbox label,.swal2-radio label{margin:0 .6em;font-size:1.125em}.swal2-checkbox input,.swal2-radio input{margin:0 .4em}.swal2-input-label{display:flex;justify-content:center;margin:1em auto}.swal2-validation-message{align-items:center;justify-content:center;margin:0 -2.7em;padding:.625em;overflow:hidden;background:#f0f0f0;color:#666;font-size:1em;font-weight:300}.swal2-validation-message::before{content:"!";display:inline-block;width:1.5em;min-width:1.5em;height:1.5em;margin:0 .625em;border-radius:50%;background-color:#f27474;color:#fff;font-weight:600;line-height:1.5em;text-align:center}.swal2-icon{position:relative;box-sizing:content-box;justify-content:center;width:5em;height:5em;margin:1.25em auto 1.875em;border:.25em solid transparent;border-radius:50%;border-color:#000;font-family:inherit;line-height:5em;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:3.75em}.swal2-icon.swal2-error{border-color:#f27474;color:#f27474}.swal2-icon.swal2-error .swal2-x-mark{position:relative;flex-grow:1}.swal2-icon.swal2-error [class^=swal2-x-mark-line]{display:block;position:absolute;top:2.3125em;width:2.9375em;height:.3125em;border-radius:.125em;background-color:#f27474}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:1.0625em;transform:rotate(45deg)}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:1em;transform:rotate(-45deg)}.swal2-icon.swal2-error.swal2-icon-show{-webkit-animation:swal2-animate-error-icon .5s;animation:swal2-animate-error-icon .5s}.swal2-icon.swal2-error.swal2-icon-show .swal2-x-mark{-webkit-animation:swal2-animate-error-x-mark .5s;animation:swal2-animate-error-x-mark .5s}.swal2-icon.swal2-warning{border-color:#facea8;color:#f8bb86}.swal2-icon.swal2-info{border-color:#9de0f6;color:#3fc3ee}.swal2-icon.swal2-question{border-color:#c9dae1;color:#87adbd}.swal2-icon.swal2-success{border-color:#a5dc86;color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-circular-line]{position:absolute;width:3.75em;height:7.5em;transform:rotate(45deg);border-radius:50%}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.4375em;left:-2.0635em;transform:rotate(-45deg);transform-origin:3.75em 3.75em;border-radius:7.5em 0 0 7.5em}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.6875em;left:1.875em;transform:rotate(-45deg);transform-origin:0 3.75em;border-radius:0 7.5em 7.5em 0}.swal2-icon.swal2-success .swal2-success-ring{position:absolute;z-index:2;top:-.25em;left:-.25em;box-sizing:content-box;width:100%;height:100%;border:.25em solid rgba(165,220,134,.3);border-radius:50%}.swal2-icon.swal2-success .swal2-success-fix{position:absolute;z-index:1;top:.5em;left:1.625em;width:.4375em;height:5.625em;transform:rotate(-45deg)}.swal2-icon.swal2-success [class^=swal2-success-line]{display:block;position:absolute;z-index:2;height:.3125em;border-radius:.125em;background-color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-line][class$=tip]{top:2.875em;left:.8125em;width:1.5625em;transform:rotate(45deg)}.swal2-icon.swal2-success [class^=swal2-success-line][class$=long]{top:2.375em;right:.5em;width:2.9375em;transform:rotate(-45deg)}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-animate-success-line-tip .75s;animation:swal2-animate-success-line-tip .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-animate-success-line-long .75s;animation:swal2-animate-success-line-long .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-circular-line-right{-webkit-animation:swal2-rotate-success-circular-line 4.25s ease-in;animation:swal2-rotate-success-circular-line 4.25s ease-in}.swal2-progress-steps{flex-wrap:wrap;align-items:center;max-width:100%;margin:0 0 1.25em;padding:0;background:inherit;font-weight:600}.swal2-progress-steps li{display:inline-block;position:relative}.swal2-progress-steps .swal2-progress-step{z-index:20;flex-shrink:0;width:2em;height:2em;border-radius:2em;background:#2778c4;color:#fff;line-height:2em;text-align:center}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step{background:#2778c4}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step{background:#add8e6;color:#fff}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step-line{background:#add8e6}.swal2-progress-steps .swal2-progress-step-line{z-index:10;flex-shrink:0;width:2.5em;height:.4em;margin:0 -1px;background:#2778c4}[class^=swal2]{-webkit-tap-highlight-color:transparent}.swal2-show{-webkit-animation:swal2-show .3s;animation:swal2-show .3s}.swal2-hide{-webkit-animation:swal2-hide .15s forwards;animation:swal2-hide .15s forwards}.swal2-noanimation{transition:none}.swal2-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}.swal2-rtl .swal2-close{right:auto;left:0}.swal2-rtl .swal2-timer-progress-bar{right:0;left:auto}@supports (-ms-accelerator:true){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@-webkit-keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@-webkit-keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@-webkit-keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@-webkit-keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@-webkit-keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@-webkit-keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@-webkit-keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@-webkit-keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@-webkit-keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@-webkit-keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@-webkit-keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@-webkit-keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}@keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow:hidden}body.swal2-height-auto{height:auto!important}body.swal2-no-backdrop .swal2-container{top:auto;right:auto;bottom:auto;left:auto;max-width:calc(100% - .625em * 2);background-color:transparent!important}body.swal2-no-backdrop .swal2-container>.swal2-modal{box-shadow:0 0 10px rgba(0,0,0,.4)}body.swal2-no-backdrop .swal2-container.swal2-top{top:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-top-left,body.swal2-no-backdrop .swal2-container.swal2-top-start{top:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-top-end,body.swal2-no-backdrop .swal2-container.swal2-top-right{top:0;right:0}body.swal2-no-backdrop .swal2-container.swal2-center{top:50%;left:50%;transform:translate(-50%,-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-left,body.swal2-no-backdrop .swal2-container.swal2-center-start{top:50%;left:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-end,body.swal2-no-backdrop .swal2-container.swal2-center-right{top:50%;right:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom{bottom:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom-left,body.swal2-no-backdrop .swal2-container.swal2-bottom-start{bottom:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-bottom-end,body.swal2-no-backdrop .swal2-container.swal2-bottom-right{right:0;bottom:0}@media print{body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow-y:scroll!important}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)>[aria-hidden=true]{display:none}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) .swal2-container{position:static!important}}body.swal2-toast-shown .swal2-container{background-color:transparent}body.swal2-toast-shown .swal2-container.swal2-top{top:0;right:auto;bottom:auto;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-top-end,body.swal2-toast-shown .swal2-container.swal2-top-right{top:0;right:0;bottom:auto;left:auto}body.swal2-toast-shown .swal2-container.swal2-top-left,body.swal2-toast-shown .swal2-container.swal2-top-start{top:0;right:auto;bottom:auto;left:0}body.swal2-toast-shown .swal2-container.swal2-center-left,body.swal2-toast-shown .swal2-container.swal2-center-start{top:50%;right:auto;bottom:auto;left:0;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-center{top:50%;right:auto;bottom:auto;left:50%;transform:translate(-50%,-50%)}body.swal2-toast-shown .swal2-container.swal2-center-end,body.swal2-toast-shown .swal2-container.swal2-center-right{top:50%;right:0;bottom:auto;left:auto;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-left,body.swal2-toast-shown .swal2-container.swal2-bottom-start{top:auto;right:auto;bottom:0;left:0}body.swal2-toast-shown .swal2-container.swal2-bottom{top:auto;right:auto;bottom:0;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-end,body.swal2-toast-shown .swal2-container.swal2-bottom-right{top:auto;right:0;bottom:0;left:auto}</style></head>
<body class="goods-goods_view" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection" style="">


<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<div id="wrap" class="">
<div id="pos_scroll"></div>
<div id="container">
<div id="header"><script>
  // ie10 이하 페이지 이동
  var ieCheckAgent = navigator.userAgent.toLowerCase();
  if ( (navigator.appName === 'Netscape' && navigator.userAgent.search('Trident') !== -1) || (ieCheckAgent.indexOf("msie") !== -1) ) {
    if(navigator.appName !== 'Netscape'){
      location.href = "/shop/event/browserUpdate.php";
    }
  }
</script>

<div class="bnr_header bnr_top_friend" id="top-message">


<div id="topBanner">
<a href="https://www.kurly.com/shop/main/html.php?htmid=event/kurly.htm&amp;name=friend">
친구 초대하면 친구도 나도 적립금 <b>5천원!</b><img src="https://res.kurly.com/pc/ico/1908/ico_arrow_333_84x84.png" class="bnr_arr">
</a>
<div class="bnr_top">
<div class="inner_top_close">
<button id="top-message-close" class="btn_top_bnr">가입하고 혜택받기</button>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
      $("#top-message-close").on("click",function(){
        setCookie('top_msg_banner2','set_cookie',1)
      });
      if(getCookie('top_msg_banner2') == 'set_cookie'){
        $("#top-message").hide()
      }else{
        $("#top-message").show() ;
      }
    });

    function setCookie(cookieName, value, exdays){
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
      var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
      document.cookie = cookieName + "=" + cookieValue +"; path=/;"
    }

    function getCookie(cookieName) {
      cookieName = cookieName + '=';
      var cookieData = document.cookie;
      var start = cookieData.indexOf(cookieName);
      var cookieValue = '';
      if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
      }
      return unescape(cookieValue);
    }
  </script>

<div id="userMenu"><ul class="list_menu"><!----> <!----> <li class="menu menu_user"><a class="link_menu grade_comm" onclick="KurlyTrackerLink('/shop/mypage/mypage_orderlist.php', 'select_my_kurly_tab')"><span class="ico_grade grade6">웰컴</span> <span class="txt"><span class="name">조성윤</span><span class="sir">님</span></span> <span><img src="https://res.kurly.com/kurly/ico/2021/new_badge_28_28.png" alt="New" class="ico_new"></span></a> <ul class="sub"><li><a href="/shop/mypage/mypage_orderlist.php">주문 내역</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_gift.php', 'select_my_kurly_gift_list')">선물 내역</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/destination/list.php', 'select_shipping_address_list')">배송지 관리</a></li> <li><a href="/shop/mypage/mypage_review.php">상품 후기</a></li> <li><a>상품 문의</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_emoney.php', 'select_my_kurly_point_history', {selection_type: 'dropdown'})">적립금</a> <!----></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_coupon.php', 'select_my_kurly_coupon_list', {selection_type: 'dropdown'})">쿠폰</a> <img src="https://res.kurly.com/kurly/ico/2021/new_badge_28_28.png" alt="New" class="ico_new"></li> <li><a href="/shop/member/myinfo.php">개인 정보 수정</a></li> <li><a href="/shop/member/logout.php">로그아웃</a></li></ul></li> <li class="menu lst"><a href="/shop/board/list.php?id=notice" class="link_menu">고객센터</a> <ul class="sub"><li><a href="#none" onclick="KurlyTrackerLink('/shop/board/list.php?id=notice', 'select_my_kurly_notice_list')">공지사항</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/service/faq.php', 'select_my_kurly_frequently_qna')">자주하는 질문</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_qna.php', 'select_my_kurly_personal_inquiry_history')">1:1 문의</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')">대량주문 문의</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')">상품 제안</a></li> <li><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')">에코포장 피드백</a></li></ul></li></ul></div>
<script src="/common_js/usermenu_v1.js?ver=1.42.6"></script>
<script>
    $(document).ready(function(){

      userMenu.loginCheck = true;
      userMenu.userInfo ={
        userGrade : '6',
        userGradeName : '웰컴',
        memberName : '조성윤'
      }

      userMenu.update();

      // KMF-587 대량주문관련 개선 요청: 추후제거
      if($('#kurlyMain').length > 0) {
        $('#userMenu .list_menu .lst .sub').addClass('on');
        $('#userMenu .menu').hover(function(){
          if($('#userMenu .menu .sub').hasClass('on')){
            $('#userMenu .menu .on').removeClass('on');
          }
        });
      }
    });
  </script>

<style>
  #headerLogo{position:relative;width:1050px;height:63px;margin:0 auto}
  #headerLogo .bnr_delivery{position:absolute;left:-1px;top:-28px;margin:auto;height:22px}
  #headerLogo .logo{position:absolute;left:50%;bottom:6px;width:200px;height:79px;margin-left:-100px}
  #headerLogo .logo img{display:block;width:103px;height:79px;margin:0 auto}
  #headerLogo .logo #gnbLogoContainer {margin:0 auto}
  #gnb.gnb_stop{position:fixed;z-index:300;left:0;top:0;width:100%}
  #gnb .gnb_kurly{position:relative;z-index:300;min-width:1050px;background-color:#fff;font-family:'Noto Sans';letter-spacing:-0.3px}
  #gnb .gnb_kurly:after{content:"";position:absolute;z-index:299;left:0;top:56px;width:100%;height:9px;background:url(https://res.kurly.com/pc/service/common/1902/bg_1x9.png) repeat-x 0 100%}
  #gnb .inner_gnbkurly{position:relative;width:1050px;height:56px;margin:0 auto}
  /* 검색창 */
  #gnb .gnb_search{position:absolute;right:108px;top:10px;width:242px}
  #gnb .gnb_search .inp_search{width:242px;height:36px;padding:0 60px 0 14px;border:1px solid #f7f7f6;border-radius:18px;background-color:#f7f7f7;font-family: 'Noto Sans';font-weight:400;font-size:12px;color:#666;line-height:16px;outline:none}
  #gnb .gnb_search .inp_search.focus{background-color:#fff;color:#333}
  #gnb .gnb_search .btn_search{position:absolute;right:5px;top:3px;width:30px;height:30px}
  /* 장바구니 */
  #gnb .cart_count{position:absolute;right:-5px;top:10px}
  #gnb .cart_count .inner_cartcount{text-align:center;font-weight:400}
  #gnb .cart_count .btn_cart{display:block;width:36px;height:36px;background:url(https://res.kurly.com/pc/service/common/2011/ico_cart.svg) no-repeat 50% 50%}
  #gnb .cart_count .btn_cart:hover{background:url(https://res.kurly.com/pc/service/common/2011/ico_cart_on.svg?v=1) no-repeat 50% 50%}
  #gnb .cart_count .num{display:none;position:absolute;left:19px;top:-1px;min-width:20px;height:20px;padding:0 5px;border:2px solid #fff;border-radius:10px;background-color:#5f0080;font-size:9px;color:#fff;line-height:15px;text-align:center;white-space:nowrap}
  #gnb .cart_count img{display:block;width:36px;height:36px;margin:0 auto}
  #gnb .cart_count .msg_cart{display:none;position:absolute;right:-7px;top:61px;width:348px;border:1px solid #ddd;background-color:#fff;/* opacity:0; */}
  #gnb .cart_count .inner_msgcart{display:block;overflow:hidden;padding:20px 0 20px 20px}
  #gnb .cart_count .msg_cart .thumb{float:left;width:46px;height:60px}
  #gnb .cart_count .msg_cart .desc{float:left;width:260px;padding:8px 0 0 20px;font-weight:700;font-size:14px;line-height:21px}
  #gnb .cart_count .msg_cart .desc.add{padding-top:0;margin-top:-5px;}
  #gnb .cart_count .msg_cart .tit{display:block;overflow:hidden;width:100%;color:#999;white-space:nowrap;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .name{overflow:hidden;float:left;max-width:178px;text-overflow:ellipsis}
  #gnb .cart_count .msg_cart .txt{display:block;padding-top:3px;color:#333}
  #gnb .cart_count .msg_cart .point{position:absolute;right:13px;top:-14px;width:20px;height:14px;background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point.png) no-repeat 0 0}
  #gnb .cart_count .msg_cart .repeat{display:none}
  #gnb .cart_count .msg_cart .add .repeat{display:block}
  /* GNB메인 */
  #gnb .gnb_main{overflow:hidden;width:1050px;margin:0 auto}
  #gnb .gnb_main .gnb{float:left;width:100%}
  #gnb .gnb_main .gnb li{float:left}
  #gnb .gnb_main .gnb .lst{background:none}
  #gnb .gnb_main .gnb a{overflow:hidden;float:left;width:124px;height:55px;padding:16px 0 0;font-size:16px;color:#333;line-height:20px;text-align:center}
  #gnb .gnb_main .gnb a .txt{font-weight:700}
  #gnb .gnb_main .gnb a:hover,
  #gnb .gnb_main .gnb a.on{font-weight:700;color:#5f0080}
  #gnb .gnb_main .gnb a:hover .txt{border-bottom:1px solid #5f0080}
  #gnb .gnb_main .menu1 a{width:168px}
  #gnb .gnb_main .menu1 .ico{float:left;width:16px;height:14px;margin:5px 14px 0 0;background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off.png) no-repeat}
  #gnb .gnb_main .menu1 a.on .ico,
  #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all.png) no-repeat 0 0}
  #gnb .gnb_main .menu1 a.on .txt,
  #gnb .gnb_main .menu1 a:hover .txt,
  #gnb .gnb_main .menu1 .txt{float:left;font-weight:700;border-bottom:0}
  #gnb .gnb_main .menu3 a{width:116px}
  #gnb .gnb_main .lst a{width:116px}
  /* GNB서브 */
  #gnb .gnb_sub{display:none;overflow:hidden;position:absolute;z-index:301;left:0;top:55px;width:213px;padding-top:1px}
  #gnb .gnb_sub .inner_sub{width:100%;border:1px solid #ddd;background:url(https://res.kurly.com/pc/service/common/1908/bg_gnb_sub_v3.png) repeat-y 0 0}
  #gnb .size_over{overflow-x:hidden;overflow-y:auto}
  #gnb .gnb_sub .gnb_menu{width:219px}
  #gnb .gnb_sub .gnb_menu li{width:100%;text-align:left}
  #gnb .gnb_sub .gnb_menu li:first-child{padding-top:0}
  #gnb .gnb_sub .menu{display:block;overflow:hidden;width:100%;height:40px;padding:8px 0 0 14px;cursor:pointer}
  #gnb .gnb_sub .gnb_menu li:first-child .menu{height:39px;padding-top:7px}
  #gnb .gnb_sub .current .menu{background:#f7f7f7}
  #gnb .gnb_sub .current .txt,
  #gnb .gnb_sub .menu.on.off:hover .txt,
  #gnb .gnb_sub .menu.on .txt{font-weight:700;color:#5f0080}
  #gnb .gnb_sub .ico{float:left;width:24px;height:24px}
  #gnb .gnb_sub .ico img{width:24px;height:24px}
  #gnb .gnb_sub .ico .ico_off{display:block}
  #gnb .gnb_sub .ico .ico_on{display:none}
  #gnb .gnb_sub .current .ico_off,
  #gnb .gnb_sub .menu.on .ico_off,
  #gnb .gnb_sub .menu:hover .ico_off{display:none}
  #gnb .gnb_sub .current .ico_on,
  #gnb .gnb_sub .menu.on .ico_on,
  #gnb .gnb_sub .menu:hover .ico_on{display:block}
  #gnb .gnb_sub .ico_arrow{display:none;float:right;width:16px;height:17px;padding:6px 9px 0 0}
  #gnb .gnb_sub .ico_arrow img{width:7px;height:11px}
  #gnb .gnb_sub .current .ico_arrow{display:block}
  #gnb .gnb_sub .txt{float:left;padding:0 4px 0 10px;font-weight:400;font-size:14px;color:#333;line-height:22px;white-space:nowrap}
  #gnb .gnb_sub .ico_new{overflow:hidden;float:left;width:14px;height:14px;margin-top:5px;background-position:50% 50%;background-repeat:no-repeat;background-size:14px 14px;font-size:0;line-height:0;text-indent:-9999px}
  #gnb .gnb_sub .sub_menu{position:absolute;z-index:0;left:200px;top:0;width:248px;height:100%;padding:0 0 0 20px;background:url(https://res.kurly.com/images/common/bg_1_1.gif) repeat 0 0;opacity:0;transition:opacity 0.2s}
  #gnb .gnb_sub .current .sub_menu{z-index:1;opacity:1;transition:opacity 0.5s}
  #gnb .gnb_sub .sub_menu li:first-child{padding-top:11px}
  #gnb .gnb_sub .sub_menu .sub{display:block;overflow:hidden;height:40px;padding-left:20px;font-size:14px;color:#333;line-height:18px;cursor:pointer}
  #gnb .gnb_sub .sub_menu .sub:hover .name{border-bottom:1px solid #5f0080;font-weight:700;color:#5f0080}
  #gnb .gnb_sub .sub_menu .sub.on{font-weight:700;color:#5f0080}
  #gnb .gnb_sub .recommend{overflow:hidden;width:529px;padding:21px 0 0 40px}
  #gnb .gnb_sub .recommend li{float:left;width:120px;height:130px;padding:0 10px 0 0}
  #gnb .gnb_sub .recommend li:first-child{padding-top:0}
  #gnb .gnb_sub .recommend .sub{display:block;overflow:hidden;width:120px;height:130px;padding:0;cursor:pointer}
  #gnb .gnb_sub .recommend .thumb{display:block;width:110px;height:83.4px;margin-bottom:8px;background-position:50% 50%;background-repeat:no-repeat;background-size:cover}
  #gnb .gnb_sub .recommend .thumb img{width:110px;height:84px}
  #gnb .gnb_sub .recommend .name{font-size:14px;line-height:18px}
  #gnb .btn_location{overflow:hidden;position:absolute;right:51px;top:10px;width:36px;height:36px;border:0 none;background:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting_done.svg) no-repeat 50% 50%;font-size:0;text-indent:-9999px}
  #gnb .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_setting.svg?ver=1)}
  #gnb .layer_location{display:none;position:absolute;z-index:300;right:41px;top:56px;width:315px;padding:18px 18px 19px 20px;border:1px solid #ddd;background-color:#fff}
  #gnb .layer_location:after{content:"";position:absolute;right:10px;top:-50px;width:36px;height:50px;background:url(https://res.kurly.com/pc/ico/2011/ico_point_up_18x12.svg) no-repeat 50% 100%}
  #gnb .layer_location *{font-weight:700;font-size:16px;color:#333;line-height:24px;letter-spacing:-0.3px}
  #gnb .layer_location .delivery{display:block;padding-top:8px;font-size:14px;line-height:20px}
  #gnb .layer_location .star{color:#5f0080}
  #gnb .layer_location .regular{color:#666}
  #gnb .layer_location .none{color:#999}
  #gnb .layer_location .btn{display:block;width:100%;height:36px;margin-top:17px;padding-bottom:2px;border-radius:3px;font-size:12px;line-height:32px;letter-spacing:0;text-align:center}
  #gnb .layer_location a.btn{padding-top:0}
  #gnb .layer_location .btn.default{border:1px solid #5f0080;background-color:#fff;color:#5f0080}
  #gnb .layer_location .btn.active{border:1px solid #5f0081;background-color:#5f0080;color:#fff}
  #gnb .layer_location .btn .ico{display:inline-block;width:20px;height:20px;margin:6px 0 0 -6px;background:url(https://res.kurly.com/pc/ico/2008/ico_search_40x40.png) no-repeat 50% 50%;background-size:20px 20px;vertical-align:top}
  #gnb .layer_location .group_button{display:block;overflow:hidden}
  #gnb .layer_location .double .default{float:left;width:110px}
  #gnb .layer_location .double .active{float:right;width:159px}
  #gnb .layer_location .double .btn {margin-left: 0; margin-right:0;}
  #gnb .layer_location .emph{color:#5f0080}
  #gnb .location_set:hover .btn_location.on{background-image:url(https://res.kurly.com/pc/ico/2010/ico_delivery_setting_on.svg)}
  #gnb .location_set.show .layer_location,
  #gnb .location_set:hover .layer_location{display:block}
  #gnb .location_set .btn_location.off,
  #gnb .location_set .btn_location.off:hover{background-image:url(https://res.kurly.com/pc/ico/2008/ico_delivery_off.svg?ver=1);cursor:default}
  #gnb .location_set.off .layer_location,
  #gnb .location_set.off:hover .layer_location{display:none}
  /* 오류 */
  #gnb .layer_location .error .txt{display:block;color:#333}
  @media
  only screen and (-webkit-min-device-pixel-ratio: 1.5),
  only screen and (min-device-pixel-ratio: 1.5),
  only screen and (min-resolution: 1.5dppx) {
    #gnb .gnb_sub .ico_new{background:url(https://res.kurly.com/pc/ico/1808/ico_new_gnb_16x16.png) no-repeat 0 0;background-size:14px 14px}
    #gnb .cart_count .msg_cart .point{background:url(https://res.kurly.com/pc/ico/1903/ico_layer_point_x2.png) no-repeat 0 0;background-size:20px 14px}
    #gnb .gnb_main .menu1 .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_off_x2.png) no-repeat 0 0;background-size:16px 14px}
    #gnb .gnb_main .menu1 a.on .ico,
    #gnb .gnb_main .menu1 a:hover .ico{background:url(https://res.kurly.com/pc/service/common/1908/ico_gnb_all_x2.png) no-repeat 0 0;background-size:16px 14px}
  }
  .gnb_search .init{position:relative}
  .gnb_search .init .btn_delete{overflow:hidden;position:absolute;left:170px;top:-36px;width:36px;height:36px;border:0 none;background:url(https://res.kurly.com/pc/ico/2010/ico_search_del.svg) no-repeat 50% 50%;background-size:12px 12px;font-size:0;line-height:0;text-indent:-9999px;opacity:0}
  .gnb_search .init .btn_delete.on{opacity:1}
</style>
<div id="headerLogo" class="layout-wrapper">
<h1 class="logo">
<a href="/" class="link_main">
<span id="gnbLogoContainer"></span>
<img src="https://res.kurly.com/images/marketkurly/logo/logo_x2.png" alt="마켓컬리 로고">
</a>
</h1>
<a href="/shop/board/view.php?id=notice&amp;no=64" onclick="ga('send','event','etc','main_gif_btn_click');" class="bnr_delivery">
<img src="https://res.kurly.com/pc/service/common/2011/delivery_210801.png" alt="샛별, 택배 배송안내" width="121" height="22">
</a>
</div>
<div id="gnb" class="gnb_stop">
<h2 class="screen_out">메뉴</h2>
<div id="gnbMenu" class="gnb_kurly"><div class="inner_gnbkurly"><div class="gnb_main"><ul class="gnb"><li class="menu1"><a href="#none"><span class="ico"></span><span class="txt">전체 카테고리</span></a></li> <li class="menu2"><a href="/shop/goods/goods_list.php?category=038" class="link new "><span class="txt">신상품</span></a></li> <li class="menu3"><a href="/shop/goods/goods_list.php?category=029" class="link best "><span class="txt">베스트</span></a></li> <li class="menu4"><a href="/shop/goods/goods_list.php?list=sale" class="link bargain "><span class="txt">알뜰쇼핑</span></a></li> <li class="lst"><a href="/shop/goods/event.php?&amp;" class="link event "><span class="txt">특가/혜택</span></a></li></ul> <div id="side_search" class="gnb_search"><form action="/shop/goods/goods_search.php?&amp;" onsubmit="return searchTracking(this)"><input type="hidden" name="searched" value="Y"> <input type="hidden" name="log" value="1"> <input type="hidden" name="skey" value="all"> <input type="hidden" name="hid_pr_text" value=""> <input type="hidden" name="hid_link_url" value=""> <input type="hidden" id="edit" name="edit" value=""> <input name="sword" type="text" id="sword" value="" required="required" label="검색어" placeholder="검색어를 입력해주세요." class="inp_search"> <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search"> <div class="init"><button type="button" id="searchInit" class="btn_delete">검색어 삭제하기</button></div></form></div> <div class="cart_count"><div class="inner_cartcount"><a href="/shop/goods/goods_cart.php" class="btn_cart"><span class="screen_out">장바구니</span> <span id="cart_item_count" class="num realtime_cartcount" style="display: inline;">3</span></a></div> <div id="addMsgCart" class="msg_cart"><span class="point"></span> <div class="inner_msgcart"><img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb"> <p id="msgReaddedItem" class="desc"><span class="tit"></span> <span class="txt">
장바구니에 상품을 담았습니다.
<span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span></span></p></div></div></div> <div class="location_set"><button type="button" class="btn_location on">배송지 설정하기</button> <div class="layer_location"><div class="address">        <div class="address">        <p class="addr">제주특별자치도 제주시 첨단로 242 ASDF</p>        <span class="delivery none">배송불가</span>        <a href="#none" class="btn default modifyAddress">배송지 변경</a>        </div>      </div></div></div></div> <div class="gnb_sub"><div class="inner_sub"><ul data-default="219" data-min="219" data-max="731" class="gnb_menu size_over" style="height: 652.5px;"><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">채소</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">친환경</span></a> <!----></li><li><a class="sub"><span class="name">고구마·감자·당근</span></a> <!----></li><li><a class="sub"><span class="name">시금치·쌈채소·나물</span></a> <!----></li><li><a class="sub"><span class="name">브로콜리·파프리카·양배추</span></a> <!----></li><li><a class="sub"><span class="name">양파·대파·마늘·배추</span></a> <!----></li><li><a class="sub"><span class="name">오이·호박·고추</span></a> <!----></li><li><a class="sub"><span class="name">냉동·이색·간편채소</span></a> <!----></li><li><a class="sub"><span class="name">콩나물·버섯</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_fruit_active_pc@2x.1568684150.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">과일·견과·쌀</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">친환경</span></a> <!----></li><li><a class="sub"><span class="name">제철과일</span></a> <!----></li><li><a class="sub"><span class="name">국산과일</span></a> <!----></li><li><a class="sub"><span class="name">수입과일</span></a> <!----></li><li><a class="sub"><span class="name">간편과일</span></a> <!----></li><li><a class="sub"><span class="name">냉동·건과일</span></a> <!----></li><li><a class="sub"><span class="name">견과류</span></a> <!----></li><li><a class="sub"><span class="name">쌀·잡곡</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_inactive_pc@2x.1568684352.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_seafood_active_pc@2x.1568684353.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">수산·해산·건어물</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">제철수산</span></a> <!----></li><li><a class="sub"><span class="name">생선류</span></a> <!----></li><li><a class="sub"><span class="name">굴비·반건류</span></a> <!----></li><li><a class="sub"><span class="name">오징어·낙지·문어</span></a> <!----></li><li><a class="sub"><span class="name">새우·게·랍스터</span></a> <!----></li><li><a class="sub"><span class="name">해산물·조개류</span></a> <!----></li><li><a class="sub"><span class="name">수산가공품</span></a> <!----></li><li><a class="sub"><span class="name">김·미역·해조류</span></a> <!----></li><li><a class="sub"><span class="name">건어물·다시팩</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_meat_inactive_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_meat_active_pc@2x.1568684452.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">정육·계란</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">국내산 소고기</span></a> <!----></li><li><a class="sub"><span class="name">수입산 소고기</span></a> <!----></li><li><a class="sub"><span class="name">돼지고기</span></a> <!----></li><li><a class="sub"><span class="name">계란류</span></a> <!----></li><li><a class="sub"><span class="name">닭·오리고기</span></a> <!----></li><li><a class="sub"><span class="name">양념육·돈까스</span></a> <!----></li><li><a class="sub"><span class="name">양고기</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_side_inactive_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_side_active_pc@2x.1572243579.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">국·반찬·메인요리</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">국·탕·찌개</span></a> <!----></li><li><a class="sub"><span class="name">밀키트·메인요리</span></a> <!----></li><li><a class="sub"><span class="name">밑반찬</span></a> <!----></li><li><a class="sub"><span class="name">김치·젓갈·장류</span></a> <!----></li><li><a class="sub"><span class="name">두부·어묵·부침개</span></a> <!----></li><li><a class="sub"><span class="name">베이컨·햄·통조림</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_inactive_pc@2x.1572243542.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_convenient_active_pc@2x.1572243543.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">샐러드·간편식</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">샐러드·닭가슴살</span></a> <!----></li><li><a class="sub"><span class="name">도시락·밥류</span></a> <!----></li><li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li><li><a class="sub"><span class="name">떡볶이·튀김·순대</span></a> <!----></li><li><a class="sub"><span class="name">피자·핫도그·만두</span></a> <!----></li><li><a class="sub"><span class="name">폭립·떡갈비·안주</span></a> <!----></li><li><a class="sub"><span class="name">죽·스프·카레</span></a> <!----></li><li><a class="sub"><span class="name">선식·시리얼</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_inactive_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_sauce_active_pc@2x.1572243594.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">면·양념·오일</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">파스타·면류</span></a> <!----></li><li><a class="sub"><span class="name">식초·소스·드레싱</span></a> <!----></li><li><a class="sub"><span class="name">양념·액젓·장류</span></a> <!----></li><li><a class="sub"><span class="name">식용유·참기름·오일</span></a> <!----></li><li><a class="sub"><span class="name">소금·설탕·향신료</span></a> <!----></li><li><a class="sub"><span class="name">밀가루·가루·믹스</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_inactive_pc@2x.1572243615.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_snacks_active_pc@2x.1572243616.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">생수·음료·우유·커피</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">생수·탄산수</span></a> <!----></li><li><a class="sub"><span class="name">음료·주스</span></a> <!----></li><li><a class="sub"><span class="name">우유·두유·요거트</span></a> <!----></li><li><a class="sub"><span class="name">커피</span></a> <!----></li><li><a class="sub"><span class="name">차</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_inactive_pc.1610074008.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_cookie_active_pc.1610074008.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">간식·과자·떡</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">과자·스낵·쿠키</span></a> <!----></li><li><a class="sub"><span class="name">초콜릿·젤리·캔디</span></a> <!----></li><li><a class="sub"><span class="name">떡·한과</span></a> <!----></li><li><a class="sub"><span class="name">아이스크림</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_deli_inactive_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_deli_active_pc@2x.1568687352.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이커리·치즈·델리</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">식빵·빵류</span></a> <!----></li><li><a class="sub"><span class="name">잼·버터·스프레드</span></a> <!----></li><li><a class="sub"><span class="name">케이크·파이·디저트</span></a> <!----></li><li><a class="sub"><span class="name">치즈</span></a> <!----></li><li><a class="sub"><span class="name">델리</span></a> <!----></li><li><a class="sub"><span class="name">올리브·피클</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_health_inactive_pc@2x.1574645922.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_health_active_pc@2x.1574645923.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">건강식품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">영양제</span></a> <!----></li><li><a class="sub"><span class="name">유산균</span></a> <!----></li><li><a class="sub"><span class="name">홍삼·인삼·꿀</span></a> <!----></li><li><a class="sub"><span class="name">건강즙·건강음료</span></a> <!----></li><li><a class="sub"><span class="name">건강분말·건강환</span></a> <!----></li><li><a class="sub"><span class="name">다이어트·이너뷰티</span></a> <!----></li><li><a class="sub"><span class="name">유아동</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_living_inactive_pc@2x.1588814089.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_living_active_pc@2x.1588814090.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">생활용품·리빙·캠핑</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">휴지·티슈</span></a> <!----></li><li><a class="sub"><span class="name">여성·위생용품</span></a> <!----></li><li><a class="sub"><span class="name">세제·청소용품</span></a> <!----></li><li><a class="sub"><span class="name">화훼·인테리어소품</span></a> <!----></li><li><a class="sub"><span class="name">의약외품·마스크</span></a> <!----></li><li><a class="sub"><span class="name">생활잡화·문구</span></a> <!----></li><li><a class="sub"><span class="name">캠핑용품</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_inactive_pc.1618488987.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_beauty_active_pc.1618488987.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">스킨케어·메이크업</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">스킨·미스트·패드</span></a> <!----></li><li><a class="sub"><span class="name">에센스·앰플·로션</span></a> <!----></li><li><a class="sub"><span class="name">크림·오일</span></a> <!----></li><li><a class="sub"><span class="name">클렌징</span></a> <!----></li><li><a class="sub"><span class="name">마스크팩</span></a> <!----></li><li><a class="sub"><span class="name">선케어</span></a> <!----></li><li><a class="sub"><span class="name">메이크업</span></a> <!----></li><li><a class="sub"><span class="name">맨즈케어</span></a> <!----></li><li><a class="sub"><span class="name">뷰티소품·기기</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_body_inactive_pc.1618528534.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_body_active_pc.1618528534.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">헤어·바디·구강</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">구강·면도</span></a> <!----></li><li><a class="sub"><span class="name">샴푸·컨디셔너</span></a> <!----></li><li><a class="sub"><span class="name">트리트먼트·팩</span></a> <!----></li><li><a class="sub"><span class="name">헤어에센스·염모</span></a> <!----></li><li><a class="sub"><span class="name">바디워시·스크럽</span></a> <!----></li><li><a class="sub"><span class="name">바디로션·크림</span></a> <!----></li><li><a class="sub"><span class="name">핸드·립·데오</span></a> <!----></li><li><a class="sub"><span class="name">향수·디퓨저</span></a> <!----></li><li><a class="sub"><span class="name">헤어·바디소품</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_inactive_pc@2x.1574646457.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kitchen_active_pc@2x.1574646458.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">주방용품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방소모품·잡화</span></a> <!----></li><li><a class="sub"><span class="name">주방·조리도구</span></a> <!----></li><li><a class="sub"><span class="name">냄비·팬·솥</span></a> <!----></li><li><a class="sub"><span class="name">보관용기·텀블러</span></a> <!----></li><li><a class="sub"><span class="name">식기·테이블웨어</span></a> <!----></li><li><a class="sub"><span class="name">컵·잔·커피도구</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__inactive_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_electronic__active_pc@2x.1574417978.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">가전제품</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">주방가전</span></a> <!----></li><li><a class="sub"><span class="name">생활가전</span></a> <!----></li><li><a class="sub"><span class="name">계절가전</span></a> <!----></li><li><a class="sub"><span class="name">디지털·PC</span></a> <!----></li><li><a class="sub"><span class="name">대형·설치가전</span></a> <!----></li></ul></li><li><a class="menu on"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_kids_inactive_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_kids_active_pc@2x.1568687537.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">베이비·키즈·완구</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">분유·간편 이유식</span></a> <!----></li><li><a class="sub"><span class="name">이유식 재료</span></a> <!----></li><li><a class="sub on"><span class="name">간식·음식·음료</span></a> <!----></li><li><a class="sub"><span class="name">건강식품</span></a> <!----></li><li><a class="sub"><span class="name">이유·수유용품</span></a> <!----></li><li><a class="sub"><span class="name">기저귀·물티슈</span></a> <!----></li><li><a class="sub"><span class="name">세제·위생용품</span></a> <!----></li><li><a class="sub"><span class="name">스킨·구강케어</span></a> <!----></li><li><a class="sub"><span class="name">완구·잡화류</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://img-cf.kurly.com/shop/data/category/icon_pet_inactive_pc@2x.1587442293.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://img-cf.kurly.com/shop/data/category/icon_pet_active_pc@2x.1587442294.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">반려동물</span> <!----></span></a> <ul class="sub_menu"><li><a class="sub"><span class="name">강아지 간식</span></a> <!----></li><li><a class="sub"><span class="name">강아지 주식</span></a> <!----></li><li><a class="sub"><span class="name">고양이 간식</span></a> <!----></li><li><a class="sub"><span class="name">고양이 주식</span></a> <!----></li><li><a class="sub"><span class="name">반려동물 용품</span></a> <!----></li><li><a class="sub"><span class="name">배변·위생</span></a> <!----></li><li><a class="sub"><span class="name">소용량·샘플</span></a> <!----></li></ul></li><li><a class="menu"><span class="ico"><img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_v2.png" alt="카테고리 아이콘" class="ico_off"> <img src="https://res.kurly.com/pc/service/common/1908/ico_recommend_on_v2.png" alt="카테고리 아이콘" class="ico_on"></span> <span class="tit"><span class="txt">컬리의 추천</span> <!----></span></a> <ul class="sub_menu recommend"><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/category/image/f703e246-ece1-4d93-8c6a-f452953ac5dc&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">호텔 예약</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/category/image/291b013e-cad1-42f3-81db-d9ddb3c5db03&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">홈캉스</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_diet.1585551225.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">식단관리</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_breakfast.1585549149.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">간편한 아침식사</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_best_210402.1617341016.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">재구매 BEST</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_3000_210303.1614667552.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">3천원의 행복</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kp_210108_4.1610088265.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리마트</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/category/image/37194cb5-e9c1-4492-ac5a-385a1ff2b624&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">대용량 상품</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_camping_210405.1617341339.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">캠핑</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_single.1594026881.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1인 가구</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_vegan_210303.1614667589.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">비건</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_offline_210303.1614666430.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">오프라인 맛집</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_kurly_s_210303.1614667608.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">컬리가 만든 상품</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumbnail_only_210303.1614667623.png&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">Kurly Only</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/category/image/f8cf5fe6-4123-4147-981e-d7f889f9e316&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">KF365</span></a></li><li><!----> <a class="sub"><span class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/category/thumb_kp_1PT_201222.1608611417.jpg&quot;);"><img src="https://res.kurly.com/pc/img/1810/bg_blink_236x179.png" alt=""></span> <span class="name">1% Table</span></a></li></ul></li></ul></div></div></div></div>
</div>
<script src="/common_js/gnb_v1.js?ver=1.42.6"></script>
<script type="text/javascript">
  //
  gnbMenu.getCategoryNum = '919013';
  gnbMenu.update();

  // 검색창 클래스 추가/삭제
  var searchInputAction = (function(){
    var $target = {};

    var _searchInputAction = {
      setSeletor: function(){
        $target = {
          $parent: $('#gnb'),
          $search: $('#gnb [name=sword]'),
          $deleteBtn: $('#searchInit'),
          $edit: $('#edit')
        }

        this.setAction();
      },
      setAction: function(){
        var that = this;
        $target.$search.focus(function(){
          that.changeClass($target.$search, 'add', 'focus');
          that.deleteCheck();
        }).blur(function(){
          that.changeClass($target.$search, 'remove', 'focus');
          that.deleteCheck(false);
        }).on('keyup', function(){
          if($target.$edit.val() !== 'Y'){
            $target.$edit.val('Y');
          }
          that.deleteCheck();
        });

        $target.$deleteBtn.on('click', function(){
          $target.$search.val('');
          that.deleteCheck();
        });
      },
      deleteCheck: function(type){
        var that = this, count = $.trim($target.$search.val()).length;
        if(count === 0 || (typeof type !== 'undefined' &&  !type) ){
          that.changeClass($target.$deleteBtn, 'remove', 'on');
        }else{
          that.changeClass($target.$deleteBtn, 'add', 'on');
        }
      },
      changeClass: function(target, type, className){
        if(type === 'add'){
          target.addClass(className);
        }else{
          target.removeClass(className);
        }
      }
    }

    _searchInputAction.setSeletor();
  })();

  // 로고 클릭 이벤트
  $('#header .link_main').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    if (url.indexOf('/') === 0) {
      url = window.location.origin + url;
    }

    KurlyTracker.setAction('select_main_logo', {"url": url}).sendData();
    location.href = url;
  });

  $('#gnb .gnb .link').on('click', function(e){
    e.preventDefault();
    var _event_name, _event_info;
    if(sessionStorage.getItem('goodsListReferrer')){
      sessionStorage.setItem('goodsListReferrer', false);
    }
    if($(this).hasClass('new')){
      _event_name = 'select_new_product_subtab';
    }else if($(this).hasClass('best')){
      _event_name = 'select_popular_product_subtab';
    }else if($(this).hasClass('bargain')){
      _event_name = 'select_bargain_subtab';
    }else if($(this).hasClass('event')){
      _event_name = 'select_event_list_subtab';
    }
    _event_info = $(this).attr('href');

    KurlyTracker.setEventInfo(_event_info).setAction(_event_name).sendData();
    location.href = _event_info;
  });

  // 장바구니 아이콘 클릭이벤트
  $('#gnbMenu .btn_cart').on('click', function(e){
    e.preventDefault();
    KurlyTracker.setAction('select_cart').sendData();
    location.href = $(this).attr('href');
  });
</script>
</div>
<div id="main">
<div id="content" style="opacity: 1;">

<div id="qnb" class="quick-navigation" style="top: 2641.72px;">
<style>
    #qnb{position:absolute;z-index:1;right:20px;top:70px;width:80px;font:normal 12px/16px "Noto Sans";color:#333;letter-spacing:-0.3px;transition:top 0.2s}
    .goods-goods_view #qnb{top:20px}
    /* 배너 */
    #qnb .bnr_qnb{padding-bottom:7px}
    #qnb .bnr_qnb .thumb{width:80px;height:120px;vertical-align:top}
    /* 메뉴 */    
    #qnb .side_menu{width:80px;border:1px solid #ddd;border-top:0 none;background-color:#fff}
    #qnb .link_menu{display:block;height:29px;padding-top:5px;border-top:1px solid #ddd;text-align:center}
    #qnb .link_menu:hover,
    #qnb .link_menu.on{color:#5f0080}
    /* 최근본상품 */
    #qnb .side_recent{position:relative;margin-top:6px;border:1px solid #ddd;background-color:#fff}
    #qnb .side_recent .tit{display:block;padding:22px 0 6px;text-align:center}
    #qnb .side_recent .list_goods{overflow:hidden;position:relative;width:60px;margin:0 auto}
    #qnb .side_recent .list{position:absolute;left:0;top:0}
    #qnb .side_recent .link_goods{display:block;overflow:hidden;width:60px;height:80px;padding:1px 0 2px}
    #qnb .side_recent .btn{display:block;overflow:hidden;width:100%;height:17px;border:0 none;font-size:0;line-height:0;text-indent:-9999px}
    
    #qnb .side_recent .btn_up{position:absolute;left:0;top:0;background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_hover.png) no-repeat 50% 50%}
    #qnb .side_recent .btn_up.off{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up.png) no-repeat 50% 50%}
    #qnb .side_recent .btn_down{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_hover.png) no-repeat 50% 0}
    #qnb .side_recent .btn_down.off{background:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down.png) no-repeat 50% 0}
    
    
    @media
    only screen and (-webkit-min-device-pixel-ratio: 1.5),
    only screen and (min-device-pixel-ratio: 1.5),
    only screen and (min-resolution: 1.5dppx) {
        #qnb .side_recent .btn_up{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_hover_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_down{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_hover_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_up.off{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_up_x2.png);background-size:12px 18px}
        #qnb .side_recent .btn_down.off{background-image:url(https://res.kurly.com/pc/service/main/2002/ico_quick_down_x2.png);background-size:12px 18px}
    }
    @media all and (max-width: 1250px){
        #qnb{display:none}
    }
</style>

<div class="bnr_qnb" id="brnQuick"><a href="/shop/board/view.php?id=notice&amp;no=64" id="brnQuickObj">
    <img class="thumb" src="https://res.kurly.com/pc/service/main/1904/bnr_quick_20190403.png" alt="퀄리티있게 샛별배송">
</a>
<script>
    var brnQuickScript = (function(){
        var $target = $('#brnQuickObj'), $targetThumb = $('#brnQuickObj .thumb');
        // 시간체크
        function timeCheck(){
            var now = brnQuick.nowTime; // 호출 하는 js에서 변수선언되어 가져다 사용
            if( new Date('2020-12-31T11:00:00+09:00').getTime() <= now && now < new Date('2021-01-15T11:00:00+09:00').getTime() ){
              $target.attr('href', '/shop/event/kurlyEvent.php?htmid=event/2020/1231/newyearsday');
              $targetThumb.attr('src', 'https://res.kurly.com/pc/service/main/2012/bnr_quick.png');
              $targetThumb.attr('alt', '2021 설 선물');
            }else if(  new Date('2021-01-15T11:00:00+09:00').getTime() <= now && now <= new Date('2021-02-10T23:00:00+09:00').getTime() ){
              $target.attr('href', '/shop/event/kurlyEvent.php?htmid=event/2021/0115/newyearsday');
              $targetThumb.attr('src', 'https://res.kurly.com/pc/service/main/2101/bnr_quick.png');
              $targetThumb.attr('alt', '2021 설 선물');
            }
        }
        return {
            timeCheck : timeCheck
        }
    })();
    brnQuickScript.timeCheck();
</script>


</div>
<script>
    var brnQuick = {
        nowTime : '1636444575773',
        update : function(){
            $.ajax({
                url : campaginUrl + 'pc/service/bnr_quick.html'
            }).done(function(result){
                $('#brnQuick').html(result);
            });    
        }
    }
    brnQuick.update();
</script>

<div class="side_menu">
<a href="/shop/main/html.php?htmid=event/kurly.htm&amp;name=lovers" class="link_menu ">등급별 혜택</a>
<a href="/shop/board/list.php?id=recipe" class="link_menu ">레시피</a>
<a href="/shop/goods/goods_review_best.php" class="link_menu ">베스트 후기</a>
</div>
<div class="side_recent" style="">
<strong class="tit">최근 본 상품</strong>
<div class="list_goods" data-height="209" style="height: 80px;">
<ul class="list"><li><a class="link_goods" href="/shop/goods/goods_view.php?goodsno=4415"><img src="https://img-cf.kurly.com/shop/data/goods/1518511404626y0.jpg" alt=""></a></li></ul>
</div>
<button type="button" class="btn btn_up off">최근 본 상품 위로 올리기</button>
<button type="button" class="btn btn_down off">최근 본 상품 아래로 내리기</button>
</div>
<script>
/**
 * 상품상세일때 현재 보고 있는 상품 담기. 상품URL & 상품이미지
 * 최종 저장 날짜로 부터 24시가 지날시 localStorage 삭제
 */
var getGoodsRecent = (function(){
    var i, len, getGoodsRecent, item, _nowTime = '1636444575773';

    _goodsRecent();
    function _goodsRecent(){
        if(localStorage.getItem('goodsRecent') === null){
            return false;
        }
        
        try{
            getGoodsRecent = JSON.parse(localStorage.getItem("goodsRecent"));
            len = getGoodsRecent.length;
            if(addDays(getGoodsRecent[len - 1].time, 1) < _nowTime){
                localStorage.removeItem('goodsRecent');
            }else{
                for(i = 0; i < len; i++){
                    item = '<li><a class="link_goods" href="/shop/goods/goods_view.php?goodsno=' + getGoodsRecent[i].no + '"><img src="' + getGoodsRecent[i].thumb + '" alt=""></a></li>';
                    $('.side_recent .list').append(item);
                }
                $('.side_recent').show();
            }
        } catch(e){
            console.log("JSON parse error from the Quick menu goods list!!!", e);
        }
    }

    function addDays(date, days){
        var result = new Date(date);
        result.setDate(result.getDate() + days);
        return result.getTime();
    }
    
    // return {
    // }
})();
</script>
</div>
<style>
    #content{opacity:0}/* vue사용시 화면 깜빡임방지 */
</style>
<div class="section_view">

<div id="shareLayer">
<div class="layer_share">
<div class="inner_layersns">
<h3 class="screen_out">SNS 공유하기</h3>
<ul class="list_share">
<li><a class="btn btn_fb" data-sns-name="페이스북" data-sns="facebook" href="#none"><img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_facebook.png" alt="페이스북"><span class="txt">공유하기</span></a></li>
<li><a class="btn btn_tw" data-sns-name="트위터" data-sns="twitter" href="#none"><img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_twitter.png" alt="트위터"><span class="txt">트윗하기</span></a></li>
<li class="btn_url">
<input type="text" class="inp" value="" readonly="readonly">
<a class="btn_copy off" data-sns-name="링크 복사" data-sns="copy" href="#none">URL 복사<img src="https://res.kurly.com/mobile/service/goodsview/1804/ico_checked_x2.png" alt=""></a>
</li>
</ul>
</div>
</div>
</div>

<div id="sectionView"><div class="inner_view"><div class="thumb" style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1518511404626y0.jpg&quot;);"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAXcAAAHnCAQAAADpr9U2AAABeUlEQVR42u3BMQEAAADCoPVPbQ0PoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALg0lPQAATTM2xoAAAAASUVORK5CYII=" alt="상품 대표 이미지" class="bg"></div> <p class="goods_name"><span class="btn_share"><button id="btnShare" data-goodsno="4415">공유하기</button></span> <strong class="name">[우리밀] 참깨 꼬소봉</strong> <span class="short_desc">길쭉한 스틱 과자에 국산 참깨가 콕콕 박힌</span></p> <p class="goods_dcinfo">회원할인가</p> <p class="goods_price"><span class="position"><span class="dc"><!----> <span class="dc_price">2,380<span class="won">원</span></span> <span class="dc_percent">20<span class="per">%</span></span></span> <a class="original_price"><span class="price">3,000<span class="won">원</span></span><img src="https://res.kurly.com/kurly/ico/2021/question_24_24_c999.svg" alt="물음표" class="ico"></a> <span class="layer_position"><!----> <span class="layer_price"><strong class="tit_layer">컬리판매가 기준 할인</strong>                        동일 품질 상품의 주요 온/오프라인 유통사 가격과 비교하여 컬리가 설정한 가격에서 할인된 가격입니다.                        <span class="bar"></span>                        적용된 할인가는 대표 상품의 가격으로 옵션에 따라 할인 혜택이 다를 수 있습니다. 할인 혜택은 당사 사정에 따라 변경될 수 있습니다.                    </span> <button type="button" class="btn_close">레이어 닫기</button></span></span> <!----> <span><span class="txt_benefit"><span class="ico_grade grade6">웰컴 5%</span> <span class="point">                      개당 <strong class="emph">119원 적립</strong> <!----></span></span></span> <!----> <!----> <!----></p> <!----> <div class="goods_info"><dl class="list fst"><dt class="tit">판매단위</dt> <dd class="desc">1 박스</dd></dl> <dl class="list"><dt class="tit">중량/용량</dt> <dd class="desc">100g</dd></dl> <dl class="list"><dt class="tit">배송구분</dt> <!----> <dd class="desc">샛별배송/택배배송</dd></dl> <!----> <dl class="list"><dt class="tit">포장타입</dt> <dd class="desc">                    상온/종이포장                    <strong class="emph">                      택배배송은 에코포장이 스티로폼으로 대체됩니다.                    </strong></dd></dl> <dl class="list"><dt class="tit">알레르기정보</dt> <dd class="desc">- 밀, 우유, 대두 함유<br>
- 계란, 땅콩, 토마토, 호두, 쇠고기 와 같은 시설에서 생산</dd></dl> <!----> <!----> <!----> <!---->  <dl class="list"><dt class="tit">안내사항</dt> <dd class="desc"><span class="txt">해당상품은 '오징어 땅콩볼' 제품과 무관한 제조사에서 생산되고 있습니다. 제품 구매시 참고 부탁드립니다.</span></dd></dl> <!----> <!----></div> <!----></div> <!----></div>
<div id="cartPut"><div class="cart_option cartList cart_type2"><div class="inner_option"><!----> <!----> <div class="in_option"><div class="list_goods"><!----> <!----> <!----> <ul class="list list_nopackage"><li class="on"><span class="btn_position"><button type="button" class="btn_del"><span class="txt">삭제하기</span></button></span> <span class="name"><!---->                                  [우리밀] 참깨 꼬소봉                                  <!----></span> <span class="tit_item">구매수량</span> <div class="option"><span class="count"><button type="button" class="btn down on">수량내리기</button> <input type="number" readonly="readonly" onfocus="this.blur()" class="inp"> <button type="button" class="btn up on">수량올리기</button></span> <span class="price"><span class="dc_price">2,380원</span> <span class="original_price">3,000원</span></span></div></li></ul></div> <div class="total"><div class="price"><!----> <strong class="tit">총 상품금액 :</strong> <span class="sum"><span class="num">2,380</span> <span class="won">원</span></span></div> <p class="txt_point"><span class="ico">적립</span> <!----> <span class="point">                                구매 시 <strong class="emph">119원 적립</strong></span></p></div></div> <div class="group_btn off"><div class="view_function"><button type="button" class="btn btn_alarm">재입고 알림</button></div> <span class="btn_type1"><button type="button" class="txt_type">                        장바구니 담기                      </button> <!----></span> <!----> <!----> <!----> <!----> <!----> <!----></div> <!----></div></div> <div class="cart_option cartList cart_type1 on"><div class="inner_option"><!----> <!----> <div class="in_option"><div class="list_goods"><div class="bar_open"><button type="button" class="btn_close"><span class="ico">상품 선택</span></button></div> <!----> <!----> <!----></div> <!----></div> <div class="group_btn off"><div class="view_function"><button type="button" class="btn btn_alarm">재입고 알림</button></div> <span class="btn_type1"><button type="button" class="txt_type">                        장바구니 담기                      </button> <!----></span> <!----> <!----> <!----> <!----> <!----> <!----></div> <!----></div></div> <!----> <div class="cart_option cart_result cart_type3"><div class="inner_option"><button type="button" class="btn_close1">pc레이어닫기</button> <p class="success">상품 구매를 위한 <span class="bar"></span>배송지를 설정해주세요</p> <div class="group_btn layer_btn2"><span class="btn_type2"><button type="button" class="txt_type">취소</button></span> <span class="btn_type1"><button type="button" class="txt_type"><span class="ico_search"></span>주소 검색</button></span></div></div></div> <form name="frmBuyNow" method="post" action="/shop/order/order.php"><input type="hidden" name="mode" value="addItem"> <input type="hidden" name="goodsno" value=""></form> <form name="frmWishlist" method="post"></form></div>
</div>



<div class="layout-wrapper goods-view-area">


<script src="/shop/data/skin/designgj/autoslider.js"></script>
<div class="goods-add-product">
<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
<div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
<button class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로 슬라이드 이동</button>
<button class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로 슬라이드 이동</button>
<div class="goods-add-product-list-wrapper" style="height:320px">
<ul class="goods-add-product-list __slide-mover">
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36425', 'select_related_product', {origin_price: 3500, package_id: 36425, package_name: '[베이비본죽] 두부감자조림'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699524468m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 두부감자조림</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9877', 'select_related_product', {origin_price: 2700, package_id: 9877, package_name: '바다모음 밥새우 50g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509699121513m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 밥새우 50g (냉장)</p>
<p class="goods-add-product-item-price">2,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=71264', 'select_related_product', {origin_price: 3800, package_id: 71264, package_name: '[킨더가든] 바다맛 해물짜장'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/161941228735m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 바다맛 해물짜장</p>
<p class="goods-add-product-item-price">3,800원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70027', 'select_related_product', {origin_price: 3600, package_id: 70027, package_name: '[킨더가든] 우리아이 소고기잡채'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619406283306m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 우리아이 소고기잡채</p>
<p class="goods-add-product-item-price">3,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=5290', 'select_related_product', {origin_price: 10400, package_id: 5290, package_name: '[비바니] 유기농 코코아'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1482817525803m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[비바니] 유기농 코코아</p>
<p class="goods-add-product-item-price">10,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=31253', 'select_related_product', {origin_price: 3300, package_id: 31253, package_name: '[또또맘] 유기농 쌀떡과자 5종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1543305322860m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 유기농 쌀떡과자 5종</p>
<p class="goods-add-product-item-price">3,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=68399', 'select_related_product', {origin_price: 2600, package_id: 68399, package_name: '[집으로ON] 어린이 볶음밥 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1615448685441m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[집으로ON] 어린이 볶음밥 4종</p>
<p class="goods-add-product-item-price">2,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=4424', 'select_related_product', {origin_price: 2400, package_id: 4424, package_name: '[상하목장] 마시는 유기농 요구르트 5개입'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1622166409944m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[상하목장] 마시는 유기농 요구르트 5개입</p>
<p class="goods-add-product-item-price">2,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=61668', 'select_related_product', {origin_price: 2600, package_id: 61668, package_name: '[아이배냇] 베베 떠먹는 고구마와 바나나'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1606465795870m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아이배냇] 베베 떠먹는 고구마와 바나나</p>
<p class="goods-add-product-item-price">2,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9878', 'select_related_product', {origin_price: 5500, package_id: 9878, package_name: '바다모음 순멸치 80g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509702911969m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 순멸치 80g (냉장)</p>
<p class="goods-add-product-item-price">5,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70023', 'select_related_product', {origin_price: 3900, package_id: 70023, package_name: '[킨더가든] 소고기 애호박볶음'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619411954689m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 소고기 애호박볶음</p>
<p class="goods-add-product-item-price">3,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=44542', 'select_related_product', {origin_price: 2500, package_id: 44542, package_name: '[아넬라] 짜먹는 아넬라 HOP 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/157837779733m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아넬라] 짜먹는 아넬라 HOP 3종</p>
<p class="goods-add-product-item-price">2,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=3748', 'select_related_product', {origin_price: 3399, package_id: 3748, package_name: '[상하치즈] 유기농 아이치즈 3종 (10매입)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1484823932740m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[상하치즈] 유기농 아이치즈 3종 (10매입)</p>
<p class="goods-add-product-item-price">3,399원</p>
</div>
 </div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=53039', 'select_related_product', {origin_price: 5980, package_id: 53039, package_name: '[아트위드미] 폼벨퓨레 4개입 6종 (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1590719681556m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아트위드미] 폼벨퓨레 4개입 6종 (냉장)</p>
<p class="goods-add-product-item-price">5,980원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70028', 'select_related_product', {origin_price: 8500, package_id: 70028, package_name: '[킨더가든] 엄마랑 함께 먹는 비빔밥키트'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619405467506m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 엄마랑 함께 먹는 비빔밥키트</p>
<p class="goods-add-product-item-price">8,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=38224', 'select_related_product', {origin_price: 1750, package_id: 38224, package_name: '[또또맘] 리얼이구마  2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1577356916257m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 리얼이구마 2종</p>
<p class="goods-add-product-item-price">1,750원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36882', 'select_related_product', {origin_price: 3500, package_id: 36882, package_name: '[베이비본죽] 야채계란국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/157069991181m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 야채계란국</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=27918', 'select_related_product', {origin_price: 4900, package_id: 27918, package_name: '[티미] 유기농 키즈 스낵 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1535009199743m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[티미] 유기농 키즈 스낵 3종</p>
<p class="goods-add-product-item-price">4,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9881', 'select_related_product', {origin_price: 2200, package_id: 9881, package_name: '바다모음 파래가루 20g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/150969760985m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 파래가루 20g (냉장)</p>
<p class="goods-add-product-item-price">2,200원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=68391', 'select_related_product', {origin_price: 2500, package_id: 68391, package_name: '뽀로로 한입 크리스피롤 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/161579043950m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">뽀로로 한입 크리스피롤 2종</p>
<p class="goods-add-product-item-price">2,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36424', 'select_related_product', {origin_price: 4700, package_id: 36424, package_name: '[베이비본죽] 계란소보로'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699566949m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 계란소보로</p>
<p class="goods-add-product-item-price">4,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=26232', 'select_related_product', {origin_price: 8900, package_id: 26232, package_name: '[풀무원] 토이쿠키 만들기 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1596173245259m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[풀무원] 토이쿠키 만들기 2종</p>
<p class="goods-add-product-item-price">8,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36421', 'select_related_product', {origin_price: 3500, package_id: 36421, package_name: '[베이비본죽] 감자애호박된장국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699949755m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 감자애호박된장국</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70022', 'select_related_product', {origin_price: 2500, package_id: 70022, package_name: '[킨더가든] 소고기 무볶음'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619411798430m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 소고기 무볶음</p>
<p class="goods-add-product-item-price">2,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=43396', 'select_related_product', {origin_price: 24000, package_id: 43396, package_name: '[김소영 아티장의 안단테] 아티장비스킷 2by2 비스킷 틴케이스 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1573539139942m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[김소영 아티장의 안단테] 아티장비스킷 2by2 비스킷 틴케이스 2종</p>
<p class="goods-add-product-item-price">24,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36420', 'select_related_product', {origin_price: 3500, package_id: 36420, package_name: '[베이비본죽] 배추들깨볶음'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699654544m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 배추들깨볶음</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36418', 'select_related_product', {origin_price: 3500, package_id: 36418, package_name: '[베이비본죽] 설렁탕'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699986545m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 설렁탕</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=25680', 'select_related_product', {origin_price: 2700, package_id: 25680, package_name: '[떼르드글라스] 떼글이 초콜릿'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1525246909911m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[떼르드글라스] 떼글이 초콜릿</p>
<p class="goods-add-product-item-price">2,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=32292', 'select_related_product', {origin_price: 3580, package_id: 32292, package_name: '[풀무원] 국산콩 꼬마 나또 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619053870772m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[풀무원] 국산콩 꼬마 나또 2종</p>
<p class="goods-add-product-item-price">3,580원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=49544', 'select_related_product', {origin_price: 2400, package_id: 49544, package_name: '[폴라레티] 얼려먹는 아이스바 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1583731662405m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[폴라레티] 얼려먹는 아이스바 2종</p>
<p class="goods-add-product-item-price">2,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=64090', 'select_related_product', {origin_price: 990, package_id: 64090, package_name: '[맘스케어] 유기농 까까 떡뻥 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1608807026713m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[맘스케어] 유기농 까까 떡뻥 3종</p>
<p class="goods-add-product-item-price">990원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=34179', 'select_related_product', {origin_price: 13000, package_id: 34179, package_name: '[연세우유] 1A 가볍다 우유'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1546839558879m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[연세우유] 1A 가볍다 우유</p>
<p class="goods-add-product-item-price">13,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=60718', 'select_related_product', {origin_price: 1950, package_id: 60718, package_name: '[요플레] 짜먹는 키즈 요거트 2종 (뽀로로)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1604370390801m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[요플레] 짜먹는 키즈 요거트 2종 (뽀로로)</p>
<p class="goods-add-product-item-price">1,950원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=42152', 'select_related_product', {origin_price: 15900, package_id: 42152, package_name: '[몸애쏙쏙] 유기농 어린이 배도라지즙 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570437360382m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[몸애쏙쏙] 유기농 어린이 배도라지즙 2종</p>
<p class="goods-add-product-item-price">15,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=38227', 'select_related_product', {origin_price: 1750, package_id: 38227, package_name: '[또또맘] 리얼 치즈구마 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1577412468807m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 리얼 치즈구마 2종</p>
<p class="goods-add-product-item-price">1,750원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=66195', 'select_related_product', {origin_price: 5600, package_id: 66195, package_name: '[청오] 유기농 발아 현미차 (알곡)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1612158826649m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[청오] 유기농 발아 현미차 (알곡)</p>
<p class="goods-add-product-item-price">5,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36880', 'select_related_product', {origin_price: 4700, package_id: 36880, package_name: '[베이비본죽] 한우알밤조림'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1561426317953m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 한우알밤조림</p>
<p class="goods-add-product-item-price">4,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=1691', 'select_related_product', {origin_price: 4400, package_id: 1691, package_name: '[상하목장] 유기농 우유'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1628558479274m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[상하목장] 유기농 우유</p>
<p class="goods-add-product-item-price">4,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9879', 'select_related_product', {origin_price: 1900, package_id: 9879, package_name: '바다모음 자른 미역 30g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509702723836m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 자른 미역 30g (냉장)</p>
<p class="goods-add-product-item-price">1,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=8844', 'select_related_product', {origin_price: 3580, package_id: 8844, package_name: '[상하목장] 유기농 베이비 요구르트 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1624237877851m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[상하목장] 유기농 베이비 요구르트 3종</p>
<p class="goods-add-product-item-price">3,580원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70030', 'select_related_product', {origin_price: 2200, package_id: 70030, package_name: '[킨더가든] 어린이 채소피클'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619404342981m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 어린이 채소피클</p>
<p class="goods-add-product-item-price">2,200원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=35810', 'select_related_product', {origin_price: 15900, package_id: 35810, package_name: '[앤쿡] 무항생제 어린이 한우 나주 곰국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1583457291894m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[앤쿡] 무항생제 어린이 한우 나주 곰국</p>
<p class="goods-add-product-item-price">15,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36414', 'select_related_product', {origin_price: 3500, package_id: 36414, package_name: '[베이비본죽] 닭곰탕'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570700073938m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 닭곰탕</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70029', 'select_related_product', {origin_price: 5900, package_id: 70029, package_name: '[킨더가든] 몽글몽글 달걀북엇국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619404190792m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 몽글몽글 달걀북엇국</p>
<p class="goods-add-product-item-price">5,900원</p>
</div>
 </div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=5268', 'select_related_product', {origin_price: 2500, package_id: 5268, package_name: '[파제르] 무민 소프트 캔디(젤리)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1482307465249m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[파제르] 무민 소프트 캔디(젤리)</p>
<p class="goods-add-product-item-price">2,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36419', 'select_related_product', {origin_price: 3500, package_id: 36419, package_name: '[베이비본죽] 고구마닭치즈그라탕'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699701229m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 고구마닭치즈그라탕</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=38221', 'select_related_product', {origin_price: 3900, package_id: 38221, package_name: '[또또맘] 오가닉 아이김 20g(1gx20)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/156447256686m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 오가닉 아이김 20g(1gx20)</p>
<p class="goods-add-product-item-price">3,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36427', 'select_related_product', {origin_price: 4700, package_id: 36427, package_name: '[베이비본죽] 치킨스튜'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699482479m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 치킨스튜</p>
<p class="goods-add-product-item-price">4,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=35894', 'select_related_product', {origin_price: 15950, package_id: 35894, package_name: '[정식품] 우리콩 토들러 두유 3종 (박스)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1634286851309m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[정식품] 우리콩 토들러 두유 3종 (박스)</p>
<p class="goods-add-product-item-price">15,950원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10141', 'select_related_product', {origin_price: 3760, package_id: 10141, package_name: '[종가집] 어린이 한입 깍두기 300g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1632705150119m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[종가집] 어린이 한입 깍두기 300g</p>
<p class="goods-add-product-item-price">3,760원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=31263', 'select_related_product', {origin_price: 3300, package_id: 31263, package_name: '[또또맘] 라이스 퍼프 5종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1543301311552m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 라이스 퍼프 5종</p>
<p class="goods-add-product-item-price">3,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70026', 'select_related_product', {origin_price: 6300, package_id: 70026, package_name: '[킨더가든] 미니어린이 불고기 떡볶이'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619403987770m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 미니어린이 불고기 떡볶이</p>
<p class="goods-add-product-item-price">6,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=30222', 'select_related_product', {origin_price: 6900, package_id: 30222, package_name: '[연세우유] 100% 자연 치즈 스트링'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1538633078113m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[연세우유] 100% 자연 치즈 스트링</p>
<p class="goods-add-product-item-price">6,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70031', 'select_related_product', {origin_price: 3700, package_id: 70031, package_name: '[킨더가든] 우리아이 된장찌개'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619404548618m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 우리아이 된장찌개</p>
<p class="goods-add-product-item-price">3,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=60146', 'select_related_product', {origin_price: 75000, package_id: 60146, package_name: '[선물세트] 키니지니 유기농 키즈 홍삼'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1604300158285m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[선물세트] 키니지니 유기농 키즈 홍삼</p>
<p class="goods-add-product-item-price">75,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=66868', 'select_related_product', {origin_price: 2450, package_id: 66868, package_name: '[더오담] 사각 미니 돈까스 3종 (소포장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1613977700577m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[더오담] 사각 미니 돈까스 3종 (소포장)</p>
<p class="goods-add-product-item-price">2,450원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=63486', 'select_related_product', {origin_price: 19800, package_id: 63486, package_name: '[JW중외] 락토플러스 생 유산균 키즈 (50일분)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1609137238751m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[JW중외] 락토플러스 생 유산균 키즈 (50일분)</p>
<p class="goods-add-product-item-price">19,800원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=31684', 'select_related_product', {origin_price: 17900, package_id: 31684, package_name: '[김정환홍삼] 사과나무아래 달콤홍삼 (어린이용)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1543215412199m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[김정환홍삼] 사과나무아래 달콤홍삼 (어린이용)</p>
<p class="goods-add-product-item-price">17,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36884', 'select_related_product', {origin_price: 3500, package_id: 36884, package_name: '[베이비본죽] 화이트크림소스'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699381413m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 화이트크림소스</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
 <li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=64086', 'select_related_product', {origin_price: 2980, package_id: 64086, package_name: '[맘스케어] 유기농 까까 별과자&amp;곡물과자 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1608807302128m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[맘스케어] 유기농 까까 별과자&amp;곡물과자 2종</p>
<p class="goods-add-product-item-price">2,980원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=4445', 'select_related_product', {origin_price: 2400, package_id: 4445, package_name: '[야미얼스] 구미젤리 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/14758224510m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[야미얼스] 구미젤리 2종</p>
<p class="goods-add-product-item-price">2,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70017', 'select_related_product', {origin_price: 4500, package_id: 70017, package_name: '[킨더가든] 애호박 감자채전'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619402639917m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 애호박 감자채전</p>
<p class="goods-add-product-item-price">4,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36416', 'select_related_product', {origin_price: 3500, package_id: 36416, package_name: '[베이비본죽] 짜장소스'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699791665m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 짜장소스</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=11021', 'select_related_product', {origin_price: 12000, package_id: 11021, package_name: '[채움] 국내산 과일채소로 만든 주스 4종 (10개입)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1513762522217m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[채움] 국내산 과일채소로 만든 주스 4종 (10개입)</p>
<p class="goods-add-product-item-price">12,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=66194', 'select_related_product', {origin_price: 4780, package_id: 66194, package_name: '[청오] 유기농 발아 보리차 (알곡)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/161215872282m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[청오] 유기농 발아 보리차 (알곡)</p>
<p class="goods-add-product-item-price">4,780원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=27362', 'select_related_product', {origin_price: 3600, package_id: 27362, package_name: '[상하치즈] 슬라이스 치즈 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1532683131355m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[상하치즈] 슬라이스 치즈 4종</p>
<p class="goods-add-product-item-price">3,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=13360', 'select_related_product', {origin_price: 6040, package_id: 13360, package_name: '[샘표] 우리아이 순한 간장 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1521617850197m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[샘표] 우리아이 순한 간장 2종</p>
<p class="goods-add-product-item-price">6,040원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10112', 'select_related_product', {origin_price: 20900, package_id: 10112, package_name: '와일드알프 주니어 워터 250ml 1박스(12개입)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1635918422150m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">와일드알프 주니어 워터 250ml 1박스(12개입)</p>
<p class="goods-add-product-item-price">20,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=56736', 'select_related_product', {origin_price: 2980, package_id: 56736, package_name: '[폼벨] 유기농 바이오 스무디 (퓨레) 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1598936301118m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
 <div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[폼벨] 유기농 바이오 스무디 (퓨레) 2종</p>
<p class="goods-add-product-item-price">2,980원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=56329', 'select_related_product', {origin_price: 9500, package_id: 56329, package_name: '[또또맘] 자연에서 굴러온 모짜치즈볼'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1599802233876m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 자연에서 굴러온 모짜치즈볼</p>
<p class="goods-add-product-item-price">9,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=11633', 'select_related_product', {origin_price: 15900, package_id: 11633, package_name: '[앤쿡] 어린이 한우 사골 곰국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1631064290510m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[앤쿡] 어린이 한우 사골 곰국</p>
<p class="goods-add-product-item-price">15,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=64083', 'select_related_product', {origin_price: 5980, package_id: 64083, package_name: '[맘스케어] 유기농 까까 오리지널&amp;블랙 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1608807518617m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[맘스케어] 유기농 까까 오리지널&amp;블랙 2종</p>
<p class="goods-add-product-item-price">5,980원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=43393', 'select_related_product', {origin_price: 7500, package_id: 43393, package_name: '[김소영 아티장의 안단테] 아티장비스킷 2by2 비스킷 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1573538962964m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[김소영 아티장의 안단테] 아티장비스킷 2by2 비스킷 4종</p>
<p class="goods-add-product-item-price">7,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=26951', 'select_related_product', {origin_price: 2200, package_id: 26951, package_name: '[Torie&amp;Howard] 유기농 과일맛 카라멜 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1531891844671m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[Torie&amp;Howard] 유기농 과일맛 카라멜 4종</p>
<p class="goods-add-product-item-price">2,200원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36423', 'select_related_product', {origin_price: 4700, package_id: 36423, package_name: '[베이비본죽] 간장찜닭'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699607337m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 간장찜닭</p>
<p class="goods-add-product-item-price">4,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=4432', 'select_related_product', {origin_price: 3900, package_id: 4432, package_name: '[아넬라] 과일 퓨레 9종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1578533873340m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아넬라] 과일 퓨레 9종</p>
<p class="goods-add-product-item-price">3,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10140', 'select_related_product', {origin_price: 3580, package_id: 10140, package_name: '[종가집] 어린이 한입 배추김치 300g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1632705196230m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[종가집] 어린이 한입 배추김치 300g</p>
<p class="goods-add-product-item-price">3,580원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=60177', 'select_related_product', {origin_price: 2800, package_id: 60177, package_name: '[호라푸드] 곡물 크리스피 21 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1603263940587m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[호라푸드] 곡물 크리스피 21 4종</p>
<p class="goods-add-product-item-price">2,800원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=27914', 'select_related_product', {origin_price: 3400, package_id: 27914, package_name: '[바이오사우르스] 유기농 주니어 스낵 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/153500275081m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[바이오사우르스] 유기농 주니어 스낵 3종</p>
<p class="goods-add-product-item-price">3,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10159', 'select_related_product', {origin_price: 20900, package_id: 10159, package_name: '와일드알프 베이비 워터 1박스'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1511163914925m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">와일드알프 베이비 워터 1박스</p>
<p class="goods-add-product-item-price">20,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=6482', 'select_related_product', {origin_price: 1480, package_id: 6482, package_name: '[풀무원] 뽀로로 연두부'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1617252519284m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[풀무원] 뽀로로 연두부</p>
<p class="goods-add-product-item-price">1,480원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=75572', 'select_related_product', {origin_price: 16900, package_id: 75572, package_name: '[또또맘] 리얼딸기구마 20gx10입'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/162494177250m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 리얼딸기구마 20gx10입</p>
<p class="goods-add-product-item-price">16,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=4416', 'select_related_product', {origin_price: 2300, package_id: 4416, package_name: '[우리밀] 두부과자'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1518501508171m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[우리밀] 두부과자</p>
<p class="goods-add-product-item-price">2,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=48569', 'select_related_product', {origin_price: 15900, package_id: 48569, package_name: '[몸애수호] 어린이홍삼배도라지'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1584932058817m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[몸애수호] 어린이홍삼배도라지</p>
<p class="goods-add-product-item-price">15,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=60493', 'select_related_product', {origin_price: 68000, package_id: 60493, package_name: '[드시모네] 키즈 스텝 1 사과향'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1615438879628m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[드시모네] 키즈 스텝 1 사과향</p>
<p class="goods-add-product-item-price">68,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=31257', 'select_related_product', {origin_price: 3300, package_id: 31257, package_name: '[또또맘] 라이스 스틱 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1543297246498m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 라이스 스틱 3종</p>
<p class="goods-add-product-item-price">3,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10152', 'select_related_product', {origin_price: 1800, package_id: 10152, package_name: '와일드알프 베이비 워터 1병'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1511163636319m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">와일드알프 베이비 워터 1병</p>
<p class="goods-add-product-item-price">1,800원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=29788', 'select_related_product', {origin_price: 4500, package_id: 29788, package_name: '[청오] 유기농 순 발아 아이현미차'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1577934889372m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[청오] 유기농 순 발아 아이현미차</p>
<p class="goods-add-product-item-price">4,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9882', 'select_related_product', {origin_price: 5900, package_id: 9882, package_name: '바다모음 황태속살 70g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/150969883742m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 황태속살 70g (냉장)</p>
<p class="goods-add-product-item-price">5,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=35963', 'select_related_product', {origin_price: 4600, package_id: 35963, package_name: '[덴마크] 유기농 자연방목 아기치즈 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1555401402574m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[덴마크] 유기농 자연방목 아기치즈 2종</p>
<p class="goods-add-product-item-price">4,600원</p>
 </div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=49377', 'select_related_product', {origin_price: 15900, package_id: 49377, package_name: '[또또맘] 리얼구마죽 100gx7입'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1583222825923m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 리얼구마죽 100gx7입</p>
<p class="goods-add-product-item-price">15,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=42164', 'select_related_product', {origin_price: 3680, package_id: 42164, package_name: '[베베쿡] 바르게 만든 한우 설렁탕 200g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1572585624891m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베베쿡] 바르게 만든 한우 설렁탕 200g</p>
<p class="goods-add-product-item-price">3,680원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9876', 'select_related_product', {origin_price: 5000, package_id: 9876, package_name: '바다모음 매생이 6g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509700776540m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 매생이 6g (냉장)</p>
<p class="goods-add-product-item-price">5,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=54984', 'select_related_product', {origin_price: 4800, package_id: 54984, package_name: '[폴라레티] 유기농 프르츠 아이스바'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/159488562750m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[폴라레티] 유기농 프르츠 아이스바</p>
<p class="goods-add-product-item-price">4,800원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36415', 'select_related_product', {origin_price: 3500, package_id: 36415, package_name: '[베이비본죽] 한우무국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570700030553m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 한우무국</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=10142', 'select_related_product', {origin_price: 3580, package_id: 10142, package_name: '[종가집] 어린이 한입 백김치 300g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1632705101692m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[종가집] 어린이 한입 백김치 300g</p>
<p class="goods-add-product-item-price">3,580원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=61743', 'select_related_product', {origin_price: 5900, package_id: 61743, package_name: '[또또맘]우리아이 맑은습관 도라지배'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1607326491509m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘]우리아이 맑은습관 도라지배</p>
<p class="goods-add-product-item-price">5,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36417', 'select_related_product', {origin_price: 3500, package_id: 36417, package_name: '[베이비본죽] 사과카레소스'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699748625m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 사과카레소스</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=27869', 'select_related_product', {origin_price: 2480, package_id: 27869, package_name: '[힙] 유기농 과일 퓨레 8종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1535358450350m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[힙] 유기농 과일 퓨레 8종</p>
<p class="goods-add-product-item-price">2,480원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=35193', 'select_related_product', {origin_price: 7300, package_id: 35193, package_name: '순살 생선 3종 (냉동)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1614154685118m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">순살 생선 3종 (냉동)</p>
<p class="goods-add-product-item-price">7,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=60147', 'select_related_product', {origin_price: 89000, package_id: 60147, package_name: '[선물세트] 키니지니 유기농 쥬니어 홍삼'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1604299918822m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[선물세트] 키니지니 유기농 쥬니어 홍삼</p>
<p class="goods-add-product-item-price">89,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=11459', 'select_related_product', {origin_price: 4900, package_id: 11459, package_name: '[베베쿡] 처음먹는 어린이김 오리지널 10봉 (1단계)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1590999140996m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베베쿡] 처음먹는 어린이김 오리지널 10봉 (1단계)</p>
<p class="goods-add-product-item-price">4,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=38113', 'select_related_product', {origin_price: 6390, package_id: 38113, package_name: '[설성목장] 한우 어린이 육포'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1624680691991m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[설성목장] 한우 어린이 육포</p>
<p class="goods-add-product-item-price">6,390원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=64095', 'select_related_product', {origin_price: 990, package_id: 64095, package_name: '[맘스케어] 유기농 까까 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1608806691578m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[맘스케어] 유기농 까까 3종</p>
<p class="goods-add-product-item-price">990원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=37776', 'select_related_product', {origin_price: 1500, package_id: 37776, package_name: '[록야] 부드러운 로스팅 콩 25g 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1581313628316m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[록야] 부드러운 로스팅 콩 25g 3종</p>
<p class="goods-add-product-item-price">1,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=73024', 'select_related_product', {origin_price: 2180, package_id: 73024, package_name: '[테일러] 키즈푸룬 주스 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1621922802369m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[테일러] 키즈푸룬 주스 2종</p>
<p class="goods-add-product-item-price">2,180원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=37066', 'select_related_product', {origin_price: 11900, package_id: 37066, package_name: '어린이 순살 생선 3종 (냉동)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1559616501311m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">어린이 순살 생선 3종 (냉동)</p>
<p class="goods-add-product-item-price">11,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=34753', 'select_related_product', {origin_price: 9900, package_id: 34753, package_name: '[YANICK&amp;FEE] 유기농 키즈 시리얼 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1571124525491m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[YANICK&amp;FEE] 유기농 키즈 시리얼 2종</p>
<p class="goods-add-product-item-price">9,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=49378', 'select_related_product', {origin_price: 2900, package_id: 49378, package_name: '[또또맘] 떼쓰는우리아이엔촉촉꿀밤 50g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1583220000694m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[또또맘] 떼쓰는우리아이엔촉촉꿀밤 50g</p>
<p class="goods-add-product-item-price">2,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36883', 'select_related_product', {origin_price: 3500, package_id: 36883, package_name: '[베이비본죽] 어묵국'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699872466m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 어묵국</p>
<p class="goods-add-product-item-price">3,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=1289', 'select_related_product', {origin_price: 3000, package_id: 1289, package_name: '[할로윈 패키지 출고] [야미얼스] 유기농 과일 막대사탕 2종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1613956699573m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[할로윈 패키지 출고] [야미얼스] 유기농 과일 막대사탕 2종</p>
<p class="goods-add-product-item-price">3,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=41742', 'select_related_product', {origin_price: 33000, package_id: 41742, package_name: '[듀오락] 데일리키즈 프로바이오틱스 유산균 1통 (30일분)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1569203630497m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[듀오락] 데일리키즈 프로바이오틱스 유산균 1통 (30일분)</p>
<p class="goods-add-product-item-price">33,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70019', 'select_related_product', {origin_price: 3600, package_id: 70019, package_name: '[킨더가든] 우리아이 옥수수전'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619403130829m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 우리아이 옥수수전</p>
<p class="goods-add-product-item-price">3,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=43950', 'select_related_product', {origin_price: 45000, package_id: 43950, package_name: '[뉴오리진] a2 플래티넘 900g 3종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1575015853359m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[뉴오리진] a2 플래티넘 900g 3종</p>
<p class="goods-add-product-item-price">45,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9883', 'select_related_product', {origin_price: 28000, package_id: 9883, package_name: '바다모음 세트(냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509703214930m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 세트(냉장)</p>
<p class="goods-add-product-item-price">28,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=36881', 'select_related_product', {origin_price: 4700, package_id: 36881, package_name: '[베이비본죽] 닭볶음탕'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1570699435762m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 닭볶음탕</p>
<p class="goods-add-product-item-price">4,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=70025', 'select_related_product', {origin_price: 5400, package_id: 70025, package_name: '[킨더가든] 채소 품은 떡갈비'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1619403793890m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[킨더가든] 채소 품은 떡갈비</p>
<p class="goods-add-product-item-price">5,400원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=61667', 'select_related_product', {origin_price: 2600, package_id: 61667, package_name: '[아이배냇] 베베 떠먹는 고구마'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1606465511164m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아이배냇] 베베 떠먹는 고구마</p>
<p class="goods-add-product-item-price">2,600원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=68436', 'select_related_product', {origin_price: 1500, package_id: 68436, package_name: '[아임제주] 유기농 감귤주스 2종(냉동)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/161422110070m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[아임제주] 유기농 감귤주스 2종(냉동)</p>
<p class="goods-add-product-item-price">1,500원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=12392', 'select_related_product', {origin_price: 1580, package_id: 12392, package_name: '[맘스스낵] 유기농 쌀과자 &amp; 쌀떡과자 5종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1517387499399m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[맘스스낵] 유기농 쌀과자 &amp; 쌀떡과자 5종</p>
<p class="goods-add-product-item-price">1,580원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=13766', 'select_related_product', {origin_price: 3700, package_id: 13766, package_name: '[베베쿡] 처음먹는 소스 4종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1539569156858m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베베쿡] 처음먹는 소스 4종</p>
 <p class="goods-add-product-item-price">3,700원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=7414', 'select_related_product', {origin_price: 2900, package_id: 7414, package_name: '[요미요미] 유기농 주스 6종 (3개입)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1606095248760m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[요미요미] 유기농 주스 6종 (3개입)</p>
<p class="goods-add-product-item-price">2,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=9880', 'select_related_product', {origin_price: 5000, package_id: 9880, package_name: '바다모음 찐톳 70g (냉장)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1509699813835m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">바다모음 찐톳 70g (냉장)</p>
<p class="goods-add-product-item-price">5,000원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=40474', 'select_related_product', {origin_price: 1300, package_id: 40474, package_name: '[제주사월]제주까까 15g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1565941146861m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[제주사월]제주까까 15g</p>
<p class="goods-add-product-item-price">1,300원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=52612', 'select_related_product', {origin_price: 4900, package_id: 52612, package_name: '[베베쿡] 처음먹는 어린이김 핑크솔트 10봉 (2단계)'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1591074268912m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베베쿡] 처음먹는 어린이김 핑크솔트 10봉 (2단계)</p>
<p class="goods-add-product-item-price">4,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=41862', 'select_related_product', {origin_price: 4900, package_id: 41862, package_name: '[베이비본죽] 유기농 쌀과자 퍼프 7종'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/156957620096m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[베이비본죽] 유기농 쌀과자 퍼프 7종</p>
<p class="goods-add-product-item-price">4,900원</p>
</div>
</div>
</li>
<li class="goods-add-product-item __slide-item">
<div class="goods-add-product-item-figure">
<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=56721', 'select_related_product', {origin_price: 7500, package_id: 56721, package_name: '[씨알로] 우리아이 우리쌀링 400g'}, {openWindow: true})">
<img src="//img-cf.kurly.com/shop/data/goods/1598333070663m0.jpg" class="goods-add-product-item-image" onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
</a>
</div>
<div class="goods-add-product-item-content">
<div class="goods-add-product-item-content-wrapper">
<p class="goods-add-product-item-name">[씨알로] 우리아이 우리쌀링 400g</p>
<p class="goods-add-product-item-price">7,500원</p>
</div>
</div>
</li>
</ul>
</div>
</div>
</div>

<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
<div class="goods-view-tab fixed">
<ul class="goods-view-infomation-tab-group">
<li class="goods-view-infomation-tab"><a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품설명</a></li>
<li class="goods-view-infomation-tab"><a href="#goods-infomation" class="goods-view-infomation-tab-anchor">상세정보</a></li>
<li class="goods-view-infomation-tab goods-view-review-tab"><a href="#goods-review" class="goods-view-infomation-tab-anchor">후기 <span class="count_review">(3332)</span></a></li>

<li class="goods-view-infomation-tab qna-show"><a href="#goods-qna" class="goods-view-infomation-tab-anchor">문의</a></li>
</ul>
</div>
<div class="goods-view-infomation-content __active fixed_tab" id="goods-description">


<p class="pic"><img src="//img-cf.kurly.com/shop/data/goods/daily/7e9f2b068868abeb7a42.jpg"></p>
<div class="daily_desc">
<div class="daily_box">
<strong class="daily_goodsTit"><span>길쭉한 스틱 과자에 국산 참깨가 콕콕 박힌</span>[우리밀] 참깨 꼬소봉</strong> <p class="words">이름에서부터 고소함이 물씬 풍기는 우리밀 참깨 꼬소봉을 소개합니다. 우리밀과 국산 무염 버터, 깨 등을 넣고 반죽해 길쭉한 스틱 형태로 구워냈답니다. 참깨 본연의 고소함을 한껏 끌어올렸기에 누구나 부담 없이 쏙쏙 집어 먹기 좋아요. 좋은 재료를 사용해 아이들을 위한 간식으로도 안심하고 내어줄 수 있지요. 온 가족이 즐기는 담백한 과자로 고민 없이 선택해 보세요. </p>

<div class="daily_goodsInfo">
<div class="row">
<strong class="tit_daily"><span>Checklist</span></strong>
<ul class="info_list"><li><strong class="ico_check">원재료</strong><p>국내산 재료 사용 (우리밀, 국산 무염 버터, 국산 참깨와 검은깨 등)</p></li><li><strong class="ico_check">차별성</strong><p>향료를 넣지 않고, 자연의 재료를 사용해 만든 고소한 풍미</p></li><li><strong class="ico_check">활용도</strong><p>아이와 온 가족이 함께 즐기는 영양 간식</p></li></ul>
</div>
<div class="row">
<div class="tit_daily type2">
<div class="md_name">
<span>MD's Comment</span>
<p> MD <strong></strong></p>
</div>
</div>
<p>배는 고프지 않지만 입이 심심한 그 기분, 바로 간식이 필요한 타이밍이죠. 즐거운 간식 시간을 건강하게 만들기 위해 컬리는 우리밀의 과자를 준비했습니다. 식품첨가물을 최소화하고, 국산 재료를 위주로 사용하는 우리밀의 과자는 자극적이지 않아 자꾸만 손이 갑니다. 건강한 재료만을 골라 만든 만큼, 아이들에게 주기도 안심이지요. 그거 아세요? 우리밀의 과자는 아이들을 위해 구매하셨다가 어머님들이 빠져들어 장바구니에 꼭 하나씩 넣으시는 아이템이라는 사실! 오늘 장바구니에는 엄마도 아이도 맛있게 먹을 수 있는 우리밀 과자 하나 담으시면 어떨까요?</p>
</div>
</div>

<div class="">
</div>
<div class="product_box">
<p class="tit_section">우리밀 참깨 꼬소봉 (100g)</p>
<p class="pic"><img src="//img-cf.kurly.com/shop/data/goods/daily/1666bd307157cda2fa24.jpg"></p>
</div>
</div></div>

</div>
<div class="goods-view-infomation-content" id="goods-infomation">
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="extra-information">
<tbody>
<tr>
<th scope="row" class="goods-view-form-table-heading">제품명</th><td>상품 설명 및 상품 이미지 참조</td>
<th scope="row" class="goods-view-form-table-heading">식품의 유형</th><td>상품 설명 및 상품 이미지 참조</td>
</tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">제조원 및 생산자</th><td>상품 설명 및 상품 이미지 참조</td>
<th scope="row" class="goods-view-form-table-heading">소재지</th><td>상품 설명 및 상품 이미지 참조</td>
</tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">제조일/유통기한</th><td>상세정보 및 제품 별도라벨 표기</td>
<th scope="row" class="goods-view-form-table-heading">중량 및 구성</th><td>상품 설명 및 상품 이미지 참조</td>
</tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">원재료 및 함량</th><td>상품 설명 및 상품 이미지 참조</td>
<th scope="row" class="goods-view-form-table-heading">보관방법</th><td>상품 설명 및 상품 이미지 참조</td>
</tr>
<tr>
<th scope="row" class="goods-view-form-table-heading">영양성분</th><td>상품 설명 및 상품 이미지 참조</td>
<th scope="row" class="goods-view-form-table-heading">소비자상담실 전화번호</th><td>마켓컬리 고객행복센터 (1644-1107)</td>
</tr>
</tbody>
</table>

<div class="whykurly_area">
<div class="row">
<strong class="tit_whykurly">WHY KURLY</strong>
<div id="why_kurly" class="txt_area"><div class="why-kurly"><div class="col"><div class="icon"><img src="https://res.kurly.com/pc/ico/1910/01_check.svg"></div> <div class="info"><div class="title">깐깐한 상품위원회</div> <div class="desc"><p>나와 내 가족이 먹고 쓸 상품을 고르는<br>      마음으로 매주 상품을 직접 먹어보고,<br>      경험해보고 성분, 맛, 안정성 등 다각도의<br>      기준을 통과한 상품만을 판매합니다.</p> <!----></div></div></div><div class="col"><div class="icon"><img src="https://res.kurly.com/pc/ico/1910/02_only.svg"></div> <div class="info"><div class="title">차별화된 Kurly Only 상품</div> <div class="desc"><p>전국 각지와 해외의 훌륭한 생산자가<br>      믿고 선택하는 파트너, 마켓컬리.<br>      3천여 개가 넘는 컬리 단독 브랜드, 스펙의<br>      Kurly Only 상품을 믿고 만나보세요.</p> <span class="etc">(온라인 기준 / 자사몰, 직구 제외)</span></div></div></div><div class="col"><div class="icon"><img src="https://res.kurly.com/pc/ico/1910/03_cold.svg"></div> <div class="info"><div class="title">신선한 풀콜드체인 배송</div> <div class="desc"><p>온라인 업계 최초로 산지에서 문 앞까지<br>      상온, 냉장, 냉동 상품을 분리 포장 후<br>      최적의 온도를 유지하는 냉장 배송 시스템,<br>      풀콜드체인으로 상품을 신선하게 전해드립니다.</p> <span class="etc">(샛별배송에 한함)</span></div></div></div><div class="col"><div class="icon"><img src="https://res.kurly.com/pc/ico/1910/04_price.svg"></div> <div class="info"><div class="title">고객, 생산자를 위한 최선의 가격</div> <div class="desc"><p>매주 대형 마트와 주요 온라인 마트의 가격<br>      변동 상황을 확인해 신선식품은 품질을<br>      타협하지 않는 선에서 최선의 가격으로,<br>      가공식품은 언제나 합리적인 가격으로<br>      정기 조정합니다.</p> <!----></div></div></div><div class="col"><div class="icon"><img src="https://res.kurly.com/pc/ico/1910/05_eco.svg"></div> <div class="info"><div class="title">환경을 생각하는 지속 가능한 유통</div> <div class="desc"><p>친환경 포장재부터 생산자가 상품에만<br>      집중할 수 있는 직매입 유통구조까지,<br>      지속 가능한 유통을 고민하며 컬리를 있게<br>      하는 모든 환경(생산자, 커뮤니티, 직원)이<br>      더 나아질 수 있도록 노력합니다.</p> <!----></div></div></div></div></div>
</div>
</div>


<div class="happy_center fst">
<div class="happy">
<h4 class="tit">고객행복센터</h4>
<p class="sub">
<span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span><span class="bar"></span>
문제가 되는 부분을 사진으로 찍어<span class="bar"></span>
아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span>
빠르게 도와드리겠습니다.
</p>
</div>
<ul class="list">
<li>
<div class="tit">전화 문의 1644-1107</div>
<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
</li>
<li>
<div class="tit">카카오톡 문의</div>
<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
<div class="expend">
카카오톡에서 ’마켓컬리’를 검색 후<br>
대화창에 문의 및 불편사항을<br>
남겨주세요.
</div>
</li>
<li>
<div class="tit">홈페이지 문의</div>
<div class="sub">
24시간 접수 가능<br>
로그인 &gt; 마이컬리 &gt; 1:1 문의
</div>
<div class="expend">
고객센터 운영 시간에 순차적으로 답변해드리겠습니다.
</div>
 </li>
</ul>
</div>
<div class="happy_center on">
<div class="happy unfold">
<h4 class="tit">교환 및 환불 안내</h4>
<p class="sub">
교환 및 환불이 필요하신 경우 고객행복센터로 문의해주세요.
</p>
<a data-child-id="refund" href="#none" class="asked">
<span class="txt" data-open="자세히 보기" data-close="닫기">닫기</span>
<img src="https://res.kurly.com/pc/ico/2001/pc_arrow_open@2x.png" alt="아이콘" class="ico">
</a>
</div>
<div class="happy_faq fst">
<span class="item">01. 상품에 문제가 있는 경우</span>
<div id="refund1" class="questions hide"><p class="desc">받으신 상품이 표시·광고 내용 또는 계약 내용과 <span class="bar_m"></span>다른 경우에는 상품을 받은 날부터 3개월 이내, <span class="bar_m bar_pc"></span>그 사실을 알게 된 날부터 30일 이내에 <span class="bar_m"></span>교환 및 환불을 요청하실 수 있습니다.</p><p class="space"></p><p class="desc">상품의 정확한 상태를 확인할 수 있도록 <span class="bar_m"></span>사진을 함께 보내주시면 더 빠른 상담이 가능합니다.</p><p class="noti">※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합니다.</p></div>
</div>
<div class="happy_faq">
<span class="item">02. 단순 변심, 주문 착오의 경우</span>
<div id="refund2" class="questions hide"><strong class="subject no_padding">신선 / 냉장 / 냉동 식품</strong><p class="desc">재판매가 불가한 상품의 특성상, <span class="bar_m"></span>단순 변심, 주문 착오 시 <span class="bar_m"></span>교환 및 반품이 어려운 점 양해 부탁드립니다.</p><p class="space"></p><p class="desc">상품에 따라 조금씩 맛이 다를 수 있으며, <span class="bar_m"></span>개인의 기호에 따라 같은 상품도 다르게 <span class="bar_m"></span>느끼실 수 있습니다.</p><strong class="subject">유통기한 30일 이상 식품 <span class="bar_m"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품</strong><p class="desc">상품을 받은 날부터 7일 이내에 <span class="bar_m"></span>고객행복센터로 문의해주세요.</p><p class="noti">※ 단순 변심으로 인한 교환 또는 환불의 경우 <span class="bar_m"></span>고객님께서 배송비 6,000원을 부담하셔야 합니다. <span class="bar_m bar_pc"></span>(주문 건 배송비를 결제하셨을 경우 3,000원)</p></div>
</div>
<div class="happy_faq">
<span class="item">03. 교환·반품이 불가한 경우</span>
<div id="refund3" class="questions hide"><p class="desc">다음에 해당하는 교환·환불 신청은 <span class="bar_m"></span>처리가 어려울 수 있으니 양해 부탁드립니다.</p><ul class="list_questions"><li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우 <span class="bar_m bar_pc"></span>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</li><li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li><li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li><li>복제가 가능한 상품의 포장이 훼손된 경우</li><li>고객님의 주문에 따라 개별적으로 생산되는 <span class="bar_m"></span>상품의 제작이 이미 진행된 경우</li></ul></div>
</div>
</div>
<div class="happy_center on">
<div class="happy unfold" style="border-top:none;">
<h4 class="tit">주문 취소 안내</h4>
<ul class="sub">
<li>
<strong class="emph">- [입금 확인] 단계</strong>
마이컬리 &gt; 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.
</li>
<li>
<strong class="emph">- [입금 확인] 이후 단계</strong>
고객행복센터로 문의해주세요.
</li>
<li>
<strong class="emph">- 결제 승인 취소 / 환불</strong>
결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.
</li>
</ul>
<a href="#none" class="asked">
<span class="txt" data-open="자세히 보기" data-close="닫기">닫기</span>
<img src="https://res.kurly.com/pc/ico/2001/pc_arrow_open@2x.png" alt="아이콘" class="ico">
</a>
</div>
<div class="happy_faq">
<span class="item">주문 취소 관련</span>
<div class="questions hide">
<p class="desc">- [상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.</p>
<p class="desc">- 비회원은 모바일 App / Web &gt; 마이컬리 &gt; 비회원 주문 조회 페이지에서 주문을 취소하실 수 있습니다.</p>
<p class="desc">- 일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</p>
<p class="desc">- 주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매해 주세요.</p>
</div>
</div>
<div class="happy_faq">
<span class="item">결제 승인 취소 / 환불 관련</span>
<div class="questions hide">
<p class="desc">- 카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에 문의해주세요.</p>
<p class="desc">- 결제 취소 시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.</p>
</div>
</div>
</div>
<div class="happy_center lst">
<div class="happy unfold">
<h4 class="tit">배송관련 안내</h4>
<p class="sub">
배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이 발생될 수 있습니다.
</p>
</div>
</div>

</div>

<div class="goods-view-infomation-content" id="goods-qna">
<div class="board-container">
<div id="productInquiryBoard" data-productno="4415" data-boardpagesize="10" data-boardtype="product" data-devicetype="pc"><div class="board-header-container"><strong>PRODUCT Q&amp;A</strong><ul class="list-description"><li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</li><li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a href="/shop/mypage/mypage_qna.php">1:1 문의</a>에 남겨주세요.</li></ul></div><div class="board-item-container product"><div class="inquiry-board-header"><div style="width: 710px;">제목</div><div>작성자</div><div>작성일</div><div>답변상태</div></div><ul class="inquiry-notice-list"><li class="inquiry-item notice-item"><div class="item-cell notice-cell"><span>공지</span><strong>판매 (일시)중단 제품 안내 (21.11.05 업데이트)</strong></div><div class="item-cell"><p class="txt_sub text_medium normal ">Marketkurly</p></div><div class="item-cell"><p class="txt_sub text_medium normal ">2017.02.01</p></div><div class="item-cell">-</div></li></ul><ul class="board-list"><li class="inquiry-item"><div class="product-detail is-secret"><strong>비밀글입니다.</strong><span class="icon-secret"><span class="screen_out">비밀글</span></span></div><div class="item-cell"><p class="txt_sub text_medium normal ">오*경</p></div><div class="item-cell"><p class="txt_sub text_medium normal ">2021.05.06</p></div><div class="item-cell"><p class="txt_sub kurlyPurple normal ">답변완료</p></div></li><li class="inquiry-item"><div class="product-detail is-secret"><strong>비밀글입니다.</strong><span class="icon-secret"><span class="screen_out">비밀글</span></span></div><div class="item-cell"><p class="txt_sub text_medium normal ">조*라</p></div><div class="item-cell"><p class="txt_sub text_medium normal ">2020.06.08</p></div><div class="item-cell"><p class="txt_sub kurlyPurple normal ">답변완료</p></div></li><li class="inquiry-item"><div class="product-detail "><strong>무염버터 함량</strong></div><div class="item-cell"><p class="txt_sub text_medium normal ">권*신</p></div><div class="item-cell"><p class="txt_sub text_medium normal ">2020.05.27</p></div><div class="item-cell"><p class="txt_sub kurlyPurple normal ">답변완료</p></div></li></ul><div class="board-inquiry-area"><div class="paging-navigation"><button type="button" class="paging-prev" disabled=""><span>이전</span></button><button type="button" class="paging-next" disabled=""><span>다음</span></button></div><button class="btn active"><span>문의하기</span></button></div></div></div>
</div>
</div>
</div>
</div>
<link rel="stylesheet" href="/asset/css/product/inquiry/pc.bundle.css?ver=1.42.6">
<script src="/appProxy/appData.php?ver=1.42.6" defer=""></script>
<script src="/asset/js/product/inquiry/pc.bundle.js?ver=1.42.6" defer=""></script>
<script src="/shop/data/skin/designgj/js/mk_goods.js?ver=1.42.6"></script>
<script src="/common_js/common_filter.js?ver=1.42.6"></script>
<script src="/common_js/view_v1.js?ver=1.42.6"></script>
<script src="/common_js/cartput_v1.js?ver=1.42.6"></script>
<script>
// 상품상세상단호출
var sectionViewDefault = {
    'login' : false,
    'no' : '4415',
    'type' : 'pc'
}
sectionViewDefault.login = true;
sectionView.userInfoGet(sectionViewDefault);

function cartPutLayerTypeShow(){
    var winTop = 0, scrollCheckTop = 0;
    var $target = $('#cartPut .cart_type1');
    $(window).on('scroll', function(){
        scrollCheckTop = Number( $('#goods-view-infomation').offset().top ); // 패키지상품치 위치가 바뀌므로 매번 체크
        winTop = Number( $(this).scrollTop() );
        if(winTop >=scrollCheckTop){
            $target.addClass('on');
        }else{
            $target.removeClass('on');
            if($target.find('.btn_close .ico').hasClass('open')){
                $target.find('.btn_close').trigger('click');
            }
        }
    }).scroll();
}
cartPutLayerTypeShow();
</script>

<script src="https://res.kurly.com/js/lib/jquery.inview.js"></script>
<script>
    // iframe에서 해당 height값가져오는 부분
    function resizeFrameHeight(onm, height) {
        document.getElementById(onm).height = height;
    }
    function resizeFrameWidth(onm, width) {
        document.getElementById(onm).width = width;
    }
    jQuery(function ($) {
        $("#goods-review").bind("inview", function(event,visible) {
            if (visible == true) {
                if ( $(this).data("load")==0 ) {
                    $(this).data("load",1);
                    $(this).html('<iframe id="inreview" src="./goods_review_list.php?goodsno=4415" frameborder="0" class="goods-view-infomation-board"></iframe>');
                }
            }
            $(function(){
                $('#inreview').load(function () {
                    var iframe = $('#inreview').contents();
                    iframe.find(".layout-pagination-button").on('click', function(event) {
                        $('html,body').animate({
                            scrollTop: $("#goods-review").offset().top-115
                        }, 300);
                    });
                });
            });
        });
    });
    // 해당 구역을 경과하면 보여주기 - 2016.01.03 junix
    $( document ).ready(function() {
        // $(window).height() 브라우저 내 창 높이
        // $(document).scrollTop() 현재 스크롤 top 위치
        if (($("#goods-review").offset().top - $(document).scrollTop()) < $(window).height())
        {
            $("#goods-review").data("load", 1);
            $("#goods-review").html('<iframe id="inreview" src="./goods_review_list.php?goodsno=4415" frameborder="0" class="goods-view-infomation-board"></iframe>');
        }

        // 170119 ey
        var slideThumb = $('.goods-add-product-item');
        var slideThumbCnt = 5;

        if(slideThumb.length <= slideThumbCnt){
            $('.goods-add-product-move-right').hide();
            $('.goods-add-product-move-left').hide();
        }
    });

    $(window).load(function(){
        // KM-433 장차석 : 인증서기능추가
        showCertify.pageMake();
        showCertify.init();
    });

    // KMF-771 상품상세 과거 이벤트 페이지 랜더링 이슈
    $('#goods-description a').on('click', function(){
      var httpCheck = $(this).attr('href');
      if(httpCheck.indexOf('http://www.kurly.com') > -1) {
        $(this).attr('href', httpCheck.replace('http://www.kurly.com', ''));
      }
      return true;
    });
</script>

<script src="https://res.kurly.com/js/vue/data/goods/whykurly.js?ver=1.42.6"></script>
<script src="https://res.kurly.com/js/vue/components/listIconTitleDesc.js?ver=1.42.6"></script>

<script src="/common_js/goods/exchangeRefundPolicyPC.js?ver=1.42.6"></script>
<div class="bg_loading" id="bgLoading" style="display: none;">
<div class="loading_show"></div>
</div>
<script src="/common_js/product/productDetail.js?ver=1.42.6"></script>
</div>
</div>

<div id="layerDSR">
<div class="bg_dim"></div>
<div class="in_layer">
<div class="inner_layer layer_star">
<strong class="dsr_result">샛별배송 지역입니다.</strong>
<div class="ani">
<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_kurly.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="샛별배송 이미지">
</div>
<p class="dsr_desc default_cutoff_23_7">
<strong class="emph">오늘 밤 11시 전</strong>까지 주문시<br>
<strong class="emph">다음날 아침 7시</strong> 이전 도착합니다!
</p>
<p class="dsr_desc early_cutoff_20_8">
<strong class="emph">오늘 밤 8시 전</strong>까지 주문시<br>
<strong class="emph">다음날 아침 8시</strong> 이전 도착합니다!
</p>
</div>
<div class="inner_layer layer_normal">
<strong class="dsr_result">택배배송 지역입니다.</strong>
<div class="ani">
<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_car.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="택배배송 이미지">
</div>
<p class="dsr_desc old_eight">
<strong class="emph">밤 8시 전</strong>까지 주문시<br>
<strong class="emph">다음날</strong> 도착합니다!
</p>
<p class="dsr_desc new_ten">
<strong class="emph">밤 10시 전</strong>까지 주문시<br>
<strong class="emph">다음날</strong> 도착합니다!
</p>
<p class="dsr_notice">일요일은 배송 휴무로 토요일에는 주문 불가</p>
</div>
<div class="inner_layer layer_none">
<strong class="dsr_result">배송 불가 지역입니다.</strong>
<div class="ani">
<img data-src="https://res.kurly.com/mobile/img/1908/img_delivery_none.png" src="https://res.kurly.com/mobile/service/common/bg_1x1.png" alt="배송불가 이미지">
</div>
<p class="dsr_desc">
<strong class="emph">도로명 주소</strong>로 검색하셨다면,<br>
<strong class="emph">지번 주소(구 주소)</strong>로 다시 시도해 주세요.
</p>
<p class="dsr_notice">배송지역을 확장하도록 노력하겠습니다!</p>
</div>
<div class="layer_btn1">
<button type="button" class="btn_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();">확인</button>
</div>
<button type="button" class="layer_close" onclick="$('#layerDSR').hide();$(this).parent().find('.inner_layer').hide();"></button>
</div>
</div>
<div id="footer">
<div class="inner_footer">
<div class="footer_cc">
<h2 class="tit_cc">고객행복센터</h2>
<div class="cc_view cc_call">
<h3><span class="tit">1644-1107</span></h3>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_kakao">
<h3><a class="tit" href="#none">카카오톡 문의</a></h3>
<script type="text/javascript">
							$('.cc_kakao .tit').on('click',function(e){
								e.preventDefault();
                KurlyTracker.setAction('select_bottom_kakao_button').sendData();
								$.ajax({
									type: "GET",
									url: apiDomain+'/v1/mypage/asks/confirm/kakao',
									dataType: 'json',
									success: function(data) {
										if(data.data.ok_button_action_url.indexOf('https://api.happytalk.io/') > -1){
											if(confirm('['+data.data.title+'] '+data.data.message)) window.open(data.data.ok_button_action_url,'_blank');
										}else{
											alert(data.data.title+'\n'+data.data.message);
										}
									}
								})
							});
						</script>
<dl class="list">
<dt>365고객센터</dt>
<dd>오전 7시 - 오후 7시</dd>
</dl>
</div>
<div class="cc_view cc_qna">
<h3><a href="#none" onclick="KurlyTrackerLink('/shop/mypage/mypage_qna_register.php?mode=add_qna', 'select_bottom_onebyone_button')" class="tit">1:1 문의</a></h3>
<dl class="list">
<dt>24시간 접수 가능</dt>
<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
</dl>
</div>
<div class="cc_view cc_bulkorder">
<h3><a href="/shop/main/html.php?htmid=mypage/bulk_order.htm" class="tit">대량주문 문의</a></h3>
<p class="txt">비회원의 경우 메일로 문의 바랍니다.</p>
</div>
</div>
<div class="company">
<ul class="list">
<li><a class="link" href="/shop/introduce/about_kurly.php">컬리소개</a></li>
<li><a class="link" href="https://www.youtube.com/embed/WEep7BcboMQ?rel=0&amp;showinfo=0&amp;wmode=opaque&amp;enablejsapi=1" onclick="window.open(this.href, 'pop', 'width=1330,height=660,scrollbars=yes');return false;">컬리소개영상</a></li>
<li><a class="link" href="https://marketkurly.recruiter.co.kr/appsite/company/index" target="_blank">인재채용</a></li>
<li><a class="link" href="/shop/service/agreement.php">이용약관</a></li>
<li><a class="link emph" href="/shop/service/private.php">개인정보처리방침</a></li>
<li><a class="link" href="/shop/service/guide.php">이용안내</a></li>
</ul>
법인명 (상호) : 주식회사 컬리 <span class="bar">I</span> 사업자등록번호 : 261-81-23567 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2618123567&amp;apv_perm_no=" target="_blank" class="link">사업자정보 확인</a>
<br>
통신판매업 : 제 2018-서울강남-01646 호 <span class="bar">I</span> 개인정보보호책임자 : 이원준
<br>
주소 : 서울특별시 강남구 테헤란로 133, 18층(역삼동) <span class="bar">I</span> 대표이사 : 김슬아
<br>
입점문의 : <a href="https://forms.gle/oKMAe1SaicqMX3SC9" target="_blank" class="link">입점문의하기</a> <span class="bar">I</span> 제휴문의 : <a href="mailto:business@kurlycorp.com" class="link">business@kurlycorp.com</a>
<br>
채용문의 : <a href="mailto:recruit@kurlycorp.com" class="link">recruit@kurlycorp.com</a>
<br>
팩스: 070 - 7500 - 6098 <span class="bar">I</span> 이메일 : <a href="mailto:help@kurlycorp.com" class="link">help@kurlycorp.com</a>
<br>
대량주문 문의 : <a href="mailto:kurlygift@kurlycorp.com" class="link">kurlygift@kurlycorp.com</a>
<em class="copy">© KURLY CORP. ALL RIGHTS RESERVED</em>
<ul class="list_sns">
<li>
<a href="https://instagram.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="마켓컬리 인스타그램 바로가기"></a>
</li>
<li>
<a href="https://www.facebook.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="마켓컬리 페이스북 바로가기"></a>
</li>
<li>
<a href="http://blog.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="마켓컬리 네이버블로그 바로가기"></a>
</li>
<li>
<a href="https://m.post.naver.com/marketkurly" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
<li>
<a href="https://www.youtube.com/channel/UCfpdjL5pl-1qKT7Xp4UQzQg" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기"></a>
</li>
</ul>
</div>
</div>
<div class="footer_link">
<div class="authentication">
<a href="#none" onclick="popup('https://res.kurly.com/pc/img/1909/img_isms.jpg',550,700);return false;" class="mark" target="_blank">
<img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
<p class="txt">
[인증범위] 마켓컬리 쇼핑몰 서비스 개발 · 운영<br>
[유효기간] 2019.04.01 ~ 2022.03.31
</p>
</a>
<a href="#none" onclick="popup('https://www.eprivacy.or.kr/front/certifiedSiteMark/certifiedSiteMarkPopup.do?certCmd=EP&amp;certNum=2021-EP-R003',527,720);return false;" class="mark" target="_blank">
<img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
<p class="txt">
개인정보보호 우수 웹사이트 ·<br>
개인정보처리시스템 인증 (ePRIVACY PLUS)
</p>
</a>
<a href="#none" onclick="popup('http://pgweb.uplus.co.kr/ms/escrow/s_escrowYn.do?mertid=go_thefarmers',460,550);return false;" class="mark lguplus" target="_blank">
<img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
<p class="txt">
고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
</p>
</a>
</div>
</div>
</div>
</div>
</div><iframe name="xdomain-fb827f9e" id="xdomain-fb827f9e" src="https://api.kurly.com/xdomain?ver=1" style="display:none;"></iframe>

<a href="#top" id="pageTop" class="on" style="opacity: 1; bottom: 25px;">맨 위로가기</a>
<script>
	$(document).ready(function(){
		var pageTop = {
			$target : $('#pageTop'),
			$targetDefault : 0,
			$scrollTop : 0,
			$window : $(window),
			$windowHeight : 0,
			setTime : 500,
			saveHeight : 0,
			init:function(){
			},
			action:function(){
				var $self = this;
				$self.$windowHeight = parseInt($self.$window.height());
				$self.$window.on('scroll', function(){
					$self.$scrollTop = parseInt($self.$window.scrollTop());
					if($self.$scrollTop >= $self.$windowHeight){
						if(!$self.$target.hasClass('on')){
							$self.position();
							$self.$target.addClass('on');
							$self.showAction();
						}
					}else{
						if($self.$target.hasClass('on')){
							$self.position();
							$self.$target.removeClass('on');
							$self.hideAction();
						}
					}
				});

				$self.$target.on('click', function(e){
					e.preventDefault();
					$self.topAction();
				});
			},
			showAction:function(){
				var $self = this;
				$self.$target.stop().animate({
					opacity:1,
					bottom:$self.saveHeight
				}, $self.setTime);
			},
			hideAction:function(){
				var $self = this;
				$self.$target.stop().animate({
					opacity:0,
					bottom:-$self.$target.height()
				}, $self.setTime);
			},
			topAction:function(){
				var $self = this;
				$self.hideAction();
				$('html,body').animate({
					scrollTop:0
				}, $self.setTime);
			},
			position:function(){
				var $self = this;
				$self.saveHeight = 15;
				if($('#sectionView').length > 0){
					$self.saveHeight = 25;
				}
				if($('#branch-banner-iframe').length > 0 && parseInt( $('#branch-banner-iframe').css('bottom') ) > 0){
					$('#footer').addClass('bnr_app');
					$self.saveHeight += $('#branch-banner-iframe').height();
				}
			}
		}
		pageTop.action();
	});
</script>

<script>
// 클릭인인경우(푸터에 있으나, 아직공용작업은 못함) => bgLoading 이부분 처리필요
var bodyScroll = {
	winScrollTop : 0,
	body : $('body'),
	gnb : $('#gnb'),
	bg : $('#bgLoading'),
	bodyFixed : function(){
		var $self = this;
		var gnbCheck = false;
		$self.gnb = $('#gnb');
		if($self.gnb.hasClass('gnb_stop')){
			gnbCheck = true;
		}
		$self.body = $('body');
		$self.bg = $('#bgLoading');
		$self.winScrollTop = $(window).scrollTop();
		$self.bg.show();
		$self.body.addClass('noBody').css({
			'top' : -$self.winScrollTop
		});
	},
	bodyDefault : function(type){
		var $self = this;
		$self.body.removeClass('noBody').removeAttr('style');
		$self.bg.hide();
		if(type === undefined){
			window.scrollTo(0, $self.winScrollTop);
		}
	}
}
</script>

<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display:none;width:100%;height:600px;"></iframe>
<script>
(function (theFrame) {
  theFrame.contentWindow.location.href = theFrame.src;
}(document.getElementById("ifrmHidden")));
</script>


<script src="https://res.kurly.com/js/polifill/customeEvent.js"></script>
<script>
	window.addEventListener('load', function () {
		!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,document,'script','//connect.facebook.net/en_US/fbevents.js');

		fbq('init', '526625657540055');
		fbq('track', "PageView");
		// PixelReady
		var _eventPixelReady = new CustomEvent("pixelReady", {
			detail:{ // 전달 할께 있으면 반드시 detail 오브젝트에 넣어야 함
				val:'1',
			}
		});
		document.dispatchEvent(_eventPixelReady);
	}, false);
</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=526625657540055&ev=PageView&noscript=1"></noscript>


</body></html>