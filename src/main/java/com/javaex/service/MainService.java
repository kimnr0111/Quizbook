package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.vo.MainVo;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	//세트가져오기
	public List<MainVo> getSetList(int userNo) {
		System.out.println("MainService:getSetList");
		List<MainVo> setList = mainDao.getSetList(userNo);
		return setList;
	}

}
