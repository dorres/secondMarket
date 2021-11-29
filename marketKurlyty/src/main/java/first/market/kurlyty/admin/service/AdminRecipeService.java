package first.market.kurlyty.admin.service;

import java.util.List;

import first.market.kurlyty.admin.vo.AdminRecipeVO;

public interface AdminRecipeService {
	public int recipeIn(AdminRecipeVO vo);
	public List<AdminRecipeVO> recipeList(AdminRecipeVO vo);
	public int recipeUpdate(AdminRecipeVO vo);
	public int recipeDelete(AdminRecipeVO vo);
	public AdminRecipeVO upList(AdminRecipeVO vo);
}
