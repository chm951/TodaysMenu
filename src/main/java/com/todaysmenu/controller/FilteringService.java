package com.todaysmenu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.todaysmenu.db.CalDAO;
import com.todaysmenu.db.MemberDAO;
import com.todaysmenu.model.BoardVO;
import com.todaysmenu.model.CalVO;
import com.todaysmenu.model.MealVO;
import com.todaysmenu.model.MemberVO;
import com.todaysmenu.model.RecipeVO;

public class FilteringService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String recipe = request.getParameter("keywords");
		
		String[] recipes = recipe.replace("\r\n\r\n", "\r\n").split("\r\n");
		String[][] result = new String[3][3];
		
		for(int i =0;i<3;i++) {
			result[0][i] = recipes[i+2];
			result[1][i]=recipes[i+6];
			result[2][i]= recipes[i+10];
		}
		for(int i =0;i<3;i++) {
			result[i][0] = result[i][0].replace("1. 음식명: ", "");// 0번 인덱스 음식명
		    result[i][1] = result[i][1].replace("2. 식재료: ", "");// 1번 인덱스 식재료
		    result[i][2] = result[i][2].replace("3. 조리법: ", "");// 2번 인덱스 조리법
		}
		for(int i =0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.println(result[i][j]);
			}
		}
		MealVO breakfast = new MealVO();
		MealVO lunch = new MealVO();
		MealVO dinner = new MealVO();
		HttpSession session= request.getSession();
		MemberVO member=(MemberVO) session.getAttribute("member");
		breakfast.setUser_id(member.getUser_id());
		breakfast.setMeal_type("b");
		breakfast.setMeal_menu(result[0][0]);
		lunch.setUser_id(member.getUser_id());
		lunch.setMeal_type("l");
		lunch.setMeal_menu(result[1][0]);
		dinner.setUser_id(member.getUser_id());
		dinner.setMeal_type("d");
		dinner.setMeal_menu(result[2][0]);
		MemberDAO dao = new MemberDAO();
		int Brow=dao.mealJoin(breakfast);
		int Lrow = dao.mealJoin(lunch);
		int Drow = dao.mealJoin(dinner);
		RecipeVO bRecipe = new RecipeVO();
		RecipeVO lRecipe = new RecipeVO();
		RecipeVO dRecipe = new RecipeVO();
		
		bRecipe.setRecipe_name(result[0][0]);
		bRecipe.setRecipe_ingre(result[0][1]);
		bRecipe.setRecipe_desc(result[0][2]);
		
		lRecipe.setRecipe_name(result[1][0]);
		lRecipe.setRecipe_ingre(result[1][1]);
		lRecipe.setRecipe_desc(result[1][2]);
		
		dRecipe.setRecipe_name(result[2][0]);
		dRecipe.setRecipe_ingre(result[2][1]);
		dRecipe.setRecipe_desc(result[2][2]);
		
		dao.recipeJoin(bRecipe);
		dao.recipeJoin(lRecipe);
		dao.recipeJoin(dRecipe);
		
		BoardVO vo = new BoardVO();
		String food_name = ("아침 : "+result[0][0]+", 점심 : "+result[1][0]+", 저녁 :"+ result[2][0]);
		vo.setB_title(food_name);
		System.out.println(recipe);
		vo.setB_content(recipe);
		vo.setUser_id(member.getUser_id());
		int row = dao.boardJoin(vo);
		
		CalVO calVO= new CalVO();
		String cal_title = ("아침 :"+result[0][0]+"\n점심 : "+result[1][0]+"\n저녁 :"+ result[2][0]);
		calVO.setId(member.getUser_id());
		calVO.setTitle(cal_title);
		calVO.setTextcolor("black");
		calVO.setBackgroundcolor("white");
		CalDAO calDAO = new CalDAO();
		calDAO.calenderJoin(calVO);
		
		return "Gomain.do";
	}
		

}
