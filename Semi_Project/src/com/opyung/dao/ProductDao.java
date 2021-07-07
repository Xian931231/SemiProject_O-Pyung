package com.opyung.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opyung.dto.ProductBoardDto;

import common.JDBCTemplate;

public class ProductDao extends JDBCTemplate{
	//마지막번호
	public int lastno(Connection con) {
		PreparedStatement pstm=null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT PRODUCT_NO FROM(SELECT * FROM PRODUCTBOARD ORDER BY PRODUCT_NO DESC)WHERE ROWNUM = 1";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03");
			
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

	
	//상품 전체 조회
	public List<ProductBoardDto> selectAll(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_new(rs.getString(7));
				dto.setProduct_content(rs.getString(8));
				dto.setProduct_id(rs.getString(9));
				dto.setProduct_date(rs.getDate(10));
				dto.setProduct_status(rs.getString(11));
				dto.setPtimg_src(rs.getString(14));
				dto.setPtimg_name(rs.getString(15));
				dto.setPtimg_type(rs.getString(16));
				dto.setPtimg_size(rs.getInt(17));
				
				res.add(dto);
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
	
	//상품 상세 조회
	public ProductBoardDto selectOne(Connection con, int ptno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ProductBoardDto res = new ProductBoardDto();
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_NO =?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, ptno);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				res.setProduct_no(rs.getInt(1));
				res.setProduct_title(rs.getString(2));
				res.setProduct_category(rs.getString(3));
				res.setProduct_price(rs.getInt(4));
				res.setProduct_brand(rs.getString(5));
				res.setProduct_addr(rs.getString(6));
				res.setProduct_new(rs.getString(7));
				res.setProduct_content(rs.getString(8));
				res.setProduct_id(rs.getString(9));
				res.setProduct_date(rs.getDate(10));
				res.setProduct_status(rs.getString(11));
				res.setPtimg_src(rs.getString(14));
				res.setPtimg_name(rs.getString(15));
				res.setPtimg_type(rs.getString(16));
				res.setPtimg_size(rs.getInt(17));
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
	
	//특정 상품 목록 조회
	public List<ProductBoardDto> selectAll(Connection con, String category) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_CATEGORY=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, category);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_new(rs.getString(7));
				dto.setProduct_content(rs.getString(8));
				dto.setProduct_id(rs.getString(9));
				dto.setProduct_date(rs.getDate(10));
				dto.setProduct_status(rs.getString(11));
				dto.setPtimg_src(rs.getString(14));
				dto.setPtimg_name(rs.getString(15));
				dto.setPtimg_type(rs.getString(16));
				dto.setPtimg_size(rs.getInt(17));
				
				res.add(dto);
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
	
	
	//상품추가
	public int insert(Connection con, ProductBoardDto dto) {
		PreparedStatement pstm = null;
		int res=0;
		String sql = "INSERT INTO PRODUCTBOARD VALUES(?,?,?,?,?,?,?,?,?,?,?,SYSDATE,'판매등록')";
		
	
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getProduct_no());
			pstm.setString(2, dto.getProduct_title());
			pstm.setString(3, dto.getProduct_category());
			pstm.setInt(4, dto.getProduct_price());
			pstm.setString(5, dto.getProduct_brand());
			pstm.setString(6, dto.getProduct_addr());
			pstm.setString(7, dto.getProduct_addr_latitude());
			pstm.setString(8, dto.getProduct_addr_longitude());
			pstm.setString(9, dto.getProduct_new());
			pstm.setString(10, dto.getProduct_content());
			pstm.setString(11, dto.getProduct_id());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		return res;
	}

	//상품 수정
	public int update(Connection con, ProductBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "UPDATE PRODUCTBOARD SET PRODUCT_TITLE=?,PRODUCT_CATEGORY=?,PRODUCT_PRICE=?,PRODUCT_BRAND=?,PRODUCT_ADDR=?,PRODUCT_NEW=?,PRODUCT_CONTENT=? WHERE PRODUCT_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getProduct_title());
			pstm.setString(2, dto.getProduct_category());;
			pstm.setInt(3, dto.getProduct_price());
			pstm.setString(4, dto.getProduct_brand());
			pstm.setString(5, dto.getProduct_addr());
			pstm.setString(6, dto.getProduct_new());
			pstm.setString(7, dto.getProduct_content());
			pstm.setInt(8, dto.getProduct_no());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return res;
	}
		
		
	//상품 삭제
	public int delete(Connection con, int ptno) {
		PreparedStatement pstm= null;
		int res=0;
		
		String sql = "DELETE FROM PRODUCTBOARD WHERE PRODUCT_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, ptno);
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return res;
	}
	
	
	
	//이미지 테이블
	
	//이미지 추가
	public int insertImg(Connection con, ProductBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "INSERT INTO PTIMGBOARD VALUES(PTIMGSQ.NEXTVAL,?,?,?,?,?)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getProduct_no());
			pstm.setString(2, dto.getPtimg_src());
			pstm.setString(3, dto.getPtimg_name());
			pstm.setString(4, dto.getPtimg_type());
			pstm.setInt(5, dto.getPtimg_size());
			System.out.println("03" + sql);
			
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

	//이미지 수정
	public int updateImg(Connection con, ProductBoardDto dto) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql ="UPDATE PTIMGBOARD SET PTIMG_NAME=?, PTIMG_TYPE=?, PTIMG_SIZE=? WHERE PTIMG_PRODUCTNO=?";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getPtimg_name());
			pstm.setString(2, dto.getPtimg_type());
			pstm.setInt(3, dto.getPtimg_size());
			pstm.setInt(4, dto.getProduct_no());
			System.out.println("03" + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		return res;
	}


	

	





	


}
