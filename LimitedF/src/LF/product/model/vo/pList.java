package LF.product.model.vo;

import java.sql.Date;

public class pList {
	private int pId;			//물품 번호
	private int sId;			//판매자 번호
	private String pName;		//물품 이름
	private int pPrice;			//가격
	private int pCount;			//재고량
	private String pAddress;	//원산지
	private Date pDay;			//생산일자
	private Date pPeriod;		//유통기한
	private char status;		//판매 활성/비활성 상태
	private int fId;			//파일번호(판매 상품 관련 상품사진 및 비디오에 대한)
	private int cateId;			//카테고리 번호(판매 상품 게시글의 카테고리)
	
	public pList() {
		super();
	}

	public pList(int pId, int sId, String pName, int pPrice, int pCount, String pAddress, Date pDay, Date pPeriod,
			char status, int fId, int cateId) {
		super();
		this.pId = pId;
		this.sId = sId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pCount = pCount;
		this.pAddress = pAddress;
		this.pDay = pDay;
		this.pPeriod = pPeriod;
		this.status = status;
		this.fId = fId;
		this.cateId = cateId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public Date getpDay() {
		return pDay;
	}

	public void setpDay(Date pDay) {
		this.pDay = pDay;
	}

	public Date getpPeriod() {
		return pPeriod;
	}

	public void setpPeriod(Date pPeriod) {
		this.pPeriod = pPeriod;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	@Override
	public String toString() {
		return "pList [pId=" + pId + ", sId=" + sId + ", pName=" + pName + ", pPrice=" + pPrice + ", pCount=" + pCount
				+ ", pAddress=" + pAddress + ", pDay=" + pDay + ", pPeriod=" + pPeriod + ", status=" + status + ", fId="
				+ fId + ", cateId=" + cateId + "]";
	}
	
	
	

}
