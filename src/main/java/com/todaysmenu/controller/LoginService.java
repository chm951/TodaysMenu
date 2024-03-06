package com.todaysmenu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.todaysmenu.db.MemberDAO;
import com.todaysmenu.model.MemberVO;

public class LoginService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		MemberVO vo = new MemberVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		MemberDAO dao = new MemberDAO();
		MemberVO result = dao.login(vo);
		if (result != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", result);
			response.getWriter().print(true);
		} else {
			System.out.println("로그인 실패");
			response.getWriter().print(false);
		}
		return null;
	}

}
