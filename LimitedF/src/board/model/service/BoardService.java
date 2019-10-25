package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.PaymentInfo;

public class BoardService {
	
	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		// BoardDao 메소드 두개를 호출하자
		BoardDao bDao = new BoardDao();
		
		int result1 = bDao.insertThBoard(conn,b);
		int result2 = bDao.insertAttachment(conn,fileList);
		
		int result = 0;
		
		if(result1>0 && result2>0) {
			commit(conn);
			result =1;
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public Board selectBoard(int pId) {
		Connection conn = getConnection();
		
		Board b = new Board();
		BoardDao bDao = new BoardDao();
		
		b=bDao.selectBoard(conn,pId);
	
		
		close(conn);
		
		return b;
	}
	
	public ArrayList<Attachment> selectThumbnail(int pId) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDao().selectThumbnail(conn,pId);
		
		close(conn);
		
		return list;
	}

	public int insertPayInfo(PaymentInfo p) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoard(conn, p);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	/*
	 * public int updateCount(int count, int pid, ) { Connection conn =
	 * getConnection();
	 * 
	 * int result = new BoardDao().updateCount(conn, pid);
	 * 
	 * if(result>0) { commit(conn); }else { rollback(conn); } close(conn);
	 * 
	 * return result; }
	 */

	public int updatePListInfo(int pid, int count) {
		Connection conn = getConnection();
		int result = new BoardDao().updatePListInfo(conn, pid, count);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	

}
