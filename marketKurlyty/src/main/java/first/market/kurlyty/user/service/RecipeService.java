package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.RecipeVO;

public interface RecipeService {

	List<List<RecipeVO>> getRecipeList();
	RecipeVO getRecipeBook(int recipeSerial);
	List<ItemPageVO> getIngredient(RecipeVO recipe);
}