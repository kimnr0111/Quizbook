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
	public List<MainVo> getSetList(int folderNo) {
		System.out.println("MainService:getSetList");
		
		//세트가져오기(아이디포함)
		List<MainVo> setList = mainDao.getSetList(folderNo);
		
		return setList;
	}
	
	//세트 복사
	public int getSet(int folderNo, int setNo, int userNo) {
		System.out.println("MainService:getSet");
		
		MainVo set = mainDao.getSet(setNo);
		set.setFolderNo(folderNo);
		set.setUserNo(userNo);
		
		if(set.getSetImg() == null) {
			set.setSetImg("");
		}
		
		if(set.getSearch_tag() == null) {
			set.setSearch_tag("");
		}
		
		if(set.getSetExplain() == null) {
			set.setSetExplain("");
		}
		
		System.out.println(set);
		
		int count = mainDao.addSet(set);
		System.out.println("세트복사count:" + count);
		
		return count;
	}
	
	//세트 만들기
	public int setCreate(MainVo setVo) {
		System.out.println("MainService:setCreate");
		
		if(setVo.getSetImg() == null) {
			setVo.setSetImg("");
		}
		
		if(setVo.getSearch_tag() == null) {
			setVo.setSearch_tag("");
		}
		
		if(setVo.getSetExplain() == null) {
			setVo.setSetExplain("");
		}
		
		int count = mainDao.addSet(setVo);
		
		return count;
		
	}
	
	//만든세트 가져오기
	public int getSetCreate(MainVo setVo) {
		System.out.println("MainService:getSetCreate");
		
		int createSetNo = mainDao.getSetCreate(setVo);
		
		return createSetNo;
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
	
	//폴더만들기
	public void createFolder(FolderVo folderVo) {
		System.out.println("MainService:createFolder");
		if(folderVo.getGroupNo() == 0) {
			mainDao.createRootFolder(folderVo);
		} else {
			mainDao.createFolder(folderVo);
		}	
	}
	
	//폴더삭제
	public void deleteFolder(FolderVo folderVo) {
		System.out.println("MainService:deleteFolder");
		
		System.out.println("삭제 폴더정보" + folderVo.toString());
		
		int folderNo = folderVo.getFolderNo();
		System.out.println("삭제 폴더번호" + folderNo);
		
		mainDao.deleteFolder(folderNo);
		mainDao.orderNoDelete(folderVo);
	}

}
