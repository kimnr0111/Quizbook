package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.WordDao;
import com.javaex.vo.WordVo;

@Service
public class WordService {
	
	@Autowired
	private WordDao wordDao;
	
	//단어리스트 가져오기
	public List<WordVo> getWords(int setNo) {
		System.out.println("WordService:getWords");
		
		List<WordVo> wordList = wordDao.getWords(setNo);
		
		return wordList;
	}
	
	//카드 이미지 업로드
	public String cardImgUpload(MultipartFile file) {
		System.out.println("WordService:cardImgUpload");
		//파일카피////////////////////////////////////////
		String saveDir = "C:\\javaStudy\\upload\\wordImg";
				
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
	
	//카드만들기
	public int cardCreate(WordVo wordVo) {
		System.out.println("WordService:cardCreate");
		
		String wordImg = wordVo.getWordImg();
		
		if(wordImg == null) {
			wordVo.setWordImg("");
		}
		
		return wordDao.cardCreate(wordVo);
		
	}
	
	//카드리셋
	public int cardReset(WordVo wordVo) {
		System.out.println("WordService:cardReset");
		
		wordDao.cardReset(wordVo);
		
		int count = 0;
		
		return count;
	}
	
	//카드업데이트
	public int cardUpdate(WordVo wordVo) {
		System.out.println("wordService:cardUpdate");
		
		wordDao.cardUpdate(wordVo);
		
		int count = 0;
		
		return count;
	}
	
}
