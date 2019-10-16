package LF.seller.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static LF.common.JDBCTemplate.*;

import LF.product.model.vo.pAttachment;
import LF.seller.model.vo.Seller;

public class SellerDao {
	
	private Properties prop = new Properties();
	
	public SellerDao() {
		//항상 seller=query.properties 값 불러오도록 초기셋팅하기
		String fileName = SellerDao.class.getResource("/sql/seller-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int registSeller(Connection conn, Seller seller) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, seller.getbName());
			pstmt.setString(2, seller.getbNum());
			pstmt.setString(3, seller.getCpNum());
			pstmt.setString(4, seller.getAcNum());
			pstmt.setString(5, seller.getAcName());
			pstmt.setString(6, seller.getBankName());
			pstmt.setInt(7, seller.getcId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public int registImage(Connection conn, ArrayList<pAttachment> list, ArrayList<pAttachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertpAttachment");
		
		try {
			for(int i=0; i<fileList.size();i++) {
				pAttachment at = fileList.get(i);
				
				pstmt=conn.prepareStatement(query);
				pstmt.setInt(1, at.getfId());
				pstmt.setString(2, at.getFileName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		// fileList가 가진 파일 갯수만큼의 행이 모두 insert가 되었다면
		if(result == fileList.size())
			return result;
		else
			return 0;
	}





	public ArrayList<pAttachment> getFid(Connection conn, Seller seller) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<pAttachment> list = null;
		
		String query = prop.getProperty("getfId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, seller.getsId());
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<pAttachment>();	//중요쓰!!!
			
			while(rs.next()) {
				pAttachment at = new pAttachment();
				at.setfId(rs.getInt("fid"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		
		return list;
	}
	
}
