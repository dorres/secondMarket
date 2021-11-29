package first.market.kurlyty.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import first.market.kurlyty.admin.service.AdminRecipeService;
import first.market.kurlyty.admin.vo.AdminRecipeVO;
import first.market.kurlyty.s3.AwsS3;

@Controller
public class AdminRecipeController {
	
	@Autowired
	private AdminRecipeService recipeService;
	@Autowired
	private AwsS3 awsS3;
	
	@RequestMapping("insertRecipe.mdo")
    public String insertRecip() {
 	   return "registration/admin_recipeRegistration";
    }
	
	@RequestMapping("recipeIn.mdo")
	public String recipeIn(@RequestParam("conImage") MultipartFile file1,@RequestParam("mainImage") MultipartFile file2, AdminRecipeVO vo) {
		int success =0;		
		String key1 = null;
		String key2 = null;
		UUID uuid;		
		String path = "https://kurlybuc.s3.ap-northeast-2.amazonaws.com/";				
		if(file1.getSize() !=0) {
			uuid=UUID.randomUUID();
			key1 = "recipe/" + uuid.toString() +file1.getOriginalFilename();
			key2 = "recipe/" + uuid.toString() +file2.getOriginalFilename();
			vo.setRecipe_content(path + key1);
			vo.setRecipe_image_main(path + key2);
			success=recipeService.recipeIn(vo);	
		}
		
		if(success!=0) {
		try {		
			InputStream is = file1.getInputStream();
			String contentType = file1.getContentType(); 
			long contentLength = file1.getSize();
			awsS3.upload(is, key1, contentType, contentLength);	
			InputStream is2 = file2.getInputStream();
			String contentType2 = file2.getContentType(); 
			long contentLength2 = file2.getSize();
			awsS3.upload(is2, key2, contentType2, contentLength2);	
		}catch (IOException e) {e.printStackTrace();}
		}
		return "redirect:insertRecipe.mdo";
		}
	@RequestMapping("recipe.mdo")
	public String recipeList(AdminRecipeVO vo, Model model) {		
		model.addAttribute("List", recipeService.recipeList(vo));
		return "registration/admin_recipeList";
	}
	
	@GetMapping("recipeUp.mdo")	
	public String recipeUpdate(AdminRecipeVO vo,Model model) {
		
		model.addAttribute("upList", recipeService.upList(vo));
		return "registration/admin_recipeUpdate";
	}
	
	@RequestMapping("recipeUpProc.mdo")	
	public String update(AdminRecipeVO vo) {
		int upsuccess = recipeService.recipeUpdate(vo);
		System.out.println(upsuccess);
		if(upsuccess != 0) {
			return "redirect:recipe.mdo";
		}else return "redirect:recipeUp.mdo";
	}
	@RequestMapping("recipeDel.mdo")	
	public String recipeDelete(AdminRecipeVO vo) {
		recipeService.recipeDelete(vo);
		return "redirect:recipe.mdo";
	}
}
