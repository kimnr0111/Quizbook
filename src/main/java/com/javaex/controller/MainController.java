package com.javaex.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MainService;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	//로그인 전 메인페이지
	@RequestMapping(value="/", method={RequestMethod.GET, RequestMethod.POST})
	public String main(){
		System.out.println("/Quizbook/main");
		return "main/index";
	}
	
	//검색
	@RequestMapping(value="/test", method={RequestMethod.GET, RequestMethod.POST})
	public String test(@RequestParam ("keyword") String keyword){
		System.out.println("검색 테스트");
		System.out.println("키워드 : "+keyword);
		return "main/index";
	}
	
	//아이디로 개인페이지 접속
	@RequestMapping(value="/{id}", method={RequestMethod.GET, RequestMethod.POST})
	public String loginMain(HttpSession session, Model model, @PathVariable("id") String id) {
		System.out.println("/Quizbook/loginMain");
		
		UserVo authUser = new UserVo(1, "123", "1234");
		session.setAttribute("authUser", authUser);
		
		//아이디로 유저번호 알아내기
		UserVo userVo = mainService.getUser(id);
		model.addAttribute("userVo", userVo);
		
		//개인페이지 접속시 기본폴더 출력
		int userNo = userVo.getUserNo();
		FolderVo folderVo = mainService.getFolder(userNo);
		model.addAttribute("folderVo", folderVo);
		
		//폴더리스트 불러오기
		List<FolderVo> folderList = mainService.folderList(userNo);
		System.out.println("폴더리스트 : " + folderList.toString());
		model.addAttribute("folderList", folderList);
		//팔로우, 팔로워 숫자 나중에 넣기
		
		return "main/loginMain";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/setList", method={RequestMethod.GET, RequestMethod.POST})
	public List<MainVo> setList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/setList");
		System.out.println(mainVo);
		//사용자의 세트만 출력하기 위해 userNo를 받아 저장
		int userNo = mainVo.getUserNo();
		//기본폴더 번호
		int folderNo = mainVo.getFolderNo();
		//Main 나중에 이름 적당한거로 바꾸기
		List<MainVo> setList = mainService.getSetList(userNo, folderNo);
		System.out.println(setList.toString());
		return setList;
	}
	
	@ResponseBody
	@RequestMapping(value="/setDelete", method={RequestMethod.GET, RequestMethod.POST})
	public int setDelete(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/setDelete");
		System.out.println("no:" + mainVo.getSetNo());
		int setNo = mainVo.getSetNo();
		int count = mainService.setDelete(setNo);
		return count;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/folderList", method={RequestMethod.GET, RequestMethod.POST})
	public List<FolderVo> folderList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/folderList");
		System.out.println("no:" + mainVo.getUserNo());
		int userNo = mainVo.getUserNo();
		List<FolderVo> folderList = mainService.folderList(userNo);
		return folderList;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/setCopy", method={RequestMethod.GET, RequestMethod.POST})
	public void setCopy(@RequestBody MainVo vo) {
		System.out.println("/Quizbook/folderList");
		
		System.out.println(vo.getFolderNo());
		System.out.println(vo.getSetNo());
		
		int folderNo = vo.getFolderNo();
		int setNo = vo.getSetNo();
		
		mainService.getSet(folderNo, setNo);
		
	}

}



//
//package com.javaex.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//public class MainController {
//	
//	@RequestMapping(value="", method={RequestMethod.GET, RequestMethod.POST})
//	public String main(){
//		System.out.println("/Quizbook/main");
//		return "main/main";
//	}
//
//}
