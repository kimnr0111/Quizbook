  
package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.MainService;
import com.javaex.service.StudyService;
import com.javaex.service.TestService;
import com.javaex.service.WordService;
import com.javaex.vo.AnswerVo;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.StudyVo;
import com.javaex.vo.UserVo;
import com.javaex.vo.WordVo;

@Controller
@RequestMapping(value="/study", method={RequestMethod.GET, RequestMethod.POST})
public class StudyController {
	@Autowired
	private MainService mainService;
	@Autowired
	private WordService wordService;
	@Autowired
	private TestService testService;
	@Autowired
	private StudyService studyService;
	
	/* 학습하기 화면으로이동 */
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
		model.addAttribute("setNo", setNo);
		
		/////////////////////////////////////
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		int folderRenderFlag = 0;
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
	
	/* 주관식 문제풀이 */
	@RequestMapping(value = "/test/{setNo}", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyTest(HttpSession session, Model model, @PathVariable("setNo") int setNo) throws JsonProcessingException{
		System.out.println("studyController:test");
		
		//userNo 불러오기
		UserVo loginUser = (UserVo) session.getAttribute("authUser");
		int userNo = loginUser.getUserNo();
		
		StudyVo studyVo = new StudyVo(userNo, setNo);
		
		//만들어진 study가져오기
		StudyVo studyInfo = studyService.createStudy(studyVo);
		System.out.println("studyInfo확인" + studyInfo);

		
		List<WordVo> testList = testService.getTestList(setNo);
		System.out.println(testList.toString());
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonTestList = mapper.writeValueAsString(testList);
		model.addAttribute("testList", jsonTestList);
		model.addAttribute("studyInfo", studyInfo);
		
		return "study/test";
	}
	
	/* 주관식 문제풀이 결과 저장 */
	@ResponseBody
	@RequestMapping(value = "/test/studyResult", method = { RequestMethod.GET, RequestMethod.POST })
	public int studyResult(@RequestBody Map<String, Object> answerVo) {
		System.out.println("studyController:studyResult");
		
		System.out.println(answerVo.toString());
		
		
		int wordNo =  (int) answerVo.get("wordNo");
		int studyNo = Integer.valueOf((String) answerVo.get("studyNo"));
		int correctFlag = (int) answerVo.get("correctFlag");
		
		System.out.println(wordNo + "," + studyNo + "," + correctFlag);
		
		testService.studyResult(wordNo, studyNo, correctFlag);
		
		return 0;
	}
	
	
	/* 짝 맞추기 문제풀이 */
	@RequestMapping(value = "/{setNo}/diagram", method = { RequestMethod.GET, RequestMethod.POST })
	public String game2(HttpSession session, Model model, @PathVariable("setNo") int setNo) throws JsonProcessingException {
		System.out.println(setNo);
		List<WordVo> wordList = wordService.getWords(setNo); 
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(wordList);
		model.addAttribute( "json", jsonText );
		
		return "study/diagram";
	}
	
	
	
	
	/*
	 * @RequestMapping(value="/main", method={RequestMethod.GET,
	 * RequestMethod.POST}) public String study(HttpSession session, Model model){
	 * System.out.println("studyController:main");
	 * 
	 * //session 불러오기 UserVo loginUser = (UserVo) session.getAttribute("authUser");
	 * System.out.println(loginUser);
	 * 
	 * // 내 폴더리스트 불러오기 List<FolderVo> myfolderList =
	 * mainService.folderList(loginUser.getUserNo());
	 * System.out.println("my폴더리스트 : " + myfolderList.toString());
	 * model.addAttribute("myfolderList", myfolderList);
	 * 
	 * 
	 * return "study/main"; }
	 */

}