package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UpController {

	@RequestMapping("users/upProfile")
	public String up () {
		System.out.println("users/upProfile");
		return "users/upProfile";
	}
	
}
