package first.market.kurlyty.user.controller;

import java.io.File;
import java.util.List;

import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.s3.AwsS3;
import first.market.kurlyty.user.service.HeaderService;
import first.market.kurlyty.user.service.UserService;
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
	@Autowired HeaderService headerService;
	@Autowired UserService userService;
	
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
		System.out.println(product.getCategory_main_serial());
		System.out.println(product.getCategory_sub_serial());
		List<ProductVO> categoryProductList = headerService.getCategoryProduct(product);
		CategoryMainVO categoryRoot = sqlSession.selectOne("CategoryDAO.getCategoryRoot",product);
		List<CategorySubVO> categorySub = sqlSession.selectList("CategoryDAO.getCategorySub",categoryRoot);
		
		model.addAttribute("categoryProductList",categoryProductList);
		model.addAttribute("categoryRoot",categoryRoot);
		model.addAttribute("categorySub",categorySub);
		model.addAttribute("mainSerial", product.getCategory_main_serial());
		model.addAttribute("subSerial",product.getCategory_sub_serial());
		model.addAttribute("itemCount",categoryProductList.size());
		return "mainPage/categoryGoods";
	}
	
	@RequestMapping("/index.do")
	public String index(Model model) {
		List<BannerVO> banner = headerService.getBanner();
		List<ProductVO> hotDeal = headerService.getHotDealProduct();
		model.addAttribute("banners", banner);
		model.addAttribute("bannerCount", banner.size());
		model.addAttribute("hotDeal",hotDeal);
		return "mainPage/index";
	}
	@RequestMapping("/BestItemPage.do")
	public String BestGoods() {
		return "mainPage/BestGoodsPage"; 
	}
	@RequestMapping("/newItemPage.do")
	public String newGoodsPage(Model model) {
		List<ProductVO> newGoodsList = headerService.getNewGoods();
		model.addAttribute("newGoodsList",newGoodsList);
		return "mainPage/newGoodsPage"; 
	}
	@RequestMapping("/altleShopping.do")
	public String altleShopping() {
		return "mainPage/altleShopping"; 
	}
	@RequestMapping("/recipeItemPage.do")
	public String recipeItemPage() {
		return "mainPage/recipe";
	}
	@RequestMapping("/searchItemPage.do")
	public String searchItemPage(String searchKeyword,Model model) {
		List<ProductVO> searchList = headerService.getSearchGoods(searchKeyword);
		model.addAttribute("searchList",searchList);
		model.addAttribute("searchKeyword", searchKeyword);
		return "mainPage/searchGoodsPage";
	}
	@RequestMapping("/fileUploadTest.do")
	public String fileUploadTest() {
//		awsS3.upload(new File("C:\\pmProject\\ico_cart.svg"), "kurlyImage/ico_cart3.svg");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\icon_veggies_black.png"), "categoryMain/icon_veggies_black.png");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\icon_veggies_color.png"), "categoryMain/icon_veggies_color.png");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\icon_meat_black.png"), "categoryMain/icon_meat_black.png");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\icon_meat_color.png"), "categoryMain/icon_meat_color.png");
		
		System.out.println("파일 업로드");

		return "redirect:index.do";
		
	}
	
	@RequestMapping("/Encry.do")
	public String encry() {
		try {
			String initKey = "shplab123456789abcdefghijklmnopq";
			SecretKey key = new SecretKeySpec(initKey.getBytes(), "AES");
			String initIv = "1234567891234567";
			IvParameterSpec iv = new IvParameterSpec(initIv.getBytes());
			
			System.out.println(SecurityUtil.bytesToHex(key.getEncoded()));
			
			System.out.println(SecurityUtil.encrypt("AES/CBC/PKCS5Padding", key, iv, "sodlfdms56@gmail.com"));
			System.out.println(SecurityUtil.encrypt("AES/CBC/PKCS5Padding", key, iv, "phgksmffhTkd56@"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:index.do";
	}
	
	@RequestMapping("Decry.do")
	public String decry() {
		String key = "shplab123456789abcdefghijklmnopq";
		String iv = "1234567891234567";
		
		SecretKey decKey = new SecretKeySpec(key.getBytes(),"AES");
		IvParameterSpec deIv = new IvParameterSpec(iv.getBytes());
		
		  try { 
			  System.out.println(SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
				  decKey, deIv,
				  "xjBsXMxm4Pg6w8c38FhsIGkvPVuy7rHXyCjZUJrS5bQ=")); 
			  System.out.println(SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
					  decKey, deIv,
					  "IvqwFUGqP+BYjDg270mctD4pAFzy7vt9tOPJRfwpcuYejXm+eSbiyAETg28WvJhd")); 
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
		 
		return "redirect:index.do";
	}
	
}
