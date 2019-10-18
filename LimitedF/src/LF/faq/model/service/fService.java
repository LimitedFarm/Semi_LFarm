package LF.faq.model.service;

import static LF.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import LF.faq.model.dao.FaqDao;
import LF.faq.model.vo.Faq;

public class fService {

	public static ArrayList<Faq> selectfList() {
			Connection conn = getConnection();
			
			ArrayList<Faq> flist = new FaqDao().selectfList(conn);
			
			
			
			close(conn);
			
		return flist;
	}

}
