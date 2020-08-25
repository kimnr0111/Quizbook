package com.javaex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.vo.FolderVo;
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
		System.out.println(userVo.toString());
		
		return userVo;
	}
	
	//세트리스트 가져오기
	public List<MainVo> getSetList(int userNo, int folderNo) {
		System.out.println("MainService:getSetList");
		
		//세트가져오기(아이디포함)
		List<MainVo> setList = mainDao.getSetList(userNo, folderNo);
		
		return setList;
	}
	
	//세트 복사
	public MainVo getSet(int folderNo, int setNo) {
		System.out.println("MainService:getSet");
		
		MainVo set = mainDao.getSet(setNo);
		set.setFolderNo(folderNo);
		
		if(set.getSetImg() == null) {
			set.setSetImg("");
		}
		
		if(set.getSearch_tag() == null) {
			set.setSearch_tag("");
		}
		
		System.out.println(set);
		
		mainDao.addSet(set);
		
		return set;
	}
	
	//세트지우기
	public int setDelete(int setNo) {
		System.out.println("MainService:setDelete");
		
		int count = mainDao.setDelete(setNo);
		
		return count;
		
	}
	
	//폴더리스트 불러오기
	public List<FolderVo> folderList(int userNo) {
		System.out.println("MainService:folderList");
		
		List<FolderVo> folderList = mainDao.folderList(userNo);
		
		return folderList;
	}
	
	//기본폴더 불러오기
	public FolderVo getFolder(int userNo) {
		System.out.println("MainService:getFolder");
		
		FolderVo folderVo = mainDao.getFolder(userNo);
		
		return folderVo;
		
		
	}

}