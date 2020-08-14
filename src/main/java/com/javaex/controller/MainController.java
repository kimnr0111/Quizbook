package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
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
