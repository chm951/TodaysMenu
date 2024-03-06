package com.todaysmenu.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.todaysmenu.model.BoardVO;


public class BoardDAO {
	
	private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<BoardVO> allBoard(String user_id){
		System.out.println(user_id);

		List<BoardVO> boards = null;
		SqlSession sqlsession = factory.openSession();
		try {
			boards = sqlsession.selectList("allBoard", user_id);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlsession.close();
		}
		return boards;
	}
	
	public BoardVO detailBoard(int num) {
		BoardVO board = null;
		SqlSession sqlsession = factory.openSession();
		try {
			board 
			= sqlsession.selectOne("detailBoard", num);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlsession.close();
		}
		return board;
	}

	public int deletBoard(BoardVO vo) {
		int row =0;
		SqlSession sqlsession = factory.openSession(true);
		row = sqlsession.delete("deleteBoard", vo);
		sqlsession.close();
		return row;
	}
}
