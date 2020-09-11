package com.javaex.vo;

public class WordVo{
	public int wordNo, setNo, orderNo;
	public String word, meaning, wordImg;
	
	public WordVo() {
	}

	public WordVo(int wordNo, int setNo, int orderNo, String word, String meaning, String wordImg) {
		this.wordNo = wordNo;
		this.setNo = setNo;
		this.orderNo = orderNo;
		this.word = word;
		this.meaning = meaning;
		this.wordImg = wordImg;
	}
	
	public int getWordNo() {
		return wordNo;
	}
	public void setWordNo(int wordNo) {
		this.wordNo = wordNo;
	}
	public int getSetNo() {
		return setNo;
	}
	public void setSetNo(int setNo) {
		this.setNo = setNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getWordImg() {
		return wordImg;
	}
	public void setWordImg(String wordImg) {
		this.wordImg = wordImg;
	}

	@Override
	public String toString() {
		return "WordVo [wordNo=" + wordNo + ", setNo=" + setNo + ", orderNo=" + orderNo + ", word=" + word
				+ ", meaning=" + meaning + ", wordImg=" + wordImg + "]";
	}
	
	
	
	
}