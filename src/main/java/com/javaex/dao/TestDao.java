package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.WordVo;

@Repository
public class TestDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 테스트용 리스트 가져오기(랜덤으로) */
	public List<WordVo> getTestList(int setNo) {
		System.out.println("TestDao:getTestList");
		
		List<WordVo> testList = sqlSession.selectList("test.getTestList", setNo);
		
		return testList;
	}

}
