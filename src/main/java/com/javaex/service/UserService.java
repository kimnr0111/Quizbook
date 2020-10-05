package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.FolderDao;
import com.javaex.dao.MainDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private FolderDao folderDao;
	
	public UserVo login(UserVo uVo) {
		return userDao.selectLoginUser(uVo);
	}
	
	public int join(UserVo uVo) {
		int result;
		
		if(userDao.idcheck(uVo)==null) {
			result = userDao.insert(uVo);
		} else {
			result = 0;
		}
		return result;
	}
	
	//유저정보 가져오기
	public UserVo getUser(String id) {
		System.out.println("MainService:getUser");
		
		UserVo userVo = mainDao.getUser(id);
		System.out.println(userVo.toString());
		
		return userVo;
	}

}
