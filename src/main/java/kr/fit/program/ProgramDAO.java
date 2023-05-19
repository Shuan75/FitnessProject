package kr.fit.program;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.fit.notice.NoticeDTO;
import kr.fit.program.ProgramDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class ProgramDAO {
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public ProgramDAO() {
		dbopen=new DBOpen();
	}//end
	
	public ArrayList<ProgramDTO> list(){
		ArrayList<ProgramDTO> list=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT c_code, c_name, c_price, c_level, c_period, c_day, c_time,c_id,u_name,c_total,c_content,c_amount " );
			sql.append(" FROM ft_class ");
			sql.append(" ORDER BY c_code DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				list=new ArrayList<ProgramDTO>();
				do {
					ProgramDTO dto=new ProgramDTO();
					
					dto.setC_code(rs.getString("c_code"));
					dto.setC_name(rs.getString("c_name"));
					dto.setC_price(rs.getString("c_price"));
					dto.setC_level(rs.getString("c_level"));
					dto.setC_period(rs.getString("c_period"));
					dto.setC_day(rs.getString("c_day"));
					dto.setC_time(rs.getString("c_time"));
					dto.setC_id(rs.getString("c_id"));
					dto.setU_name(rs.getString("u_name"));
					dto.setC_total(rs.getInt("c_total"));
					dto.setC_content(rs.getString("c_content"));
					dto.setC_amount(rs.getInt("c_amount"));
					list.add(dto);
				}while(rs.next());
			}//if end
			
		}catch(Exception e) {
			System.out.println("프로그램 목록 실패:" + e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}//end
		return list;
	}//list() end
	
	
	
	public ProgramDTO read(String c_code) {
		ProgramDTO dto=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT c_code,c_name, c_content, c_level, c_period, c_day, c_time, c_total, u_name, c_price, c_amount");
			sql.append(" FROM ft_class ");
			sql.append(" WHERE c_code=? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, c_code);

			rs=pstmt.executeQuery(); //->select문 실행할 때
		
			if(rs.next()) { //행이 존재하나요?
				dto=new ProgramDTO();
				
				dto.setC_code(rs.getString("c_code"));
				dto.setC_name(rs.getString("c_name"));
				dto.setC_content(rs.getString("c_content"));
				dto.setC_level(rs.getString("c_level"));
				dto.setC_period(rs.getString("c_period"));
				dto.setC_day(rs.getString("c_day"));
				dto.setC_time(rs.getString("c_time"));
				dto.setC_total(rs.getInt("c_total"));
				dto.setU_name(rs.getString("u_name"));
				dto.setC_price(rs.getString("c_price"));
				dto.setC_amount(rs.getInt("c_amount"));
				
			}//if end
			
		}catch(Exception e) {
			System.out.println("강의 상세보기 실패:" + e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return dto;
	}//read() end
	
	
	
	public int create(ProgramDTO dto) {
        int cnt=0; //성공 또는 실패 여부 반환

        
        try {
            con=dbopen.getConnection(); //DB연결
            sql=new StringBuilder();
			sql.append(" INSERT INTO ft_class( c_code, c_name, c_content, u_name, c_level, c_day, c_time, c_period, c_price, c_id, c_total, c_amount )");
			sql.append(" VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
			
            pstmt=con.prepareStatement(sql.toString());
           
            pstmt.setString(1, dto.getC_code());
            pstmt.setString(2, dto.getC_name());
            pstmt.setString(3, dto.getC_content());
            pstmt.setString(4, dto.getU_name());
            pstmt.setString(5, dto.getC_level());
            pstmt.setString(6, dto.getC_day());
            pstmt.setString(7, dto.getC_time());  
            pstmt.setString(8, dto.getC_period());
            pstmt.setString(9, dto.getC_price());
            pstmt.setString(10, dto.getC_id());
            pstmt.setInt(11, dto.getC_total());
            pstmt.setInt(12, dto.getC_amount());
                       
            cnt=pstmt.executeUpdate();
       
            System.out.println("강의 등록 성공");
        }catch (Exception e) {
            System.out.println("강의 추가 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
	
	
    public int update(ProgramDTO dto){
    	int cnt=0;
    	
    	
        try {          
        	con=dbopen.getConnection();//DB 연결
            
            sql=new StringBuilder();
            sql.append(" UPDATE ft_class ");
            sql.append(" SET c_name=?, c_content=?, u_name=?, c_level=?, c_day=?, c_time=?, c_period=?, c_price=?, c_total=? ");
            sql.append(" WHERE c_code=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getC_name());
            pstmt.setString(2, dto.getC_content());
            pstmt.setString(3, dto.getU_name());
            pstmt.setString(4, dto.getC_level());
            pstmt.setString(5, dto.getC_day());
            pstmt.setString(6, dto.getC_time());
            pstmt.setString(7, dto.getC_period());
            pstmt.setString(8, dto.getC_price());
            pstmt.setInt(9, dto.getC_total());
            pstmt.setString(10, dto.getC_code());        
            
            cnt = pstmt.executeUpdate();
            System.out.println(cnt);
        }catch (Exception e) {
            System.out.println("수정 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//update() end
    
	
    
	public int delete(ProgramDTO dto) {
		int cnt=0;
        try {
        	con=dbopen.getConnection();
			sql=new StringBuilder();
            sql.append(" DELETE FROM ft_class ");
            sql.append(" WHERE c_code=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getC_code());
            cnt = pstmt.executeUpdate();
          
        }catch (Exception e) {
            System.out.println("강의 삭제 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
	}//delete() end
	
	
	

	
}//class end

