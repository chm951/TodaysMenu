package com.todaysmenu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.todaysmenu.db.MemberDAO;
import com.todaysmenu.model.MemberVO;

public class ResignService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session= request.getSession();
		MemberVO member=(MemberVO) session.getAttribute("member");
		MemberDAO dao = new MemberDAO();
		dao.resign(member);
		return "redirect:/Gointro.do";
	}

}
