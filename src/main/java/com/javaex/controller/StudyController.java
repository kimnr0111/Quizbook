  
package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.MainService;
import com.javaex.service.WordService;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;
import com.javaex.vo.WordVo;

@Controller
@RequestMapping(value="/study", method={RequestMethod.GET, RequestMethod.POST})
public class StudyController {
	@Autowired
	private MainService mainService;
	@Autowired
	private WordService wordService;
	
	@RequestMapping(value = "/{setNo}", method = { RequestMethod.GET, RequestMethod.POST })
	public String study(HttpSession session, Model model, @PathVariable("setNo") int setNo) throws JsonProcessingException{
		System.out.println("studyController:main");
		
		//session 불러오기
		UserVo loginUser = (UserVo) session.getAttribute("authUser");
		System.out.println(loginUser);
		
		// 내 폴더리스트 불러오기
		List<FolderVo> myfolderList = mainService.folderList(loginUser.getUserNo());
		System.out.println("my폴더리스트 : " + myfolderList.toString());
		model.addAttribute("myfolderList", myfolderList);
		
		//세트정보불러오기
		MainVo mainVo = mainService.getSetOne(setNo);
		String setName = mainVo.getSetName();
		model.addAttribute("setName", setName);
		
		/////////////////////////////////////
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		boolean folderRenderFlag = false;
		model.addAttribute("folderRenderFlag", folderRenderFlag);
		
		System.out.println("세트번호"+setNo); 
		List<WordVo> wordList = wordService.getWords(setNo); 
		System.out.println(wordList.toString());
		
		/* model.addAttribute("wordList", wordList); */
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(wordList);
		model.addAttribute( "json", jsonText );
		
		
		return "study/main";
	}
	
	@RequestMapping(value="/main", method={RequestMethod.GET, RequestMethod.POST})
	public String study(HttpSession session, Model model){
		System.out.println("studyController:main");
		
		//session 불러오기
		UserVo loginUser = (UserVo) session.getAttribute("authUser");
		System.out.println(loginUser);
		
		// 내 폴더리스트 불러오기
		List<FolderVo> myfolderList = mainService.folderList(loginUser.getUserNo());
		System.out.println("my폴더리스트 : " + myfolderList.toString());
		model.addAttribute("myfolderList", myfolderList);

		
		return "study/main";
	}

}