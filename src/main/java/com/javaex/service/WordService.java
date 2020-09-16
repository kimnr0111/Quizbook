package com.javaex.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	//카드만들기
	public int cardCreate(WordVo wordVo) {
		System.out.println("WordService:cardCreate");
		
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
