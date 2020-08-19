package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MainVo;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<MainVo> getSetList(int userNo) {
		System.out.println("MainDao:getSetList");
		
		List<MainVo> setList = sqlSession.selectList("set.selectSetList", userNo);
		
		
		return setList;
		
	}

}
