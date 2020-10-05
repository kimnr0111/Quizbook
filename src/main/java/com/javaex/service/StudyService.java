package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.StudyDao;
import com.javaex.vo.StudyVo;

@Service
public class StudyService {
	
	@Autowired
	private StudyDao studyDao;
	
	/* 새학습 만들기 */
	public StudyVo createStudy(StudyVo studyVo) {
		System.out.println("StudyService:createStudy");
		//사용자가 클릭한 세트를 학습한 적이 있는경우 기존 학습정보 조회 학습날짜 갱신
		//사용자가 클릭한 세트를 학습한 적이 없는경우 새로운 학습정보생성
		//작업실행 후 학습정보 가져오기
		
		StudyVo studySelect = studyDao.selectStudy(studyVo);
		System.out.println("createStudy:" + studySelect);
		
		if(studySelect == null) {
			System.out.println("null");
			
			studyDao.createStudy(studyVo);
			
			studySelect = studyDao.selectStudy(studyVo);

		} else {
			System.out.println("notnull");
			
			studyDao.updateStudy(studySelect);
		}
		
		return studySelect;
		
		
	}

}
