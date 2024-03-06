package com.todaysmenu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.todaysmenu.db.CalDAO;
import com.todaysmenu.model.CalVO;
import com.todaysmenu.model.MemberVO;

public class CalendarService implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CalDAO calDao = new CalDAO();
		HttpSession session= request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		List<CalVO> events = calDao.calendar(member);
		
		JsonArray jarray = new JsonArray();
		
		for (int i=0;i<events.size();i++) {
			JsonObject json = new JsonObject();
			json.addProperty("id", events.get(i).getId());
			json.addProperty("title", events.get(i).getTitle());
			json.addProperty("start", events.get(i).getStart());
			json.addProperty("end", events.get(i).getStart());
			json.addProperty("textColor", events.get(i).getTextcolor());
			json.addProperty("backgroundColor", events.get(i).getBackgroundcolor());
			
			jarray.add(json);
		}	
		
		// JSON 형식의 데이터를 응답으로 보냄
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jarray.toString());
		
		return null;
	}

}
