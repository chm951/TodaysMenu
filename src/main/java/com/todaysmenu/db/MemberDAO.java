package com.todaysmenu.db;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.todaysmenu.model.BoardVO;
import com.todaysmenu.model.MealVO;
import com.todaysmenu.model.MemberVO;
import com.todaysmenu.model.RecipeVO;

public class MemberDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberVO vo) {

		SqlSession sqlsession = factory.openSession(true);

		int row = sqlsession.insert("join", vo);

		sqlsession.close();

		return row;

	}

	public MemberVO login(MemberVO vo) {

		SqlSession sqlsession = factory.openSession(true);

		System.out.println(vo.getUser_id());
		System.out.println(vo.getUser_pw());
		MemberVO login = sqlsession.selectOne("login", vo);

		sqlsession.close();

		return login;
	}

	public boolean IdCheck(String inputI) {
		boolean checkI = false;
		SqlSession sqlsession = factory.openSession(true);
		try {
			checkI = sqlsession.selectOne("idCheck", inputI);

		} catch (Exception e) {
			System.out.println(checkI);
		} finally {
			sqlsession.close();
			System.out.println(checkI);
		}

		return checkI;

	}

	public int mealJoin(MealVO meal) {
		int row = 0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.insert("insertMeal", meal);
		sqlsession.close();
		return row;
	}

	public int recipeJoin(RecipeVO recipe) {
		int row = 0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.insert("insertRecipe", recipe);
		sqlsession.close();

		return row;
	}
	public int boardJoin(BoardVO vo) {
		int row=0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.insert("insertBoard",vo);
		sqlsession.close();
		return row;
	}

	public int update(MemberVO vo) {
		int row =0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.update("update", vo);
		sqlsession.close();
		return row;
	}
	public int resign(MemberVO vo) {
		int row=0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.delete("resign", vo);
		sqlsession.close();
		return row;
				
	}
}
