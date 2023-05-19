package kr.fit.program;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.fit.login.UserDTO;
import kr.fit.notice.NoticeDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class BasketDAO {
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public BasketDAO() {
		dbopen=new DBOpen();
	}//end

	
//	public ArrayList<BasketDTO> list(String b_id){
//		ArrayList<BasketDTO> list=null;
//		try {
//			con=dbopen.getConnection();
//			sql=new StringBuilder();
//			sql.append(" SELECT b_id, b_num, b_code, b_price, b_amount, b_name " );
//			sql.append(" FROM ft_basket ");
//			sql.append(" WHERE b_id=? ");
////			sql.append(" ORDER BY b_code DESC ");
//			
//
//			pstmt=con.prepareStatement(sql.toString());
////			pstmt.setString(1, b_id);
//			rs=pstmt.executeQuery();
//			
//			
//			if(rs.next()) {
//				list=new ArrayList<BasketDTO>();
//				do {
//					BasketDTO dto=new BasketDTO();
//					dto.setB_id(rs.getString("b_id"));
//					dto.setB_num(rs.getString("b_num"));
//					dto.setB_code(rs.getString("b_code"));
//					dto.setB_price(rs.getString("b_price"));
//					dto.setB_amount(rs.getInt("b_amount"));
//					dto.setB_name(rs.getString("b_name"));
//					
//					
//					list.add(dto);
////					System.out.println(dto);
//				}while(rs.next());
//			}//if end
//			
//		}catch(Exception e) {
//			System.out.println("장바구니 목록 실패:" + e);
//		}finally {
//			DBClose.close(con,pstmt,rs);
//		}//end
//		return list;
//	}//list() end



	
	public ArrayList<BasketDTO> list(String b_id){
		ArrayList<BasketDTO> list=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT b_id, b_num, b_code, b_price, b_amount, b_name " );
			sql.append(" FROM ft_basket ");
//			sql.append(" WHERE b_id=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
//			pstmt.setString(1, b_id);
			
			if(rs.next()) {
				list=new ArrayList<BasketDTO>();
				do {
					BasketDTO dto=new BasketDTO();					
					dto.setB_num(rs.getString("b_num"));
					dto.setB_code(rs.getString("b_code"));
					dto.setB_price(rs.getString("b_price"));
					dto.setB_amount(rs.getInt("b_amount"));
					dto.setB_name(rs.getString("b_name"));
					dto.setB_id(rs.getString("b_id"));
					list.add(dto);
				}while(rs.next());
			}//if end
			
			
		}catch(Exception e) {
			System.out.println("장바구니 목록 실패:" + e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}//end
		return list;
	}//list() end

	
	
	
	
	public  int add(BasketDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" INSERT INTO FT_BASKET(b_num , b_code, b_price, b_amount, b_id, b_name )");
			sql.append(" VALUES (b_numseq.nextval, ?, ?, ?, ?, ?)");

			pstmt=con.prepareStatement(sql.toString());		

			pstmt.setString(1, dto.getB_code());
			pstmt.setString(2, dto.getB_price());
			pstmt.setInt(3, dto.getB_amount());
			pstmt.setString(4, dto.getB_id());
			pstmt.setString(5, dto.getB_name());
			
			
			cnt=pstmt.executeUpdate();
			
			
            System.out.println("장바구기 담기 성공");			
		}catch(Exception e) {
			System.out.println("장바구니 담기 실패:" + e);
		}finally {
			DBClose.close(con,pstmt);
		}
		return cnt;
	}//add() end
	
//	
//	
//	public int delete(BasketDTO dto) {
//		int cnt=0;
//        try {
//        	con=dbopen.getConnection();
//			sql=new StringBuilder();
//            sql.append(" DELETE FROM ft_bbs ");
//            sql.append(" WHERE b_code=? ");
//            
//            pstmt=con.prepareStatement(sql.toString());
//            pstmt.setString(1, dto.getB_code());
//            cnt = pstmt.executeUpdate();
//          
//        }catch (Exception e) {
//            System.out.println("삭제 실패:"+e);
//        }finally{
//            DBClose.close(con, pstmt);
//        }//end
//        return cnt;
//	}//delete() end
//
//	
//	

	
	
	
	
	
}
