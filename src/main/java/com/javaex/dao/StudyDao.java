package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.StudyVo;

@Repository
public class StudyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 새학습 만들기 */
	public void createStudy(StudyVo studyVo) {
		System.out.println("StudyDao:createStudy");
		
		sqlSession.insert("study.createStudy", studyVo);
	}
	
	/* 학습정보검색 */
	public StudyVo selectStudy(StudyVo studyVo) {
		System.out.println("StudyDao:selectStudy");
		
		StudyVo studySelect = sqlSession.selectOne("study.selectStudy", studyVo);
		
		return studySelect;
		
	}

}
