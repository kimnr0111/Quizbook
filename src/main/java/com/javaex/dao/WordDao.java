package com.javaex.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;
import com.javaex.vo.WordVo;

@Repository
public class WordDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//단어리스트 가져오기
	public List<WordVo> getWords(int setNo) {
		System.out.println("wordDao:getWords");
		System.out.println(setNo);
		List<WordVo> wordList = sqlSession.selectList("word.getWords", setNo);
		return wordList;
	}
	
	//카드만들기
	public int cardCreate(WordVo wordVo) {
		System.out.println("wordDao:cardCreate");
		System.out.println(wordVo.toString());
		return sqlSession.insert("word.createWord", wordVo);
	}
	
	//카드업데이트
	public int cardUpdate(WordVo wordVo) {
		System.out.println("wordDao:cardUpdate");
		
		sqlSession.update("word.updateWord", wordVo);
		
		int count = 0;
		
		return count;
	}
	
}
