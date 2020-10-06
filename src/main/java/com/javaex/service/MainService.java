package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	//세트리스트 가져오기(최신순)
	public List<MainVo> getSetList(int folderNo) {
		System.out.println("MainService:getSetList");
		
		//세트가져오기(아이디포함)
		List<MainVo> setList = mainDao.getSetList(folderNo);
		
		return setList;
	}
	
	//세트리스트 가져오기(이름순)
	public List<MainVo> getSetListName(int folderNo) {
		System.out.println("MainService:getSetListName");
		
		//세트가져오기(아이디포함)
		List<MainVo> setList = mainDao.getSetListName(folderNo);
		
		return setList;
	}
	
	//최근학습 세트리스트가져오기
		public List<MainVo> getSetListRecently(int userNo) {
			System.out.println("MainService:getSetListRecently");
			
			//최근학습 세트가져오기
			List<MainVo> setList = mainDao.getSetListRecently(userNo);
			
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
		
		if(set.getTag() == null) {
			set.setTag("");
		}
		
		if(set.getSetExplain() == null) {
			set.setSetExplain("");
		}
		
		System.out.println(set);
		
		int count = mainDao.addSet(set);
		System.out.println("세트복사count:" + count);
		
		return count;
	}
	
	//세트 가져오기
	public MainVo getSetOne(int setNo) {
		System.out.println("MainService:getSetOne");
		
		MainVo setVo = mainDao.getSet(setNo);
		
		return setVo;
	}
	
	
	
	//세트 이미지 업로드
	public String setImgUpload(MultipartFile file) {
		System.out.println("MainService:setImgUpload");
		//파일카피////////////////////////////////////////
		String saveDir = "C:\\javaStudy\\upload\\setImg";
		
		//원파일이름
		String orgName = file.getOriginalFilename();
		System.out.println("orgName:" + orgName);
		
		//확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName:" + exName);
		
		//저장파일이름
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName:" + saveName);
				
		//파일경로
		String filePath = saveDir + "\\" + saveName;
		System.out.println(filePath);
		
		//파일사이즈
		long fileSize = file.getSize();
		System.out.println(fileSize);
		
		//파일 서버에 복사///////////////////////////////////
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bout = new BufferedOutputStream(out);
					
			bout.write(fileData);
			bout.close();
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}
		
		return saveName;
	}
	
	//세트 만들기
	public int setCreate(MainVo setVo) {
		System.out.println("MainService:setCreate");
		
		if(setVo.getSetImg() == null) {
			setVo.setSetImg("");
		}
		
		if(setVo.getTag() == null) {
			setVo.setTag("");
		}
		
		if(setVo.getSetExplain() == null) {
			setVo.setSetExplain("");
		}
		
		int count = mainDao.addSet(setVo);
		
		return count;
		
	}
	
	//만든세트 가져오기
	public int getSetCreate(int userNo) {
		System.out.println("MainService:getSetCreate");
		
		int createSetNo = mainDao.getSetCreate(userNo);
		
		return createSetNo;
	}
	
	//세트업데이트
	public int setUpdate(MainVo setVo) {
		System.out.println("MainService:setUpdate");
		
		if(setVo.getSetImg() == null) {
			setVo.setSetImg("");
		}
		
		if(setVo.getTag() == null) {
			setVo.setTag("");
		}
		
		if(setVo.getSetExplain() == null) {
			setVo.setSetExplain("");
		}
		System.out.println("MainService:setUpdate:::" + setVo);
		mainDao.setUpdate(setVo);
		
		int count = 0;
		
		return count;
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
	
	//폴더이름 불러오기
	public FolderVo getFolderName(int folderNo) {
		System.out.println("MainService:getFolderName");
		
		FolderVo folderName = mainDao.getFolderName(folderNo);
		
		return folderName;
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
	
	
	//검색창 검색
	public List<MainVo> searchSetList(String keyword) {
		System.out.println("MainService:searchSetList");
		
		System.out.println(keyword);
		
		List<MainVo> searchSetList = mainDao.searchSetList(keyword);
		
		return searchSetList;
	}

}
