/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
<<<<<<< HEAD
 * Generated at: 2021-11-17 12:25:42 UTC
=======
 * Generated at: 2021-11-16 08:41:31 UTC
>>>>>>> main
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.user.default_;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/secondk/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/marketKurlyty/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1632676361414L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("	$.ajax({\r\n");
      out.write("		url:\"categoryData.do\",\r\n");
      out.write("		dataType:\"JSON\",\r\n");
      out.write("		beforeSend: function (xhr) {\r\n");
      out.write("            xhr.setRequestHeader(\"Content-type\",\"application/json\");\r\n");
      out.write("        },\r\n");
      out.write("		success:function(data){\r\n");
      out.write("			//var data=JSON.parse(res);\r\n");
      out.write("			for(key in data){\r\n");
      out.write("				var rink = \"categoryGoods.do?category_main_serial=\"+data[key].category_main_serial;\r\n");
      out.write("				$(\".gnb_sub ul.gnb_menu\").\r\n");
      out.write("				append(\"<li class=\"+data[key].category_main_serial+\"><a href=\"+rink+\" class='menu'><span class='icon'><img src='\"+data[key].category_main_icon_black+\"' class='icon_on'>\"+\r\n");
      out.write("						\"<img src='\"+data[key].category_main_icon_color+\"' class='icon_off'></span>\"+\r\n");
      out.write("						\"<span class='name'>\"+data[key].category_main_name+\"</span></a></li>\");\r\n");
      out.write("				$(\".gnb_sub ul.gnb_menu\").find(\"li.\"+data[key].category_main_serial).append(\"<ul class='sub'></ul>\");\r\n");
      out.write("				for(sub in data[key].data){\r\n");
      out.write("					var parentSerial = \"categoryGoods.do?category_main_serial=\"+data[key].category_main_serial+\"&category_sub_serial=\"+data[key].data[sub].category_sub_serial;\r\n");
      out.write("					$(\"ul.gnb_menu li.\"+data[key].category_main_serial).find(\"ul\").\r\n");
      out.write("					append(\"<li><a class='sub' href=\"+parentSerial+\"><span>\"+data[key].data[sub].category_sub_name).\r\n");
      out.write("					append(\"</span></a></li>\")\r\n");
      out.write("				}\r\n");
      out.write("				$(\"#categoryMain li\").mouseover(function(){\r\n");
      out.write("					$(this).css(\"background\",\"#efebf0\");\r\n");
      out.write("					$(this).find(\"img:eq(0)\").attr(\"class\",\"icon_off\");\r\n");
      out.write("					$(this).find(\"img:eq(1)\").attr(\"class\",\"icon_on\");\r\n");
      out.write("					$(this).find(\".name\").css(\"color\",\"#8700a8\");\r\n");
      out.write("					$(this).find(\"ul\").attr(\"class\", \"sub_on\");\r\n");
      out.write("					$(\".gnb_sub\").css(\"width\",\"438\");\r\n");
      out.write("					$(\"#categoryMain ul.sub_on\").find(\"li\").mouseover(function(){\r\n");
      out.write("						$(this).attr(\"class\",\"on\");\r\n");
      out.write("					});\r\n");
      out.write("					$(\"#categoryMain ul.sub_on\").find(\"li\").mouseleave(function(){\r\n");
      out.write("						$(this).attr(\"class\",\"\");\r\n");
      out.write("					});\r\n");
      out.write("				});\r\n");
      out.write("				$(\"#categoryMain li\").mouseleave(function(){\r\n");
      out.write("					$(this).css(\"background\",\"none\");\r\n");
      out.write("					$(this).find(\"img:eq(0)\").attr(\"class\",\"icon_on\");\r\n");
      out.write("					$(this).find(\"img:eq(1)\").attr(\"class\",\"icon_off\");\r\n");
      out.write("					$(this).find(\".name\").css(\"color\",\"black\");\r\n");
      out.write("					$(this).find(\"ul\").attr(\"class\",\"sub\");\r\n");
      out.write("					$(\".gnb_sub\").css(\"width\",\"219\");\r\n");
      out.write("					$(\"#categoryMain ul.sub_on\").find(\"li\").mouseover(function(){\r\n");
      out.write("						$(this).attr(\"class\",\"on\");\r\n");
      out.write("					});\r\n");
      out.write("					$(\"#categoryMain ul.sub_on\").find(\"li\").mouseleave(function(){\r\n");
      out.write("						$(this).attr(\"class\",\"\");\r\n");
      out.write("					});\r\n");
      out.write("				});\r\n");
      out.write("				$(\"#categoryMain ul.sub_on\").mouseover(function(){\r\n");
      out.write("					$(this).attr(\"class\",\"on\");\r\n");
      out.write("				});\r\n");
      out.write("				$(\"#categoryMain ul.sub_on\").mouseleave(function(){\r\n");
      out.write("					$(this).attr(\"class\",\"\");\r\n");
      out.write("				});\r\n");
      out.write("			}\r\n");
      out.write("		},\r\n");
      out.write("		error:function(res,error){\r\n");
      out.write("			alert(res);\r\n");
      out.write("			alert(error);\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("	});\r\n");
      out.write("	$(\".menu1\").hover(function(){\r\n");
      out.write("		$(\".gnb_sub\").css(\"display\",\"block\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\".menu1\").mouseleave(function(){\r\n");
      out.write("		$(\".gnb_sub\").css(\"display\",\"none\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\".gnb_sub\").hover(function(){\r\n");
      out.write("		$(this).css(\"display\",\"block\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\".gnb_sub\").mouseleave(function(){\r\n");
      out.write("		$(this).css(\"display\",\"none\");\r\n");
      out.write("	});\r\n");
      out.write("	\r\n");
      out.write("	$(\"#userMenu .menu_user\").hover(function(){\r\n");
      out.write("		$(this).find(\".sub\").css(\"display\",\"block\").css(\"opacity\",\"1\");\r\n");
      out.write("		$(this).find(\".sub\").css(\"height\",\"225px\").css(\"z-index\",\"200\").css(\"position\",\"absolute\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\"#userMenu .menu_user\").mouseleave(function(){\r\n");
      out.write("		$(this).find(\".sub\").css(\"display\",\"none\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\"#userMenu .lst\").hover(function(){\r\n");
      out.write("		$(this).find(\".sub\").css(\"display\",\"block\").css(\"opacity\",\"1\");\r\n");
      out.write("		$(this).find(\".sub\").css(\"height\",\"156px\").css(\"z-index\",\"200\").css(\"position\",\"absolute\");\r\n");
      out.write("	});\r\n");
      out.write("	$(\"#userMenu .lst\").mouseleave(function(){\r\n");
      out.write("		$(this).find(\".sub\").css(\"display\",\"none\");\r\n");
      out.write("	});\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("	\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write(".icon_off {\r\n");
      out.write("	display: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".icon_on {\r\n");
      out.write("	display: block;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".gnb_sub ul.gnb_menu .icon {\r\n");
      out.write("	float: left;\r\n");
      out.write("	width: 24px;\r\n");
      out.write("	height: 24px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".gnb_sub ul.gnb_menu .name{\r\n");
      out.write("	float: left;\r\n");
      out.write("	width: 140px;\r\n");
      out.write("	height: 24px;\r\n");
      out.write("	font-family: sans-serif;\r\n");
      out.write("	font-weight: bold;\r\n");
      out.write("	font-size: 13px;\r\n");
      out.write("	line-height: 1.7;\r\n");
      out.write("	margin-left:5px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".gnb_sub ul.gnb_menu li {\r\n");
      out.write("	text-align: left;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("ul.sub {\r\n");
      out.write("	position:absolute;\r\n");
      out.write("	z-index:0;\r\n");
      out.write("	left:200px;\r\n");
      out.write("	top:0px;\r\n");
      out.write("	width:248px;\r\n");
      out.write("	height:100%;\r\n");
      out.write("	padding: 0 0 0 20px;\r\n");
      out.write("	opacity:0;\r\n");
      out.write("	transition:opacity 0.2s;\r\n");
      out.write("}\r\n");
      out.write("ul.sub_on{\r\n");
      out.write("	position:absolute;\r\n");
      out.write("	z-index:1;\r\n");
      out.write("	left:200px;\r\n");
      out.write("	top:0px;\r\n");
      out.write("	width:248px;\r\n");
      out.write("	height:100%;\r\n");
      out.write("	padding: 0 0 0 20px;\r\n");
      out.write("	opacity:1;\r\n");
      out.write("	transition:opacity 0.5s;\r\n");
      out.write("}\r\n");
      out.write(".gnb_sub ul.gnb_menu li ul li {\r\n");
      out.write("	width: 100px;\r\n");
      out.write("	height: 24px;\r\n");
      out.write("	margin-left: 10px;\r\n");
      out.write("	font-family: sans-serif;\r\n");
      out.write("	font-weight: bold;\r\n");
      out.write("	font-size: 14px;\r\n");
      out.write("	line-height: 2;\r\n");
      out.write("}\r\n");
      out.write("ul.sub_on li.on{\r\n");
      out.write("	text-decoration:underline;\r\n");
      out.write("	color:#8700a8;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<div id=\"header\">\r\n");
      out.write("	<!-- 헤더부분 -->\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"bnr_header\" id=\"top-message\">\r\n");
      out.write("		<a\r\n");
      out.write("			href=\"https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_211006\"\r\n");
      out.write("			id=\"eventLanding\"> 지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img\r\n");
      out.write("			src=\"https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png\"\r\n");
      out.write("			class=\"bnr_arr\">\r\n");
      out.write("			<div class=\"bnr_top\">\r\n");
      out.write("				<div class=\"inner_top_close\">\r\n");
      out.write("					<button id=\"top-message-close\" class=\"btn_top_bnr\">가입하고\r\n");
      out.write("						혜택받기</button>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</a>\r\n");
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("	<!-- 우측 최상단 메뉴 -->\r\n");
      out.write("	<div id=\"userMenu\">\r\n");
      out.write("		<ul class=\"list_menu\">\r\n");
      out.write("			");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("			");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("			<!---->\r\n");
      out.write("			<li class=\"menu lst\"><a href=\"notice.do\"\r\n");
      out.write("				class=\"link_menu\">고객센터</a>\r\n");
      out.write("				<ul class=\"sub\">\r\n");
      out.write("					<li><a href=\"notice.do\">공지사항</a>\r\n");
      out.write("					</li>\r\n");
      out.write("					<li><a href=\"faq.do\">자주하는\r\n");
      out.write("							질문</a></li>\r\n");
      out.write("					<li><a href=\"personalQnaBoard.do\">1:1\r\n");
      out.write("							문의</a></li>\r\n");
      out.write("					<li><a href=\"#none\"\r\n");
      out.write("						onclick=\"KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')\">대량주문\r\n");
      out.write("							문의</a></li>\r\n");
      out.write("					<li><a href=\"#none\"\r\n");
      out.write("						onclick=\"KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')\">상품\r\n");
      out.write("							제안</a></li>\r\n");
      out.write("					<li><a href=\"#none\"\r\n");
      out.write("						onclick=\"KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')\">에코포장\r\n");
      out.write("							피드백</a></li>\r\n");
      out.write("				</ul></li>\r\n");
      out.write("		</ul>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<div id=\"headerLogo\" class=\"layout-wrapper\">\r\n");
      out.write("		<h1 class=\"logo\">\r\n");
      out.write("			<a href=\"index.do\" class=\"link_main\"> <span\r\n");
      out.write("				id=\"gnbLogoContainer\"></span> <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/images/logo.png\"\r\n");
      out.write("				alt=\"마켓컬리 로고\">\r\n");
      out.write("			</a>\r\n");
      out.write("		</h1>\r\n");
      out.write("		<a href=\"/shop/board/view.php?id=notice&no=64\"\r\n");
      out.write("			onclick=\"ga('send','event','etc','main_gif_btn_click');\"\r\n");
      out.write("			class=\"bnr_delivery\"> <img\r\n");
      out.write("			src=\"https://res.kurly.com/pc/service/common/2011/delivery_210801.png\"\r\n");
      out.write("			alt=\"샛별, 택배 배송안내\" width=\"121\" height=\"22\">\r\n");
      out.write("		</a>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div id=\"gnb\">\r\n");
      out.write("		<h2 class=\"screen_out\">메뉴</h2>\r\n");
      out.write("		<div id=\"gnbMenu\" class=\"gnb_kurly\">\r\n");
      out.write("			<div class=\"inner_gnbkurly\">\r\n");
      out.write("				<div class=\"gnb_main\">\r\n");
      out.write("					<ul class=\"gnb\">\r\n");
      out.write("						<li class=\"menu1\" class=\"on\"><a href=\"#none\"><span\r\n");
      out.write("								class=\"ico\"></span><span class=\"txt\">전체 카테고리</span></a></li>\r\n");
      out.write("						<li class=\"menu2\"><a class=\"link new \"\r\n");
      out.write("							href=\"newGoodsPage.do\"><span class=\"txt\">신상품</span></a></li>\r\n");
      out.write("						<li class=\"menu3\"><a class=\"link best \" href=\"BestGoodsPage.do\"><span\r\n");
      out.write("								class=\"txt\">베스트</span></a></li>\r\n");
      out.write("						<li class=\"menu4\"><a class=\"link bargain \"\r\n");
      out.write("							href=\"altleShopping.do\"><span class=\"txt\">알뜰쇼핑</span></a></li>\r\n");
      out.write("						<li class=\"lst\"><a class=\"link event \"\r\n");
      out.write("							href=\"/shop/goods/event.php?&\"><span class=\"txt\">특가/혜택</span></a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("					<div id=\"side_search\" class=\"gnb_search\">\r\n");
      out.write("						<form action=\"/shop/goods/goods_search.php?&\"\r\n");
      out.write("							onsubmit=\"return searchTracking(this)\">\r\n");
      out.write("							<input type=hidden name=searched value=\"Y\"> <input\r\n");
      out.write("								type=hidden name=log value=\"1\"> <input type=hidden\r\n");
      out.write("								name=skey value=\"all\"> <input type=\"hidden\"\r\n");
      out.write("								name=\"hid_pr_text\" value=\"\"> <input type=\"hidden\"\r\n");
      out.write("								name=\"hid_link_url\" value=\"\"> <input type=\"hidden\"\r\n");
      out.write("								id=\"edit\" name=\"edit\" value=\"\"> <input name=\"sword\"\r\n");
      out.write("								type=\"text\" id=\"sword\" class=\"inp_search\" value=\"\" required\r\n");
      out.write("								label=\"검색어\" placeholder=\"검색어를 입력해주세요.\"> <input\r\n");
      out.write("								type=image\r\n");
      out.write("								src=\"https://res.kurly.com/pc/service/common/1908/ico_search_x2.png\"\r\n");
      out.write("								class=\"btn_search\">\r\n");
      out.write("							<div class=\"init\">\r\n");
      out.write("								<button type=\"button\" class=\"btn_delete\" id=\"searchInit\">검색어\r\n");
      out.write("									삭제하기</button>\r\n");
      out.write("							</div>\r\n");
      out.write("						</form>\r\n");
      out.write("\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"cart_count\">\r\n");
      out.write("						<div class=\"inner_cartcount\">\r\n");
      out.write("							<a href=\"cartPage.do\" class=\"btn_cart\"> <span\r\n");
      out.write("								class=\"screen_out\">장바구니</span> <span\r\n");
      out.write("								class=\"num realtime_cartcount\" id=\"cart_item_count\"></span>\r\n");
      out.write("							</a>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div id=\"addMsgCart\" class=\"msg_cart\">\r\n");
      out.write("							<span class=\"point\"></span>\r\n");
      out.write("							<div class=\"inner_msgcart\">\r\n");
      out.write("								<img src=\"https://res.kurly.com/images/common/bg_1_1.gif\" alt=\"\"\r\n");
      out.write("									class=\"thumb\">\r\n");
      out.write("								<p id=\"msgReaddedItem\" class=\"desc\">\r\n");
      out.write("									<span class=\"tit\"></span> <span class=\"txt\"> 장바구니에 상품을\r\n");
      out.write("										담았습니다. <span class=\"repeat\">이미 담으신 상품이 있어 추가되었습니다.</span>\r\n");
      out.write("									</span>\r\n");
      out.write("								</p>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"location_set\">\r\n");
      out.write("						<button type=\"button\" class=\"btn_location on\">배송지 설정하기</button>\r\n");
      out.write("						<div class=\"layer_location\" style=\"display: none\"></div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("				<div class=\"gnb_sub\">\r\n");
      out.write("					<div class=\"inner_sub\">\r\n");
      out.write("						<ul id=\"categoryMain\"\r\n");
      out.write("							class=\"gnb_menu size_over\" style=\"height: 200.833px;\">\r\n");
      out.write("							<!-- <li class=\"\"><a class=\"menu on\"><span class=\"ico\"><img\r\n");
      out.write("										src=\"https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png\"\r\n");
      out.write("										alt=\"카테고리 아이콘\" class=\"ico_off\"> <img\r\n");
      out.write("										src=\"https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png\"\r\n");
      out.write("										alt=\"카테고리 아이콘\" class=\"ico_on\"></span> <span class=\"tit\"><span\r\n");
      out.write("										class=\"txt\">채소</span></span></a>\r\n");
      out.write("								<ul class=\"sub_menu\">\r\n");
      out.write("									<li class=\"\"><a class=\"sub\"><span class=\"name\">친환경</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">고구마·감자·당근</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">시금치·쌈채소·나물</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">브로콜리·파프리카·양배추</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">양파·대파·마늘·배추</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">오이·호박·고추</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">냉동·이색·간편채소</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">콩나물·버섯</span></a></li>\r\n");
      out.write("								</ul></li>\r\n");
      out.write("							<li class=\"\"><a class=\"menu\"><span class=\"ico\"><img\r\n");
      out.write("										src=\"https://img-cf.kurly.com/shop/data/category/icon_fruit_inactive_pc@2x.1568684150.png\"\r\n");
      out.write("										alt=\"카테고리 아이콘\" class=\"ico_off\"> <img\r\n");
      out.write("										src=\"https://img-cf.kurly.com/shop/data/category/icon_fruit_active_pc@2x.1568684150.png\"\r\n");
      out.write("										alt=\"카테고리 아이콘\" class=\"ico_on\"></span> <span class=\"tit\"><span\r\n");
      out.write("										class=\"txt\">과일·견과·쌀</span></span></a>\r\n");
      out.write("								<ul class=\"sub_menu\">\r\n");
      out.write("									<li class=\"\"><a class=\"sub\"><span class=\"name\">친환경</span></a>\r\n");
      out.write("										</li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">제철과일</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">국산과일</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">수입과일</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">간편과일</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">냉동·건과일</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">견과류</span></a></li>\r\n");
      out.write("									<li><a class=\"sub\"><span class=\"name\">쌀·잡곡</span></a></li>\r\n");
      out.write("								</ul>\r\n");
      out.write("							</li> -->\r\n");
      out.write("						</ul>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("</div>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/user/default/header.jsp(187,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userId eq null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("				<li class=\"menu none_sub menu_join\"><a\r\n");
          out.write("					href=\"join.do\" class=\"link_menu\">회원가입</a></li>\r\n");
          out.write("				<li class=\"menu none_sub menu_login\"><a\r\n");
          out.write("					href=\"login.do\" class=\"link_menu\">로그인</a> <!----></li>\r\n");
          out.write("			");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/user/default/header.jsp(193,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userId != null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("				<li class=\"menu menu_user\"><a class=\"link_menu grade_comm\" href=\"mykurly.do\"><span\r\n");
          out.write("						class=\"ico_grade grade6\">웰컴</span> <span class=\"txt\"><span\r\n");
          out.write("							class=\"name\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userName }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</span><span class=\"sir\">님</span></span> <!----></a>\r\n");
          out.write("					<ul class=\"sub\">\r\n");
          out.write("						<li><a href=\"/shop/mypage/mypage_orderlist.php\">주문 내역</a></li>\r\n");
          out.write("						<li><a href=\"#none\"\r\n");
          out.write("							onclick=\"KurlyTrackerLink('/shop/mypage/mypage_gift.php', 'select_my_kurly_gift_list')\">선물\r\n");
          out.write("								내역</a></li>\r\n");
          out.write("						<li><a href=\"#none\"\r\n");
          out.write("							onclick=\"KurlyTrackerLink('/shop/mypage/destination/list.php', 'select_shipping_address_list')\">배송지\r\n");
          out.write("								관리</a></li>\r\n");
          out.write("						<li><a href=\"/shop/mypage/mypage_review.php\">상품 후기</a></li>\r\n");
          out.write("						<li><a>상품 문의</a></li>\r\n");
          out.write("						<li><a href=\"#none\"\r\n");
          out.write("							onclick=\"KurlyTrackerLink('/shop/mypage/mypage_emoney.php', 'select_my_kurly_point_history', {selection_type: 'dropdown'})\">적립금</a>\r\n");
          out.write("							<!----></li>\r\n");
          out.write("						<li><a href=\"#none\"\r\n");
          out.write("							onclick=\"KurlyTrackerLink('/shop/mypage/mypage_coupon.php', 'select_my_kurly_coupon_list', {selection_type: 'dropdown'})\">쿠폰</a>\r\n");
          out.write("							<!----></li>\r\n");
          out.write("						<li><a href=\"infoModify1.do\">개인 정보 수정</a></li>\r\n");
          out.write("						<li><a href=\"logoutProc.do\">로그아웃</a></li>\r\n");
          out.write("					</ul></li>\r\n");
          out.write("			");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }
}
