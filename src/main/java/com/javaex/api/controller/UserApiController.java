package com.javaex.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/user/api")
public class UserApiController {
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping(value="/signUp")
	public int addFolder(@RequestBody UserVo uVo) {
		System.out.println("받은데이터"+uVo.toString());
		int result = userService.join(uVo);
		System.out.println("가입결과"+result);
		return result;
	}
	
	//로그인
	@ResponseBody
	@RequestMapping("/login")
	public int login(@RequestBody UserVo userVo, HttpSession session) {
		
		int result;
		System.out.println("로그인데이터");
		System.out.println(userVo.toString());
		UserVo authUser = userService.login(userVo);
		
		if(authUser != null) { //로그인 성공일때
			System.out.println(authUser.toString());
			session.setAttribute("authUser", authUser);
			result = 1;
		} else { //로그인 실패일때
			result = 0;
		}
		
		return result;
	}
}
