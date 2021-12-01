package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.RecipeVO;
import first.market.kurlyty.vo.ProductVO;

@Repository
public class UserRecipeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<RecipeVO> getRecipeList(){
		return sqlSession.selectList("CategoryDAO.getRecipeList");
	}
	public RecipeVO getRecipeBook(int recipeSerial) {
		return sqlSession.selectOne("CategoryDAO.getRecipeBook",recipeSerial);
	}
	public List<RecipeVO> getBestIngredient(String ingredient) {
		return sqlSession.selectList("CategoryDAO.getBestIngredient", ingredient);
	}
	public void hitUp(int recipeSerial) {
		sqlSession.update("CategoryDAO.hitPlus", recipeSerial);
	}
	public ItemPageVO getIngredients(String ingredient){
		return sqlSession.selectOne("CategoryDAO.getIngredients", ingredient);
	}
	public List<ProductVO> getRecipeSearch(String search){
		return sqlSession.selectList("CategoryDAO.getRecipeSearch",search);
	}
}
