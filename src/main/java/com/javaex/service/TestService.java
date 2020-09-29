package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.TestDao;
import com.javaex.vo.AnswerVo;
import com.javaex.vo.WordVo;

@Service
public class TestService {
	
	@Autowired
	private TestDao testDao;
	
	/* 테스트용 리스트 가져오기(랜덤으로) */
	public List<WordVo> getTestList(int setNo) {
		System.out.println("TestService:getTestList");
		
		List<WordVo> testList = testDao.getTestList(setNo);
		
		return testList;
	}
	
	/* 문제풀이 결과저장 */
	public void studyResult(int wordNo, int studyNo, int correctFlag) {
		System.out.println("TestService:studyResult");
		AnswerVo answerVo = new AnswerVo(studyNo, wordNo);
		if(correctFlag == 1) {
			testDao.studyResultCorrect(answerVo);
		} else {
			testDao.studyResultIncorrect(answerVo);
		}
		
	}

}
