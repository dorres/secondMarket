package first.market.kurlyty.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.ItemPageDAO;
import first.market.kurlyty.user.dao.UserRecipeDAO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.RecipeVO;
import first.market.kurlyty.vo.ProductVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	private UserRecipeDAO recipeDao;
	@Autowired
	private ItemPageDAO itemDao;
	
	@Override
	public List<List<RecipeVO>> getRecipeList(){
		List<List<RecipeVO>> recipeList=new ArrayList<List<RecipeVO>>();
		List<RecipeVO> recipes=recipeDao.getRecipeList();
		int count=0;
		List<RecipeVO> recipeBox=new ArrayList<RecipeVO>();
		for(RecipeVO recipe:recipes) {
			if(count==2){
				recipeList.add(recipeBox);
				count=0;
				recipeBox=new ArrayList<RecipeVO>();
			}
			recipeBox.add(recipe);
			count++;
			
		}
		recipeList.add(recipeBox);
		return recipeList;
	}
	@Override
	public RecipeVO getRecipeBook(int recipeSerial) {
		recipeDao.hitUp(recipeSerial);
		return recipeDao.getRecipeBook(recipeSerial);
	}
	@Override
	public List<ItemPageVO> getIngredient(RecipeVO recipe) {
		String[] ingredients=recipe.getRecipe_key_ingredients().split(",");
		List<List<RecipeVO>> ingredList=new ArrayList<List<RecipeVO>>();
		List<ItemPageVO> itemList = new ArrayList<ItemPageVO>();
		int listIndex=0;
		for(String ingred:ingredients) {
			List<RecipeVO> bestIngreds = recipeDao.getBestIngredient(ingred);
			ingredList.add(bestIngreds);
		}
		
		for(List<RecipeVO> ingred:ingredList) {
			for(RecipeVO data:ingred) {
				ItemPageVO item = new ItemPageVO();
				item.setCategory_goods_serial(data.getCategory_goods_serial());
				ItemPageVO bestItem = itemDao.getItemPage(item);
				if(bestItem!=null) {
					itemList.add(bestItem);
				}
			}
			if(itemList.size()==listIndex) {
				itemList.add(recipeDao.getIngredients(ingredients[listIndex]));
			}
			listIndex++;
		}
		return itemList;
	}
	@Override
	public List<ProductVO> getRecipeSearch(String search) {
		return recipeDao.getRecipeSearch(search);
	}
}
