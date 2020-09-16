package com.javaex.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
