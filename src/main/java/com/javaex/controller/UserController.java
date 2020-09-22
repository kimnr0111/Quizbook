  
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
import com.javaex.service.UserService;
import com.javaex.service.WordService;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;
import com.javaex.vo.WordVo;

@Controller
@RequestMapping(value="/user", method={RequestMethod.GET, RequestMethod.POST})
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginMain(@PathVariable("id") String id) {
		System.out.println("정보수정");
		return "user/fixProfile";
	}	

}