package LF.product.model.vo;

import java.sql.Date;

public class pAttachment {
	
	private int fId;	//파일 번호
	private String fileName;	//파일 이름
	private String changeName;	//수정된 파일 이름
	private String filePath;	//파일 경로
	private Date uploadDate;	//업로드 날짜
	private char status;	//파일 상태 여부
	
	public pAttachment() {
		super();
	}

	public pAttachment(int fId, String fileName, String changeName, String filePath, Date uploadDate, char status) {
		super();
		this.fId = fId;
		this.fileName = fileName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "pAttachment [fId=" + fId + ", fileName=" + fileName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}

	
	
	
	
	
}
