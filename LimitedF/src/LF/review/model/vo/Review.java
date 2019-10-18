package LF.review.model.vo;

import java.sql.Date;

public class Review {
	private int reId;	//리뷰번호
	private String reContent;	//리뷰 내용
	private int grade;	//상품 평점
	private char status;	//리뷰 황성 비활성
	private int sale_Id;	//판매번호
	private int cId;	//회원 번호
	private String review_Date;	//리뷰 작성일
	
	
	public Review() {
		super();
	}


	public Review(int reId, String reContent, int grade, char status, int sale_Id, int cId, String review_Date) {
		super();
		this.reId = reId;
		this.reContent = reContent;
		this.grade = grade;
		this.status = status;
		this.sale_Id = sale_Id;
		this.cId = cId;
		this.review_Date = review_Date;
	}


	public int getReId() {
		return reId;
	}


	public void setReId(int reId) {
		this.reId = reId;
	}


	public String getReContent() {
		return reContent;
	}


	public void setReContent(String reContent) {
		this.reContent = reContent;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public char getStatus() {
		return status;
	}


	public void setStatus(char status) {
		this.status = status;
	}


	public int getSale_Id() {
		return sale_Id;
	}


	public void setSale_Id(int sale_Id) {
		this.sale_Id = sale_Id;
	}


	public int getcId() {
		return cId;
	}


	public void setcId(int cId) {
		this.cId = cId;
	}


	public String getReview_Date() {
		return review_Date;
	}


	public void setReview_Date(String review_Date) {
		this.review_Date = review_Date;
	}


	@Override
	public String toString() {
		return "Review [reId=" + reId + ", reContent=" + reContent + ", grade=" + grade + ", status=" + status
				+ ", sale_Id=" + sale_Id + ", cId=" + cId + ", review_Date=" + review_Date + "]";
	}


	
	
	
	
	

}
