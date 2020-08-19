package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	//유저정보 가져오기
	public UserVo getUser(String id) {
		System.out.println("MainService:getUser");
		
		UserVo userVo = mainDao.getUser(id);
		
		return userVo;
	}
	
	//세트가져오기
	public List<MainVo> getSetList(int userNo) {
		System.out.println("MainService:getSetList");
		List<MainVo> setList = mainDao.getSetList(userNo);
		return setList;
	}

}
