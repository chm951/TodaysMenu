package com.todaysmenu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todaysmenu.db.BoardDAO;
import com.todaysmenu.model.BoardVO;

public class BoardDeleteService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setB_num(num);
		int row=dao.deletBoard(vo);
		return "BoardSelect.do";
	}

}
