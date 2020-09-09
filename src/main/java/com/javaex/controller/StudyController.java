  
package com.javaex.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.MainService;
import com.javaex.vo.FolderVo;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/study", method={RequestMethod.GET, RequestMethod.POST})
public class StudyController {
	@Autowired
	private MainService mainService;
	
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
	
	@RequestMapping("/set")
	public String Set() {
		System.out.println("study/set");
	
		return "study/set";
	}

}