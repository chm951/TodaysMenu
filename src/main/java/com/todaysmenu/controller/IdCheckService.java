package com.todaysmenu.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todaysmenu.db.MemberDAO;

public class IdCheckService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String inputI = request.getParameter("inputI");
		System.out.println(inputI);
		
		boolean checkI = new MemberDAO().IdCheck(inputI);
		PrintWriter out;
		try {
		out = response.getWriter();
		out.print(checkI);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
