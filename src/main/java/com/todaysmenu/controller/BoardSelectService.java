package com.todaysmenu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.todaysmenu.db.BoardDAO;
import com.todaysmenu.model.BoardVO;
import com.todaysmenu.model.MemberVO;

public class BoardSelectService implements command {
	int postsPerPage = 10;
	int bPageSize = 5;
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("member");
		List<BoardVO> boards = new BoardDAO().allBoard(user.getUser_id());
		session.setAttribute("boards", boards);
		
		int totalPages = ((boards.size()-1)/postsPerPage)+1;
		int endPage = (((page-1)/bPageSize)+1)*bPageSize;
		if(totalPages < endPage) {
			endPage = totalPages;
		}
		int startPage = ((page-1)/bPageSize)*bPageSize+1;
		
		int startIdx = (page - 1) * postsPerPage;
		int endIdx = Math.min(startIdx + postsPerPage, boards.size());
		
		System.out.println(page);
		List<BoardVO> currBList = boards.subList(startIdx, endIdx);
		session.setAttribute("currBList", currBList);
		session.setAttribute("boards", boards);
		session.setAttribute("Bpage", page);
		session.setAttribute("postsPerPage", postsPerPage);
		session.setAttribute("endPage", endPage);
		session.setAttribute("startPage", startPage);
		session.setAttribute("totalPages", totalPages);
		session.setAttribute("bPageSize", bPageSize);
		
		
		return "Goboard.do";
	}

}
