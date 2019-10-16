package LF.seller.model.vo;

import java.io.Serializable;

public class Seller implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7566013533267856474L;
	private int sId;			//판매자 회원 식별번호 
	private char bStatus;		//물품판매 권한 승인여부	--> 사업자 등록 진행상황
	private String bName;		//법인명(단체명)	주식회사 인더스비전
	private String bNum;			//사업자 번호
	private String cpNum;			//법인 번호
	private String acNum;			//계좌 번호			기업은행 / 337-108258-01-024
	private String acName;		//예금주			//(주)인더스비전
	private String bankName;	//은행 이름			//(주)인더스비전
	private int cId;			//시퀀스를 통한 회원번호(회원 가입하면 생기는 번호)
	private int fId;			//파일 번호(사업자등록증)  -> pAttachment의 FID 외래키.
	
	
	
	public Seller() {
		super();
	}

	
	public Seller(String bName, String bNum, String cpNum, String bankName, String acNum, String acName, int cId) {
		super();
		this.bName = bName;
		this.bNum = bNum;
		this.cpNum = cpNum;
		this.acNum = acNum;
		this.acName = acName;
		this.bankName = bankName;
		this.cId = cId;
	}


	public Seller(String bName, String bNum, String cpNum, String bankName, String acNum, String acName) {
		super();
		this.bName = bName;
		this.bNum = bNum;
		this.cpNum = cpNum;
		this.acNum = acNum;
		this.acName = acName;
		this.bankName = bankName;
	}





	public Seller(int sId, char bStatus, String bName, String bNum, String cpNum, String acNum, String acName,
			String bankName, int cId, int fId) {
		super();
		this.sId = sId;
		this.bStatus = bStatus;
		this.bName = bName;
		this.bNum = bNum;
		this.cpNum = cpNum;
		this.acNum = acNum;
		this.acName = acName;
		this.bankName = bankName;
		this.cId = cId;
		this.fId = fId;
	}



	public int getsId() {
		return sId;
	}



	public void setsId(int sId) {
		this.sId = sId;
	}



	public char getbStatus() {
		return bStatus;
	}



	public void setbStatus(char bStatus) {
		this.bStatus = bStatus;
	}



	public String getbName() {
		return bName;
	}



	public void setbName(String bName) {
		this.bName = bName;
	}



	public String getbNum() {
		return bNum;
	}



	public void setbNum(String bNum) {
		this.bNum = bNum;
	}



	public String getCpNum() {
		return cpNum;
	}



	public void setCpNum(String cpNum) {
		this.cpNum = cpNum;
	}



	public String getAcNum() {
		return acNum;
	}



	public void setAcNum(String acNum) {
		this.acNum = acNum;
	}



	public String getAcName() {
		return acName;
	}



	public void setAcName(String acName) {
		this.acName = acName;
	}



	public String getBankName() {
		return bankName;
	}



	public void setBankName(String bankName) {
		this.bankName = bankName;
	}



	public int getcId() {
		return cId;
	}



	public void setcId(int cId) {
		this.cId = cId;
	}



	public int getfId() {
		return fId;
	}



	public void setfId(int fId) {
		this.fId = fId;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "Seller [sId=" + sId + ", bStatus=" + bStatus + ", bName=" + bName + ", bNum=" + bNum + ", cpNum="
				+ cpNum + ", acNum=" + acNum + ", acName=" + acName + ", bankName=" + bankName + ", cId=" + cId
				+ ", fId=" + fId + "]";
	}
	
	



	
	
}
