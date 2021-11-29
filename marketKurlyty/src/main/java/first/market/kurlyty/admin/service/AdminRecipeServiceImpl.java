package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.admin.dao.RecipeDAO;
import first.market.kurlyty.admin.vo.AdminRecipeVO;

@Service("AdminRecipeService")
public class AdminRecipeServiceImpl implements AdminRecipeService{
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Override
	public int recipeIn(AdminRecipeVO vo) {
		return recipeDAO.recipeIn(vo);
	}

	@Override
	public List<AdminRecipeVO> recipeList(AdminRecipeVO vo) {
		return recipeDAO.recipeList(vo);
	}

	@Override
	public int recipeUpdate(AdminRecipeVO vo) {
		return recipeDAO.recipeUpdate(vo);
	}

	@Override
	public int recipeDelete(AdminRecipeVO vo) {
		return recipeDAO.recipeDelete(vo);
	}

	@Override
	public AdminRecipeVO upList(AdminRecipeVO vo) {
		return recipeDAO.upList(vo);
	}
	

}
