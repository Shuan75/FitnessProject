package kr.fit.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;


public class NoticeDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	public NoticeDAO() {
		dbopen=new DBOpen();
	}//end
	
	
	

	public ArrayList<NoticeDTO> list(){
		ArrayList<NoticeDTO> list=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT bbs_num, bbs_title, bbs_cdate, bbs_id " );
			sql.append(" FROM ft_bbs ");
			sql.append(" ORDER BY bbs_grpno DESC, bbs_ansnum ASC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();

			if(rs.next()) {
				list=new ArrayList<NoticeDTO>();
				do {
					NoticeDTO dto=new NoticeDTO();					
					dto.setBbs_num(rs.getInt("bbs_num"));
					dto.setBbs_title(rs.getString("bbs_title"));
					dto.setBbs_cdate(rs.getString("bbs_cdate"));
					dto.setBbs_id(rs.getString("bbs_id"));
					list.add(dto);
				}while(rs.next());
			}//if end
			
		}catch(Exception e) {
			System.out.println("공지사항 목록 실패:" + e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}//end
		return list;
	}//list() end
	

	
    public int create(NoticeDTO dto) {
        int cnt=0; //성공 또는 실패 여부 반환      
        try {
            con=dbopen.getConnection(); //DB연결
            sql=new StringBuilder();
            sql.append(" INSERT INTO ft_bbs(bbs_num, bbs_diff, bbs_title, bbs_contents, bbs_id, bbs_rating, bbs_grpno)");
            sql.append(" VALUES(ftbbs_seq.nextval, ?, ?, ?, ?, 'A', (select NVL(max(bbs_num), 0)+1 from ft_bbs)) ");

            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getBbs_diff());
            pstmt.setString(2, dto.getBbs_title());
            pstmt.setString(3, dto.getBbs_contents());
            pstmt.setString(4, dto.getBbs_id());
//            pstmt.setString(5, dto.getBbs_rating());
            
            
             
            cnt=pstmt.executeUpdate();
       
            System.out.println("공지사항 등록 성공");
        }catch (Exception e) {
            System.out.println("공지사항 추가 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
    
    
    
    public NoticeDTO read(int bbs_num){
    	NoticeDTO dto=null;	
        try {
            con=dbopen.getConnection();//DB 연결
            
            sql=new StringBuilder();
            sql.append(" SELECT bbs_num, bbs_id, bbs_title, bbs_contents, bbs_grpno, bbs_indent, bbs_ansnum, bbs_cdate ");
            sql.append(" FROM ft_bbs ");
            sql.append(" WHERE bbs_num=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt (1,bbs_num);
            
            rs=pstmt.executeQuery();
            if(rs.next()) {
            		dto=new NoticeDTO();
            		dto.setBbs_num(rs.getInt("bbs_num"));
            		dto.setBbs_id(rs.getString("bbs_id"));
            		dto.setBbs_title(rs.getString("bbs_title"));
            		dto.setBbs_contents(rs.getString("bbs_contents"));
            		dto.setBbs_grpno(rs.getInt("bbs_grpno"));
            		dto.setBbs_indent(rs.getInt("bbs_indent"));
              		dto.setBbs_ansnum(rs.getInt("bbs_ansnum"));
              		dto.setBbs_cdate(rs.getString("bbs_cdate"));
            }//end

        }catch (Exception e) {
            System.out.println("상세보기실패:"+e);
        }finally{
            DBClose.close(con, pstmt, rs);
        }//end
        return dto;
    }//read() end 
    

        
    public int updateproc(NoticeDTO dto){
    	int cnt=0;
    	
    	System.out.println(cnt);
        try {          
        	con=dbopen.getConnection();//DB 연결
            
            sql=new StringBuilder();
            sql.append(" UPDATE ft_bbs ");
            sql.append(" SET bbs_id=?, bbs_title=?, bbs_contents=? ");
            sql.append(" WHERE bbs_num=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getBbs_id());
            pstmt.setString(2, dto.getBbs_title());
            pstmt.setString(3, dto.getBbs_contents());
            pstmt.setInt(4, dto.getBbs_num());
            
            cnt = pstmt.executeUpdate();

        }catch (Exception e) {
            System.out.println("수정 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//updateproc() end
    
    
	public int delete(NoticeDTO dto) {
		int cnt=0;
        try {
        	con=dbopen.getConnection();
			sql=new StringBuilder();
            sql.append(" DELETE FROM ft_bbs ");
            sql.append(" WHERE bbs_num=? ");
            
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getBbs_num());
            cnt = pstmt.executeUpdate();
          
        }catch (Exception e) {
            System.out.println("삭제 실패:"+e);
        }finally{
            DBClose.close(con, pstmt);
        }//end
        return cnt;
	}//delete() end
	


	
	
	 public ArrayList<NoticeDTO> list2(int start, int end, String col, String word){
		 
		    //System.out.println("@"+word+"@");
	        //System.out.println("@"+col+"@");
		    word = word.trim(); //검색어의 좌우 공백 제거
		 
		 
	        ArrayList<NoticeDTO> list=null;
	        
	        try {
	            con=dbopen.getConnection();
	            sql=new StringBuilder();
	           
	            word = word.trim(); //검색어의 좌우 공백 제거
	            
	            if(word.length()==0) { //검색을 하지 않는 경우
		            sql.append(" SELECT AA.* ");
		            sql.append(" FROM ( ");
		            sql.append("        SELECT ROWNUM as RNUM, BB.* ");
		            sql.append("        FROM ( ");
		            sql.append("               SELECT bbs_num, bbs_title, bbs_cdate, bbs_id ");
		            sql.append("               FROM ft_bbs ");
		            sql.append("               ORDER BY bbs_num DESC");
//		            sql.append("               ORDER BY bbs_grpno DESC, bbs_ansnum ASC ");
		            sql.append("             )BB ");
		            sql.append("      ) AA ");
		            sql.append(" WHERE AA.RNUM >=? AND AA.RNUM<=? ");  
		            
	            } else {
		            sql.append(" SELECT AA.* ");
		            sql.append(" FROM ( ");
		            sql.append("        SELECT ROWNUM as RNUM, BB.* ");
		            sql.append("        FROM ( ");
		            sql.append("               SELECT bbs_num, bbs_title, bbs_cdate ");
		            sql.append("               FROM ft_bbs ");
		            
		            
		            String search="";
		            if(col.equals("bbs_title")) {
		                  search += " WHERE bbs_title LIKE '%" + word + "%' ";
		            }else if(col.equals("bbs_contents")) {
		                  search += " WHERE bbs_contents LIKE '%" + word + "%' ";
		            }else if(col.equals("bbs_title_bbs_contents")) {
		                  search += " WHERE bbs_title LIKE '%" + word + "%' ";
		                  search += " OR bbs_contents LIKE '%" + word + "%' ";
		            }else if(col.equals("bbs_id")) {
		                  search += " WHERE bbs_id LIKE '%" + word + "%' ";
		            }//if end
		           
		            sql.append(search);

		            sql.append("               ORDER BY bbs_num DESC ");
		            // bbs_grpno DESC, bbs_ansnum ASC
		            sql.append("             )BB ");
		            sql.append("      ) AA ");
		            sql.append(" WHERE AA.RNUM >=? AND AA.RNUM<=? ");  	     	
	            		            	
	            }//if end
	            
	           
	            pstmt=con.prepareStatement(sql.toString());
	            pstmt.setInt(1, start);
	            pstmt.setInt(2, end);
	           
	            rs=pstmt.executeQuery();
	            if(rs.next()) {
	                list=new ArrayList<NoticeDTO>();
	                do{
	                    NoticeDTO dto=new NoticeDTO();	                    
	                    dto.setBbs_num(rs.getInt("bbs_num"));
	                    dto.setBbs_title(rs.getString("bbs_title"));
	                    dto.setBbs_cdate(rs.getString("bbs_cdate"));
	                    list.add(dto);
	                }while(rs.next());
	            }//if end
	            
	   
	        }catch(Exception e) {
	            System.out.println("페이징목록실패: "+e);
	        }finally{
	            DBClose.close(con, pstmt, rs);
	        }//end   
	        return list;
	    }//list2() end
	
	
 
    public int totalRowCount() {
        int cnt=0;
        try {
            con=dbopen.getConnection();
            sql=new StringBuilder();
            sql.append(" SELECT COUNT(*) FROM ft_bbs ");
            pstmt=con.prepareStatement(sql.toString());
            rs=pstmt.executeQuery();
            if(rs.next()){
                cnt=rs.getInt(1);            
            }//if end          
        }catch(Exception e){
            System.out.println("전체 행 갯수:" + e);
        }finally{
            DBClose.close(con, pstmt);
        }
        return cnt;
    }//totalRowCount() end
    
    
    

	// 검색 조건에 해당하는 칼럼값, 키워드
	public int count2(String col, String word) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();// DB 연결

			sql = new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM ft_bbs ");

			if (word.length() >= 1) {// 검색어가 존재한다면
				String search = "";
				if (col.equals("bbs_title_bbs_contents")) {
					search += " WHERE bbs_title LIKE '%" + word + "%' ";
					search += " OR bbs_contents LIKE '%" + word + "%' ";
				} else if (col.equals("bbs_title")) {
					search += " WHERE bbs_title LIKE '%" + word + "%' ";
				} else if (col.equals("bbs_contents")) {
					search += " WHERE bbs_title LIKE '%" + word + "%' ";
				} else if (col.equals("bbs_id")) {
					search += " WHERE bbs_title LIKE '%" + word + "%' ";
				} // if end
				sql.append(search);
			} // if end

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
		} catch (Exception e) {
			System.out.println("글갯수실패:" + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	}// count() end    


//-------------free
	public ArrayList<NoticeDTO> freelist(){
		ArrayList<NoticeDTO> list=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT bbs_num, bbs_title, bbs_cdate, bbs_id " );
			sql.append(" FROM ft_bbs ");
			sql.append(" ORDER BY bbs_num DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			
		
			if(rs.next()) {
				list=new ArrayList<NoticeDTO>();
				do {
					NoticeDTO dto=new NoticeDTO();
					
					dto.setBbs_num(rs.getInt("bbs_num"));
					dto.setBbs_title(rs.getString("bbs_title"));
					dto.setBbs_cdate(rs.getString("bbs_cdate"));
					dto.setBbs_id(rs.getString("bbs_id"));

					list.add(dto);
				}while(rs.next());
			}//if end
			
		}catch(Exception e) {
			System.out.println("자유게시판 목록 실패:" + e);
		}finally {
			DBClose.close(con,pstmt,rs);
		}//end
		return list;
	}//list() end
	
	
	
	
    public int reply(NoticeDTO dto) {
    	int cnt=0;
    	try {
            con=dbopen.getConnection();//DB 연결
            sql=new StringBuilder();
            
            //1)부모글 정보 가져오기(select문)
            int bbs_grpno=0;
            int bbs_indent=0;
            int bbs_ansnum=0;
            sql.append(" SELECT bbs_grpno, bbs_indent, bbs_ansnum ");
            sql.append(" FROM ft_bbs ");
            sql.append(" WHERE bbs_num=? ");
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, dto.getBbs_num());
            rs=pstmt.executeQuery();
            if(rs.next()) {
            	//그룹번호 : 부모글그룹번호 그대로 가져오기
            	bbs_grpno = rs.getInt("bbs_grpno");
            	//들여쓰기 : 부모글들여쓰기 +1
            	bbs_indent = rs.getInt("bbs_indent")+1;
            	//글순서	 : 부모글순서 +1
            	bbs_ansnum = rs.getInt("bbs_ansnum")+1;
            }//if end
            
            
            //2)글순서 재조정하기(update문)
            sql.delete(0, sql.length());	//1)단계에서 사용했던 sql값 지우기
            sql.append(" UPDATE ft_bbs ");
            sql.append(" SET bbs_ansnum=bbs_ansnum+ 1 ");
            sql.append(" WHERE bbs_grpno=? AND bbs_ansnum>=? ");
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setInt(1, bbs_grpno);
            pstmt.setInt(2, bbs_ansnum);
            pstmt.executeUpdate();
           
            //3)답변글 추가하기(insert문)
            sql.delete(0, sql.length());	//2)단계에서 사용했던 sql값 지우기
            sql.append(" INSERT INTO ft_bbs(bbs_num, bbs_id, bbs_title, bbs_diff, bbs_contents, bbs_grpno, bbs_indent, bbs_ansnum, bbs_rating) ");
            sql.append(" VALUES(ftbbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ");
            pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getBbs_id());//자식글 insert
            pstmt.setString(2, dto.getBbs_title());
            pstmt.setString(3, dto.getBbs_diff());
            pstmt.setString(4, dto.getBbs_contents());
            pstmt.setInt(5, bbs_grpno);		//1)단계에서 만든 그룹번호 dto
			pstmt.setInt(6, bbs_indent);	//1)단계에서 만든 들여쓰기
            pstmt.setInt(7, bbs_ansnum);	//1)단계에서 만들 글순서
            pstmt.setString(8, dto.getBbs_rating());
            
            cnt=pstmt.executeUpdate();
           
           
            
        }catch (Exception e) {
            System.out.println("답변쓰기 실패:"+e);
        }finally{
            DBClose.close(con, pstmt, rs);
        }//end
        return cnt;
    }//reply() end
    
  

	



	
	
	
	
}//class end

