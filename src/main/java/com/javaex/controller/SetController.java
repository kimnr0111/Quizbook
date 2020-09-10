package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/set", method={RequestMethod.GET, RequestMethod.POST})
public class SetController {
	
	/* 세트만들기 페이지로 이동 */
	@RequestMapping(value = "/{folderno}", method = { RequestMethod.GET, RequestMethod.POST })
	public String Set(Model model, @PathVariable("folderno") int folderNo) {
		System.out.println("study/setCreate");
		
		model.addAttribute("folderNo", folderNo);
	
		return "study/set";
	}

}
