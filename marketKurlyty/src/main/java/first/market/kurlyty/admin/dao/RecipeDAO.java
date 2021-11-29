package first.market.kurlyty.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminRecipeVO;

@Repository
public class RecipeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int recipeIn(AdminRecipeVO vo) {
		return sqlSession.insert("recipeDAO.recipeIn", vo);
	}
	public List<AdminRecipeVO> recipeList(AdminRecipeVO vo){
		return sqlSession.selectList("recipeDAO.recipeList",vo);
	}
	public int recipeUpdate(AdminRecipeVO vo) {
		return sqlSession.update("recipeDAO.recipeUpdate", vo);
	}
	public int recipeDelete(AdminRecipeVO vo) {
		return sqlSession.delete("recipeDAO.recipeDelete", vo);
	}
	public AdminRecipeVO upList(AdminRecipeVO vo){
		return sqlSession.selectOne("recipeDAO.recipeUpDetail", vo);
	}

}
