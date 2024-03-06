package com.todaysmenu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todaysmenu.db.MemberDAO;
import com.todaysmenu.model.MemberVO;

public class JoinService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				String user_id = request.getParameter("user_id");
				String user_pw = request.getParameter("user_pw");
				String user_birthdate =request.getParameter("user_birthdate");
				String user_name = request.getParameter("user_name");
				String user_gender = request.getParameter("user_gender");
				MemberVO vo = new MemberVO();
				vo.setUser_id(user_id);
				vo.setUser_pw(user_pw);
				vo.setUser_birthdate(user_birthdate);
				vo.setUser_name(user_name);
				vo.setUser_gender(user_gender);
				MemberDAO dao = new MemberDAO();
				int row = dao.join(vo);
				if (row > 0) {
					request.setAttribute("user_id", user_id);
					return "Join_Success.jsp";
				} else {
					// redirect:/ ===> redirect방식으로 이동해야 한다는 것을 FC에 알려주는 방식
					return "redirect:/Gomain.do";
	}

	}
}

