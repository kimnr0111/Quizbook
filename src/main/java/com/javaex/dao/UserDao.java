package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public int insert(UserVo userVo) {
		System.out.println("UserDao:insert");
		
		return sqlSession.insert("user.insert", userVo);
	}
	
	//중복체크
	public UserVo idcheck(UserVo userVo) {
		return sqlSession.selectOne("user.getUser", userVo.getId());
	}
	
	//로그인
	public UserVo selectLoginUser(UserVo userVo) {
		return sqlSession.selectOne("user.getUserByIdPw", userVo);
	}
	
}
