package com.todaysmenu.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.todaysmenu.model.CalVO;
import com.todaysmenu.model.MemberVO;

public class CalDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<CalVO> calendar(MemberVO member) {

		SqlSession sqlsession = factory.openSession(true);

		List<CalVO> cal = sqlsession.selectList("calendar",member);

		sqlsession.close();


		return cal;

	}

	public int calenderJoin(CalVO vo) {
		int row = 0;
		SqlSession sqlsession = factory.openSession(true);

		row = sqlsession.insert("calendarJoin", vo);

		sqlsession.close();
		return row;
	}

}
