package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.MainService;
import com.javaex.service.WordService;
import com.javaex.vo.MainVo;
import com.javaex.vo.WordVo;

@Controller
@RequestMapping(value="/set", method={RequestMethod.GET, RequestMethod.POST})
public class SetController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private WordService wordService;
	
	/* 세트만들기 화면이동 */
	@RequestMapping(value = "/{folderno}", method = { RequestMethod.GET, RequestMethod.POST })
	public String Set(Model model, @PathVariable("folderno") int folderNo) {
		System.out.println("set/Set");
		
		int setFlag = 0;
		model.addAttribute("folderNo", folderNo);
		model.addAttribute("setFlag", setFlag);
	
		return "study/set";
	}
	
	/* 세트수정 화면이동 */
	@RequestMapping(value = "setModify/{setno}", method = { RequestMethod.GET, RequestMethod.POST })
	public String SetModify(Model model, @PathVariable("setno") int setNo) {
		System.out.println("set/setModify");
		
		System.out.println("세트번호" + setNo);
		
		//List<WordVo> wordList = wordService.getWords(setNo);
		//System.out.println(wordList.toString());
		//model.addAttribute("wordList", wordList);
		
		int setFlag = 1;
		model.addAttribute("setFlag", setFlag);
		
		MainVo setVo = mainService.getSetOne(setNo); //클릭한 세트의 정보 넘기기
		System.out.println(setVo.toString());
		model.addAttribute("setVo", setVo);
	
		return "study/set";
	}
	
	/* 카드리스트 불러오기 */
	@ResponseBody
	@RequestMapping(value = "setModifyList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<WordVo> SetModifyList(@RequestBody MainVo mainVo) {
		System.out.println("set/setModifyList");
		
		int setNo = mainVo.getSetNo();
		
		List<WordVo> wordList = wordService.getWords(setNo);
		System.out.println(wordList.toString());
		
		return wordList;
	}
	
	/* 세트만들기 */
	@ResponseBody
	@RequestMapping(value = "/setCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public int setCreate(@RequestBody MainVo setVo) {
		System.out.println("set/setCreate");
		
		System.out.println(setVo.toString());
		
		/* 기존세트만들기 활용 */
		mainService.setCreate(setVo);
		
		/* 만들어진세트 번호가져오기 */
		int createSetNo = mainService.getSetCreate(setVo);
		
		return createSetNo;
		
	}
	
	/* 카드만들기 */
	@ResponseBody
	@RequestMapping(value = "/cardCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public int setCreate(@RequestBody Map<String, Object> setCreateMap) {
		System.out.println("set/cardCreate");
		
		System.out.println(setCreateMap.toString());

		//카드만들기(이미지 나중에 추가)
		int setNo = (int) setCreateMap.get("createSetNo"); 
		int orderNo = (int) setCreateMap.get("orderNo"); 
		String word = (String) setCreateMap.get("word");
		String meaning = (String) setCreateMap.get("meaning");
						
		WordVo wordVo = new WordVo( 0, setNo, orderNo, word, meaning, "abc");
		System.out.println(wordVo.toString());
		
		return wordService.cardCreate(wordVo);

		 
	}
	
	/* 세트업데이트 */
	@ResponseBody
	@RequestMapping(value = "/setUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public int setUpdate(@RequestBody MainVo setVo) {
		System.out.println("set/setUpdate");
		
		System.out.println(setVo.toString());
		
		mainService.setUpdate(setVo);
		
		int count = 0;
		
		return count;
	}
	
	/* 카드업데이트 */
	@ResponseBody
	@RequestMapping(value = "/cardUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public int cardUpdate(@RequestBody WordVo wordVo) {
		System.out.println("set/cardUpdate");
		
		System.out.println(wordVo.toString());
		
		wordService.cardUpdate(wordVo);
		
		int count = 0;
		
		return count;
	}

}
