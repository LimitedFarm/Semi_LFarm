package LF.seller.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import LF.product.model.vo.pAttachment;
import LF.seller.model.dao.SellerDao;
import LF.seller.model.vo.Seller;
import static LF.common.JDBCTemplate.*;

public class SellerService {

	public int registSeller(Seller seller, ArrayList<pAttachment> fileList) {
		Connection conn = getConnection();
		
		SellerDao sDao = new SellerDao();
		
		int result1 = sDao.registSeller(conn, seller);
		
		ArrayList<pAttachment> list = sDao.getFid(conn, seller);
		
		
		int result2 = sDao.registImage(conn, list, fileList);
		
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

}
