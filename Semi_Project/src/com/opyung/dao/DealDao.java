package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opyung.dto.DealBoardDto;
import com.opyung.dto.ProductBoardDto;

import common.JDBCTemplate;

public class DealDao extends JDBCTemplate{

	//마지막번호
	public int lastno(Connection con) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT DEAL_NO FROM(SELECT * FROM DEALBOARD ORDER BY DEAL_NO DESC)WHERE ROWNUM = 1";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res = rs.getInt(1);
				System.out.println("번호 :" +rs.getInt(1));
				System.out.println("번호 :"+res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	
	public int insert(Connection con,int dealno, ProductBoardDto ptdto, String bid) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO DEALBOARD VALUES(?,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dealno);
			pstm.setInt(2, ptdto.getProduct_no());
			pstm.setString(3, ptdto.getProduct_id());
			pstm.setString(4, bid);
			pstm.setInt(5, ptdto.getProduct_price());
			System.out.println("03"+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		
		
		return res;
	}

	//거래페이지 조회
	public DealBoardDto selecOne(Connection con, int dealno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		DealBoardDto res = new DealBoardDto();
		
		String sql = "SELECT * FROM DEALBOARD WHERE DEAL_NO = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dealno);
			System.out.println("03"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setDeal_no(rs.getInt(1));
				res.setDeal_productNo(rs.getInt(2));
				res.setDeal_sid(rs.getString(3));
				res.setDeal_bid(rs.getString(4));
				res.setDeal_price(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	

}
