package com.javaex.controller;

import java.util.HashMap;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javaex.service.MainService;
import com.javaex.vo.FolderVo;
import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	// 로그인 전 메인페이지
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {
		System.out.println("/Quizbook/main");
		return "main/index";
	}

	// 검색페이지로 이동
	@RequestMapping(value = "/searchSetList", method = { RequestMethod.GET, RequestMethod.POST })
	public String test(HttpSession session, Model model, @RequestParam("keyword") String keyword) throws JsonProcessingException {
		System.out.println("검색 테스트");
		System.out.println("키워드 : " + keyword);
		
		List<MainVo> searchSetList = mainService.searchSetList(keyword);
		System.out.println(searchSetList);
		
		//세션값 받아오기(아이디)
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		UserVo authUserVo = mainService.getUser(authUser.getId());
		System.out.println(authUserVo.toString());
		int authUserNo = authUserVo.getUserNo();
		
		List<FolderVo> myfolderList = mainService.folderList(authUserNo);
		System.out.println("my폴더리스트 : " + myfolderList.toString());
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(searchSetList);
		model.addAttribute( "jsonSearchSetList", jsonText );
		
		UserVo userVo = mainService.getUser(authUser.getId());
		model.addAttribute("userVo", userVo);
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		int folderRenderFlag = 1;
		model.addAttribute("folderRenderFlag", folderRenderFlag);
		
		return "main/search";
	}	

	// 아이디로 개인페이지 접속
	@RequestMapping(value = "/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginMain(HttpSession session, Model model, @PathVariable("id") String id) {
		System.out.println("/Quizbook/loginMain");
		
		//세션값 받아오기(아이디)
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		System.out.println(authUser);
		
		// 로그인한 유저 기본폴더 불러오기(사이드바 세트만들기용)
		UserVo authUserVo = mainService.getUser(authUser.getId());
		int authUserNo = authUserVo.getUserNo();
		FolderVo userFolderVo = mainService.getFolder(authUserNo);
		session.setAttribute("authUserFolder", userFolderVo);
		
		// 내 폴더리스트 불러오기
		List<FolderVo> myfolderList = mainService.folderList(authUserNo);
		System.out.println("my폴더리스트 : " + myfolderList.toString());
		model.addAttribute("myfolderList", myfolderList);

		// 아이디로 유저번호 알아내기
		UserVo userVo = mainService.getUser(id);
		model.addAttribute("userVo", userVo);
		
		// 개인페이지 접속시 기본폴더 출력(나중에 최근학습 세트목록 불러오기로 수정)
		int userNo = userVo.getUserNo();
		FolderVo folderVo = mainService.getFolder(userNo);
		model.addAttribute("folderVo", folderVo);

		
		// 방문페이지 폴더리스트 불러오기
		List<FolderVo> otherfolderList = mainService.folderList(userNo);
		System.out.println("other폴더리스트 : " + otherfolderList.toString());
		model.addAttribute("otherfolderList", otherfolderList);
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		int folderRenderFlag = 1;
		model.addAttribute("folderRenderFlag", folderRenderFlag);
		
		//최근학습페이지 구분
		int recentlyStudy = 0;
		model.addAttribute("recentlyStudy", recentlyStudy);

		// 팔로우, 팔로워 숫자 나중에 넣기

		return "main/loginMain";
	}
	
	// 최근학습페이지
		@RequestMapping(value = "/{id}/recentlyStudy", method = { RequestMethod.GET, RequestMethod.POST })
		public String loginMainRecently(HttpSession session, Model model, @PathVariable("id") String id) {
			System.out.println("/Quizbook/loginMainRecently");
			
			//세션값 받아오기(아이디)
			UserVo authUser = (UserVo) session.getAttribute("authUser");
			
			System.out.println(authUser);
			
			// 로그인한 유저 기본폴더 불러오기(사이드바 세트만들기용)
			UserVo authUserVo = mainService.getUser(authUser.getId());
			int authUserNo = authUserVo.getUserNo();
			FolderVo userFolderVo = mainService.getFolder(authUserNo);
			session.setAttribute("authUserFolder", userFolderVo);
			
			// 내 폴더리스트 불러오기
			List<FolderVo> myfolderList = mainService.folderList(authUserNo);
			System.out.println("my폴더리스트 : " + myfolderList.toString());
			model.addAttribute("myfolderList", myfolderList);

			// 아이디로 유저번호 알아내기
			UserVo userVo = mainService.getUser(id);
			model.addAttribute("userVo", userVo);
			
			// 개인페이지 접속시 기본폴더 출력(나중에 최근학습 세트목록 불러오기로 수정)
			int userNo = userVo.getUserNo();
			FolderVo folderVo = mainService.getFolder(userNo);
			model.addAttribute("folderVo", folderVo);

			
			// 방문페이지 폴더리스트 불러오기
			List<FolderVo> otherfolderList = mainService.folderList(userNo);
			System.out.println("other폴더리스트 : " + otherfolderList.toString());
			model.addAttribute("otherfolderList", otherfolderList);
			
			//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
			int folderRenderFlag = 1;
			model.addAttribute("folderRenderFlag", folderRenderFlag);
			
			//최근학습페이지 구분
			int recentlyStudy = 1;
			model.addAttribute("recentlyStudy", recentlyStudy);

			// 팔로우, 팔로워 숫자 나중에 넣기

			return "main/loginMain";
		}
	
	
	/* 폴더리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/getFolderList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<FolderVo> getFolderList(@RequestBody FolderVo folderVo) {
		System.out.println("/Quizbook/getMyFolderList");
		System.out.println(folderVo);
		int userNo = folderVo.getUserNo();
		System.out.println(userNo);
		List<FolderVo> myfolderList = mainService.folderList(userNo);
		System.out.println("폴더리스트 : " + myfolderList.toString());
		
		return myfolderList;
		
	}
	 
	/* 세트리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/setList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<MainVo> setList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/setList");
		System.out.println(mainVo);
		// 사용자의 세트만 출력하기 위해 userNo를 받아 저장
		//int userNo = mainVo.getUserNo();
		// 폴더 번호
		int folderNo = mainVo.getFolderNo();
		// Main 나중에 이름 적당한거로 바꾸기
		List<MainVo> setList = mainService.getSetList(folderNo);
		System.out.println("구분하기 : : : " + setList.toString());
		
		//String space = setList.get(0).getSetExplain();
		
		return setList;
	}
	
	/* 이름순 세트리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/nameSetList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<MainVo> nameSetList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/nameSetList");
		System.out.println(mainVo);
		
		int folderNo = mainVo.getFolderNo();
		
		List<MainVo> setList = mainService.getSetListName(folderNo);
		System.out.println("구분하기 : : : " + setList.toString());
		
		return setList;
	}
	
	/* 최근학습 세트리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/recentlySetList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<MainVo> recentlySetList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/nameSetList");
		System.out.println(mainVo);
		
		int userNo = mainVo.getUserNo();
		
		List<MainVo> setList = mainService.getSetListRecently(userNo);
		System.out.println("구분하기 : : : " + setList.toString());
		
		return setList;
	}

	/* 세트삭제 */
	@ResponseBody
	@RequestMapping(value = "/setDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public int setDelete(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/setDelete");
		System.out.println("no:" + mainVo.getSetNo());
		int setNo = mainVo.getSetNo();
		int count = mainService.setDelete(setNo);
		return count;

	}

	/* 모달창 폴더리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "/folderList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<FolderVo> folderList(@RequestBody MainVo mainVo) {
		System.out.println("/Quizbook/folderList");
		System.out.println("no:" + mainVo.getUserNo());
		int userNo = mainVo.getUserNo();
		List<FolderVo> folderList = mainService.folderList(userNo);
		return folderList;

	}
	
	/* 폴더생성 */
	@RequestMapping(value = "/folderCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public String folderCreate(HttpSession session, @ModelAttribute FolderVo folderVo) {
		System.out.println("/Quizbook/folderCreate");

		System.out.println(folderVo.toString());

		mainService.createFolder(folderVo);

		UserVo loginUser = (UserVo) session.getAttribute("authUser");

		String id = loginUser.getId();

		return "redirect:/" + id + "";
	}

	/* 폴더삭제 */
	@RequestMapping(value="/folderDelete", method={RequestMethod.GET,
	RequestMethod.POST}) public String folderDelete(HttpSession
	session, @ModelAttribute FolderVo folderVo) {
		System.out.println("/Quizbook/folderDelete");
	 
		System.out.println(folderVo.toString());
	 
		mainService.deleteFolder(folderVo);
	 
		UserVo loginUser = (UserVo) session.getAttribute("authUser");
	 
		String id = loginUser.getId();
	 
		return "redirect:/" + id + ""; 
	}
	
	/* 폴더이름 불러오기 */
	@ResponseBody
	@RequestMapping(value="/getFolderName", method={RequestMethod.GET, RequestMethod.POST}) 
	public FolderVo getFolderName(HttpSession session, Model model, @RequestBody FolderVo folderVo) {
		System.out.println("/Quizbook/getFolder");
		
		System.out.println("폴더번호 이름" + folderVo);
		int folderNo = folderVo.getFolderNo();
		
		FolderVo folderName = mainService.getFolderName(folderNo);
		System.out.println("/Quizbook/getFolder : " + folderName);
		
		
		
		return folderName;
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
