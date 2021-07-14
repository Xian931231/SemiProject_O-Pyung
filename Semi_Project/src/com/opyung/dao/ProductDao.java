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
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_STATUS <> '판매완료'";
		
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
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_src(rs.getString(16));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				dto.setPtimg_size(rs.getInt(19));
				
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
				res.setProduct_addr_latitude(rs.getString(7));
				res.setProduct_addr_longitude(rs.getString(8));
				res.setProduct_new(rs.getString(9));
				res.setProduct_content(rs.getString(10));
				res.setProduct_id(rs.getString(11));
				res.setProduct_date(rs.getDate(12));
				res.setProduct_status(rs.getString(13));
				res.setPtimg_src(rs.getString(16));
				res.setPtimg_name(rs.getString(17));
				res.setPtimg_type(rs.getString(18));
				res.setPtimg_size(rs.getInt(19));
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
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_CATEGORY=? AND PRODUCT_STATUS != '판매완료'";
		
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
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_src(rs.getString(16));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				dto.setPtimg_size(rs.getInt(19));
				
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
		
		String sql = "UPDATE PRODUCTBOARD SET PRODUCT_TITLE=?,PRODUCT_CATEGORY=?,PRODUCT_PRICE=?,PRODUCT_BRAND=?,PRODUCT_ADDR=?,PRODUCT_ADDR_LATITUDE=?,PRODUCT_ADDR_LONGITUDE=?,PRODUCT_NEW=?,PRODUCT_CONTENT=? WHERE PRODUCT_NO=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getProduct_title());
			pstm.setString(2, dto.getProduct_category());;
			pstm.setInt(3, dto.getProduct_price());
			pstm.setString(4, dto.getProduct_brand());
			pstm.setString(5, dto.getProduct_addr());
			pstm.setString(6, dto.getProduct_addr_latitude());
			pstm.setString(7, dto.getProduct_addr_longitude());
			pstm.setString(8, dto.getProduct_new());
			pstm.setString(9, dto.getProduct_content());
			pstm.setInt(10, dto.getProduct_no());
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
			close(pstm);
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


	//관심상품 목록 조회
	public List<ProductBoardDto> likeList(Connection con, String id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		
		String sql = "SELECT PRODUCTBOARD.*,PTIMGBOARD.* FROM LIKEPRODUCTBOARD,MEMBERBOARD,PRODUCTBOARD,PTIMGBOARD WHERE MB_NO=LIKEPT_MEMBERNO AND LIKEPT_PRODUCTNO = PRODUCT_NO AND PRODUCT_NO = PTIMG_PRODUCTNO AND MB_ID=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				
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

	//헤더 검색기능
	public List<ProductBoardDto> selectSearchVal(Connection con, String searchVal) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_TITLE LIKE ? OR PRODUCT_CATEGORY LIKE ? OR PRODUCT_BRAND LIKE ? OR PRODUCT_ADDR LIKE ? OR PRODUCT_CONTENT LIKE ? AND PRODUCT_STATUS != '판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, "%"+searchVal+"%");
			pstm.setString(2, "%"+searchVal+"%");
			pstm.setString(3, "%"+searchVal+"%");
			pstm.setString(4, "%"+searchVal+"%");
			pstm.setString(5, "%"+searchVal+"%");
			System.out.println("03" + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_src(rs.getString(16));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				dto.setPtimg_size(rs.getInt(19));
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

	//최대가격
	public int maxPrice(Connection con) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		
		String sql = "SELECT MAX(PRODUCT_PRICE) FROM PRODUCTBOARD";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03"+ sql);
			rs = pstm.executeQuery();
			System.out.println("04");
			while(rs.next()) {
				res = rs.getInt(1);
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

	//체크박스 검색
	public List<ProductBoardDto> searchChk(Connection con, String[] category, String[] brand, String[] addr,
			String[] newvar, int min, int max) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_CATEGORY IN (?,?,?,?,?,?,?,?,?) AND PRODUCT_BRAND IN (?,?,?,?,?,?,?,?,?) AND (PRODUCT_ADDR LIKE ? OR PRODUCT_ADDR LIKE ? OR PRODUCT_ADDR LIKE ? OR PRODUCT_ADDR LIKE ? OR PRODUCT_ADDR LIKE ? OR PRODUCT_ADDR LIKE ?) AND PRODUCT_NEW IN (?,?) AND (PRODUCT_PRICE BETWEEN ? AND ?) AND PRODUCT_STATUS != '판매완료'";
		
		try {
			pstm = con.prepareStatement(sql);
			for(int i=0;i<category.length;i++) {
				pstm.setString(i+1, category[i]);
				System.out.println(category[i]);
			}
			for(int i=0;i<brand.length;i++) {
				pstm.setString(i+10,brand[i]);
				System.out.println(brand[i]);
			}
			for(int i=0;i<addr.length;i++) {
				pstm.setString(i+19,"%"+addr[i]+"%");
				System.out.println(addr[i]);
			}
			pstm.setString(25, newvar[0]);
			System.out.println(newvar[0]);
			pstm.setString(26, newvar[1]);
			System.out.println(newvar[1]);
			pstm.setInt(27, min);
			pstm.setInt(28, max);
			System.out.println("03"+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_src(rs.getString(16));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				dto.setPtimg_size(rs.getInt(19));
				res.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstm);
			System.out.println(res.size());
		}
		return res;
	}


	//버튼클릭 검색
	public List<ProductBoardDto> searchBtn(Connection con, String category) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ProductBoardDto> res = new ArrayList<ProductBoardDto>();
		
		String sql = "SELECT * FROM PRODUCTBOARD LEFT JOIN PTIMGBOARD ON PRODUCT_NO = PTIMG_PRODUCTNO WHERE PRODUCT_CATEGORY = ? AND PRODUCT_STATUS != '판매완료'";
		
		try {
			pstm =con.prepareStatement(sql);
			pstm.setString(1, category);
			System.out.println("03" +sql);
			
			rs = pstm.executeQuery();
			System.out.println("04");
			while(rs.next()) {
				ProductBoardDto dto = new ProductBoardDto();
				dto.setProduct_no(rs.getInt(1));
				dto.setProduct_title(rs.getString(2));
				dto.setProduct_category(rs.getString(3));
				dto.setProduct_price(rs.getInt(4));
				dto.setProduct_brand(rs.getString(5));
				dto.setProduct_addr(rs.getString(6));
				dto.setProduct_addr_latitude(rs.getString(7));
				dto.setProduct_addr_longitude(rs.getString(8));
				dto.setProduct_new(rs.getString(9));
				dto.setProduct_content(rs.getString(10));
				dto.setProduct_id(rs.getString(11));
				dto.setProduct_date(rs.getDate(12));
				dto.setProduct_status(rs.getString(13));
				dto.setPtimg_src(rs.getString(16));
				dto.setPtimg_name(rs.getString(17));
				dto.setPtimg_type(rs.getString(18));
				dto.setPtimg_size(rs.getInt(19));
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
	
	
	
	
	//판매상태 판매완료로 변경
	public int updatePtStatus(Connection con, int productno, String ptStatus) {
		
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE PRODUCTBOARD SET PRODUCT_STATUS=? WHERE PRODUCT_NO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, ptStatus);
			pstm.setInt(2, productno);
			System.out.println("03. query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
			System.out.println("05. db종료\n");
		}
		
		return res;
	}

	//탈퇴시 상품 전체 삭제
	public int deletePtAll(Connection con, String id) {
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = "DELETE FROM PRODUCTBOARD WHERE PRODUCT_ID = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstm);
		}
		
		return res;
	}


	

	





	


}
