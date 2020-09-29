package com.javaex.vo;

public class AnswerVo {
	
	private int answerNo;
	private int studyNo;
	private int wordNo;
	private int correct;
	
	public AnswerVo() {}
	
	

	public AnswerVo(int studyNo, int wordNo) {
		this.studyNo = studyNo;
		this.wordNo = wordNo;
	}



	public AnswerVo(int answerNo, int studyNo, int wordNo, int correct) {
		this.answerNo = answerNo;
		this.studyNo = studyNo;
		this.wordNo = wordNo;
		this.correct = correct;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getWordNo() {
		return wordNo;
	}

	public void setWordNo(int wordNo) {
		this.wordNo = wordNo;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	@Override
	public String toString() {
		return "AnswerVo [answerNo=" + answerNo + ", studyNo=" + studyNo + ", wordNo=" + wordNo + ", correct=" + correct
				+ "]";
	}
	

}
