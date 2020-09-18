package com.javaex.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		
		//세트 수정인지 만들기인지 구분하기 위한 정보 전달
		int setFlag = 0;
		model.addAttribute("setFlag", setFlag);
		
		//어느 폴더에 저장될건지 구분하는 정보 전달
		model.addAttribute("folderNo", folderNo);
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		int folderRenderFlag = 0;
		model.addAttribute("folderRenderFlag", folderRenderFlag);
	
		return "study/set";
	}
	
	/* 세트수정 화면이동 */
	@RequestMapping(value = "setModify/{setno}", method = { RequestMethod.GET, RequestMethod.POST })
	public String SetModify(Model model, @PathVariable("setno") int setNo) {
		System.out.println("set/setModify");
		
		System.out.println("세트번호" + setNo);
		
		//세트 수정인지 만들기인지 구분하기 위한 정보 전달
		int setFlag = 1;
		model.addAttribute("setFlag", setFlag);
		
		//사이드바 폴더를 그릴건지 안그릴건지 구분하기 위한 정보 전달
		boolean folderRenderFlag = false;
		model.addAttribute("folderRenderFlag", folderRenderFlag);
		
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
	
	/* 세트이미지 업로드 */
	@ResponseBody
	@RequestMapping(value = "/setImgUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public String setImgUpload(@RequestParam("file") MultipartFile file) {
		System.out.println("set/setImgUpload");
		
		return mainService.setImgUpload(file);
	}
	
	/* 세트만들기 */
	@ResponseBody
	@RequestMapping(value = "/setCreate", method = { RequestMethod.GET, RequestMethod.POST })
	public int setCreate(@RequestBody MainVo setVo) {
		System.out.println("set/setCreate");
		
		System.out.println(setVo.toString());
		
		/* 기존세트만들기 활용 */
		mainService.setCreate(setVo);
		
		int userNo = setVo.getUserNo();
		System.out.println("set/setCreate userNo:" + userNo);
		
		/* 만들어진세트 번호가져오기 */
		int createSetNo = mainService.getSetCreate(userNo);
		
		return createSetNo;
		
	}
	
	/* 카드이미지 업로드 */
	@ResponseBody
	@RequestMapping(value = "/cardImgUpload", method = { RequestMethod.GET, RequestMethod.POST })
	public String cardImgUpload(@RequestParam("file") MultipartFile file) {
		System.out.println("set/cardImgUpload");
		
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		
		return wordService.cardImgUpload(file);
		
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
		String wordImg = (String) setCreateMap.get("wordImg");
						
		WordVo wordVo = new WordVo( 0, setNo, orderNo, word, meaning, wordImg);
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
	
	/* 카드리셋 */
	@ResponseBody
	@RequestMapping(value = "/cardReset", method = { RequestMethod.GET, RequestMethod.POST })
	public int cardReset(@RequestBody WordVo wordVo) {
		System.out.println("set/cardReset");
		System.out.println(wordVo.toString());
		
		wordService.cardReset(wordVo);
		
		int count = 0;
		
		return count;
	}
	
	/* 리셋후 저장 */
	@ResponseBody
	@RequestMapping(value = "/cardUpdate", method = { RequestMethod.GET, RequestMethod.POST })
	public int cardUpdate(@RequestBody WordVo wordVo) {
		System.out.println("set/cardUpdate");
		
		System.out.println(wordVo.toString());
		
		wordService.cardUpdate(wordVo);
		
		int count = 0;
		
		return count;
	}
	
	
	/* 세트복사 */
	@ResponseBody
	@RequestMapping(value = "/setCopy", method = { RequestMethod.GET, RequestMethod.POST })
	public int setCopy(@RequestBody MainVo vo) {
		System.out.println("set/folderList");

		System.out.println(vo.getFolderNo());
		System.out.println(vo.getSetNo());
		System.out.println(vo.getUserNo());

		int folderNo = vo.getFolderNo();
		int setNo = vo.getSetNo();
		int userNo = vo.getUserNo();

		mainService.getSet(folderNo, setNo, userNo);
		System.out.println("========================");
		int createSetNo = mainService.getSetCreate(userNo);
		
		System.out.println("createSetNo : " + createSetNo);
		
		List<WordVo> cardList = wordService.getWords(setNo);
		
		System.out.println("cardListsize : " + cardList.toString());
		
		for(int i=0;i<cardList.size();i++) {
			System.out.println(cardList.get(i) + "\n");
			cardList.get(i).setSetNo(createSetNo);
			wordService.cardCreate(cardList.get(i));
		}
		return folderNo;

	}
	
	/* 카드리스트 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/getCardList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<WordVo> getCardList(@RequestParam("setno") int setNo) {
		System.out.println("set/getCardList");

		
		System.out.println("setNo:::" + setNo);

		List<WordVo> cardList = wordService.getWords(setNo);
		
		System.out.println("cardList는? : " + cardList.toString());
		
		return cardList;


	}

}
