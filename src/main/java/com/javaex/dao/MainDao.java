package com.javaex.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//유저정보 가져오기
	public UserVo getUser(String id) {
		System.out.println("MainDao:getUser");
		
		UserVo userVo = sqlSession.selectOne("user.getUser", id);
		return userVo;
	}
	
	//세트리스트 가져오기(아이디포함)
	public List<MainVo> getSetList(int folderNo) {
		System.out.println("MainDao:getSetList");
		
		/*
		 * HashMap<String, Integer> listMap = new HashMap<String, Integer>();
		 * listMap.put("userNo", userNo); listMap.put("folderNo", folderNo);
		 */
		List<MainVo> setList = sqlSession.selectList("set.selectSetList", folderNo);
		
		
		return setList;
		
	}
	
	//세트 가져오기
	public MainVo getSet(int setNo) {
		System.out.println("MainDao:getSet");
		
		MainVo set = sqlSession.selectOne("set.selectSet", setNo);

		return set;
	}
	
	//세트저장
	public int addSet(MainVo set) {
		System.out.println("MainDao:addSet");
		System.out.println("Dao" + set);
		
		int createSetNo = sqlSession.insert("set.addSet", set);
		return createSetNo;
	}
	
	//저장한세트 가져오기
	public int getSetCreate(MainVo setVo) {
		System.out.println("MainDao.getSetCreate");
		
		int createSetNo = sqlSession.selectOne("set.getSetCreate", setVo);
		
		return createSetNo;
	}
	
	//세트지우기
	public int setDelete(int setNo) {
		System.out.println("MainDao:setDelete");
		
		int count = sqlSession.delete("set.setDelete", setNo);
		System.out.println(count);
		return count;
	}
	
	//폴더리스트 불러오기
	public List<FolderVo> folderList(int userNo) {
		System.out.println("MainDao:folderList");
		System.out.println(userNo);
		List<FolderVo> folderList = sqlSession.selectList("folder.getList", userNo);
		System.out.println(folderList.toString());
		
		return folderList;
	}
	
	//기본폴더 불러오기
	public FolderVo getFolder(int userNo) {
		System.out.println("MainDao:getFolder");
		FolderVo folderVo = sqlSession.selectOne("folder.getFolder", userNo);
		System.out.println("기본폴더 불러오기:" + folderVo);
		return folderVo;
	}
	
	//최상위 폴더만들기
	public void createRootFolder(FolderVo folderVo) {
		System.out.println("MainDao:createRootFolder");
		sqlSession.insert("folder.createRootFolder", folderVo);
	}
	
	//폴더만들기
	public void createFolder(FolderVo folderVo) {
		System.out.println("MainDao:createFolder");
		sqlSession.update("orderNoModify", folderVo);
		sqlSession.insert("folder.createFolder", folderVo);
	}
	
	//폴더삭제
	public void deleteFolder(int folderNo) {
		System.out.println("MainDao:deleteFolder");
		sqlSession.delete("folder.deleteFolder", folderNo);
	}
	
	//폴더삭제후 orderNo정렬
	public void orderNoDelete(FolderVo folderVo) {
		System.out.println("MainDao:orderNoDelete");
		sqlSession.update("folder.orderNoDelete", folderVo);
	}
}
