package com.javaex.controller;

import java.util.HashMap;
import java.util.List;

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
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/", method={RequestMethod.GET, RequestMethod.POST})
	public String main(){
		System.out.println("/Quizbook/main");
		return "main/index";
	}
	
	@RequestMapping(value="/test", method={RequestMethod.GET, RequestMethod.POST})
	public String test(@RequestParam ("keyword") String keyword){
		System.out.println("검색 테스트");
		System.out.println("키워드 : "+keyword);
		return "main/index";
	}
	
	@RequestMapping(value="/{id}", method={RequestMethod.GET, RequestMethod.POST})
	public String loginMain(Model model, @PathVariable("id") String id) {
		System.out.println("/Quizbook/loginMain");
		
		//아이디로 유저번호 알아내기
		UserVo userVo = mainService.getUser(id);
		model.addAttribute("userVo", userVo);
		
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
		//Main 나중에 이름 적당한거로 바꾸기
		List<MainVo> setList = mainService.getSetList(userNo);
		System.out.println(setList.toString());
		return setList;
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
