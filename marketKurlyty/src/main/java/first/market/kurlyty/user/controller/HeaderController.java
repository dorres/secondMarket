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
	
	@RequestMapping(value="categoryData.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String getCategoryMain() {
		StringBuffer categoryMain = new StringBuffer();
		List<CategoryMainVO> category = sqlSession.selectList("CategoryDAO.getCategoryMain");
		categoryMain.append("[");
		
		for(CategoryMainVO cm : category) {
			List<CategorySubVO> categorySub = sqlSession.selectList("CategoryDAO.getCategorySub",cm);
			categoryMain.append("{\"serial\":"+"\""+cm.getCategory_main_serial()+"\",");
			categoryMain.append("\"name\":"+"\""+cm.getCategory_main_name()+"\",");
			categoryMain.append("\"iconBlack\":"+"\""+cm.getCategory_main_icon_black()+"\",");
			categoryMain.append("\"iconColor\":"+"\""+cm.getCategory_main_icon_color()+"\",");
			categoryMain.append("\"data\":[");
			for(CategorySubVO sub : categorySub) {
				categoryMain.append("{\"serial\":"+"\""+sub.getCategory_sub_serial()+"\",");
				categoryMain.append("\"name\":"+"\""+sub.getCategory_sub_name()+"\",");
				categoryMain.append("\"firstSerial\":"+"\""+sub.getCategory_sub_first_no()+"\"},");
			}
			categoryMain.deleteCharAt(categoryMain.length()-1);
			categoryMain.append("]");
			categoryMain.append("},");
		}
		String jsonCategory = categoryMain.substring(0, categoryMain.length()-1) + "]";
		System.out.println(jsonCategory);
		System.out.println("dfsdfadsfa");
		return jsonCategory;
	}
	@RequestMapping("categoryGoods.do")
	public String categoryGoods(ProductVO product, Model model) {
		System.out.println(product.getCategory_main_serial());
		System.out.println(product.getCategory_sub_serial());
		List<ProductVO> categoryProductList = sqlSession.selectList("CategoryDAO.getCategoryProductList",product);
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
	public String index() {
		return "mainPage/index";
	}
	@RequestMapping("/BestGoodsPage.do")
	public String BestGoods() {
		return "mainPage/BestGoodsPage"; 
	}
	@RequestMapping("/newGoodsPage.do")
	public String newGoodsPage() {
		return "mainPage/newGoodsPage"; 
	}
	@RequestMapping("/altleShopping.do")
	public String altleShopping() {
		return "mainPage/altleShopping"; 
	}
	
	@RequestMapping("/fileUploadTest.do")
	public String fileUploadTest() {
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\자바공부\\마켓컬리\\coth.jpg"), "coth.jpg");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\자바공부\\마켓컬리\\ekdrms.jpg"), "ekdrms.jpg");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\자바공부\\마켓컬리\\didvk.jpg"), "didvk.jpg");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\자바공부\\마켓컬리\\ehowlrhrl.jpg"), "ehlwlrhrl.jpg");
		awsS3.upload(new File("C:\\Users\\최현호\\Desktop\\자바공부\\마켓컬리\\rhrnak.jpg"), "rhrnak.jpg");
		System.out.println("���� ���ε�");
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
			
			System.out.println(SecurityUtil.encrypt("AES/CBC/PKCS5Padding", key, iv, "fvvnZoM2XNLkBal2g718Djt/F0ooiCLtN9pwEz2d"));
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
