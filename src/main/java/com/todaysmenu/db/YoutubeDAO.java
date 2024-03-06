package com.todaysmenu.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.todaysmenu.model.YoutubeVO;

public class YoutubeDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<YoutubeVO> showyoutube(String youtube_name) {

		SqlSession session = factory.openSession(true);
		List<YoutubeVO> y_list = session.selectList("showyoutube", youtube_name);
		session.close();
		return y_list;

	}

	public List<YoutubeVO> showyoutubeAll() {

		SqlSession session = factory.openSession(true);
		List<YoutubeVO> y_list = session.selectList("showyoutubeAll");
		session.close();
		return y_list;

	}
}
