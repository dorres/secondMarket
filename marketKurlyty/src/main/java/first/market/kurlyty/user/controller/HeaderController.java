package first.market.kurlyty.user.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.s3.AwsS3;
import first.market.kurlyty.user.service.HeaderService;
import first.market.kurlyty.user.service.RecipeService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.RecipeVO;
import first.market.kurlyty.vo.BannerVO;
import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.CategorySubVO;
import first.market.kurlyty.vo.ProductVO;



@Controller
public class HeaderController {
//	@Autowired
//	private JdbcTemplate jdbc;

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AwsS3 awsS3;
	@Autowired
	private HeaderService headerService;
	@Autowired
	private UserService userService;
	@Autowired
	private RecipeService recipeService;
	
	@RequestMapping(value="categoryData.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<CategoryMainVO> getCategory() {

		List<CategoryMainVO> categoryMainList = headerService.getCategoryMain();
		for(CategoryMainVO cm:categoryMainList) {
			List<CategorySubVO> categorySub=sqlSession.selectList("CategoryDAO.getCategorySub",cm);
			cm.setData(categorySub);
			//System.out.println(cm.getCategory_main_name());
		}
		//System.out.println(jsonCategory);
		//return new Gson().toJson(categoryMainList);
		return categoryMainList;
	}
	
	@RequestMapping("categoryItemPage.do")
	public String categoryGoods(ProductVO product, Model model) {
		if(product.getSort()==null||product.getSort()=="") {
			product.setSort("0");
		}

		List<ProductVO> categoryProductList = headerService.getCategoryProduct(product);
		for(ProductVO products:categoryProductList) {
			if(products.getGoods_detail_promotion_serial()>0) {
				products.setGoods_detail_dicountrate(products.getGoods_detail_dicountrate()+(10*products.getGoods_detail_promotion_serial()));
			}
			products.setCategory_goods_name(products.getCategory_goods_name().replaceAll("'", "`"));
		}
		CategoryMainVO categoryRoot = sqlSession.selectOne("CategoryDAO.getCategoryRoot",product);
		List<CategorySubVO> categorySub = sqlSession.selectList("CategoryDAO.getCategorySub",categoryRoot);
		
		model.addAttribute("categoryProductList",categoryProductList);
		model.addAttribute("categoryRoot",categoryRoot);
		model.addAttribute("categorySub",categorySub);
		model.addAttribute("mainSerial", product.getCategory_main_serial());
		model.addAttribute("subSerial",product.getCategory_sub_serial());
		model.addAttribute("itemCount",categoryProductList.size());
		model.addAttribute("sort", product.getSort());
		return "mainPage/categoryGoods";
	}
	
	@RequestMapping("/index.do")
	public String index(Model model) {
		List<BannerVO> banner = headerService.getBanner();
		List<ProductVO> hotDeal = headerService.getHotDealProduct();
		List<ProductVO> howAbout = headerService.getNewGoods();
		model.addAttribute("banners", banner);
		model.addAttribute("bannerCount", banner.size());
		model.addAttribute("hotDeal",hotDeal);
		model.addAttribute("howAbout",howAbout);
		return "mainPage/index";
	}
	@RequestMapping("/BestItemPage.do")
	public String BestGoods(String sort, Model model) {
		List<ProductVO> bestList = headerService.getBestPage(sort);
		for(ProductVO best:bestList) {
			if(best.getGoods_detail_promotion_serial()>0) {
				best.setGoods_detail_dicountrate(best.getGoods_detail_dicountrate()+(10*best.getGoods_detail_promotion_serial()));
			}
			best.setCategory_goods_name(best.getCategory_goods_name().replaceAll("'", "`"));
		}
		model.addAttribute("bestList",bestList);
		model.addAttribute("sort",sort);
		return "mainPage/BestGoodsPage"; 
	}
	@RequestMapping("/newItemPage.do")
	public String newGoodsPage(String sort,Model model) {
		List<ProductVO> newGoodsList = headerService.getNewGoodsPage(sort);
		for(ProductVO newItem:newGoodsList) {
			if(newItem.getGoods_detail_promotion_serial()>0) {
				newItem.setGoods_detail_dicountrate(newItem.getGoods_detail_dicountrate()+(10*newItem.getGoods_detail_promotion_serial()));
			}
			newItem.setCategory_goods_name(newItem.getCategory_goods_name().replaceAll("'", "`"));
		}
		model.addAttribute("newGoodsList",newGoodsList);
		model.addAttribute("sort",sort);
		return "mainPage/newGoodsPage"; 
	}
	@RequestMapping("/altleItemPage.do")
	public String altleShopping(String sort, Model model) {
		List<ProductVO> altleList = headerService.getAltlePage(sort);
		for(ProductVO altle:altleList) {
			if(altle.getGoods_detail_promotion_serial()>0) {
				altle.setGoods_detail_dicountrate(altle.getGoods_detail_dicountrate()+(10*altle.getGoods_detail_promotion_serial()));
			}
			altle.setCategory_goods_name(altle.getCategory_goods_name().replaceAll("'", "`"));
		}
		model.addAttribute("altleList", altleList);
		model.addAttribute("sort",sort);
		return "mainPage/altleShopping"; 
	}
	@RequestMapping("/recipeItemPage.do")
	public String recipeItemPage(Model model) {
		List<List<RecipeVO>> recipeList = recipeService.getRecipeList();
		model.addAttribute("recipeList",recipeList);
		return "mainPage/recipe";
	}
	@RequestMapping("/searchItemPage.do")
	public String searchItemPage(String searchKeyword,Model model) {
		List<ProductVO> searchList = headerService.getSearchGoods(searchKeyword);
		for(ProductVO search:searchList) {
			search.setCategory_goods_name(search.getCategory_goods_name().replaceAll("'", "`"));
		}
		model.addAttribute("searchList",searchList);
		model.addAttribute("searchKeyword", searchKeyword);
		return "mainPage/searchGoodsPage";
	}
	
	
	@RequestMapping("/recipeBookItemPage.do")
	public String recipeBookPage(int recipe_serial, Model model) {
		RecipeVO recipeBook = recipeService.getRecipeBook(recipe_serial);
		List<ItemPageVO> ingredList = recipeService.getIngredient(recipeBook);
		for(ItemPageVO ingred:ingredList) {
			if(ingred!=null) {
				ingred.setCategory_goods_name(ingred.getCategory_goods_name().replaceAll("'", "`"));
			}
		}
		model.addAttribute("recipeBook", recipeBook);
		model.addAttribute("ingredList",ingredList);
		return "mainPage/recipeBook";
	}
	
	@RequestMapping(value="recipeSearchItemPage.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<ProductVO> getRecipeSearch(String search){
		List<ProductVO> list = recipeService.getRecipeSearch(search);
		for(ProductVO product:list) {
			product.setCategory_goods_name(product.getCategory_goods_name().replaceAll("'", "`"));
		}
		return list;
	}
	
}
