package kr.fit.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.classic.pattern.Util;
import net.utility.Paging;
import net.utility.Utility;



@Controller
public class NoticeCont {
	NoticeDAO dao=null;
	
	public NoticeCont() {
		dao = new NoticeDAO();
		System.out.println("----NoticeCont() 객체 생성됨");
	}
	
	
	
	@RequestMapping(value = "noticeList.do")
	public ModelAndView list(HttpServletRequest req) {		
		
		/////////////////////////////////////////////////////////////////////
        String word=req.getParameter("word");	//검색어
    	String col=req.getParameter("col");		//검색칼럼
    	//System.out.println("#"+word+"#");
    	//System.out.println("#"+col+"#");
    	
    	word=Utility.checkNull(word);	//문자열값이 null이면 빈문자열로 치환
    	col	=Utility.checkNull(col);			
		/////////////////////////////////////////////////////////////////////
    	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeList");	
		
		//int totalRowCount=dao.totalRowCount(); //검색하지 않았을 경우 글갯수
		int totalRowCount=dao.count2(col, word); //검색한 경우 글갯수
		//System.out.println("--------------"+totalRowCount);
		
        
        //페이징
        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
        int pagePerBlock = 10;   // 페이지 리스트
       
        String pageNum=req.getParameter("pageNum");
        if(pageNum==null){
              pageNum="1";
        }
       
        int currentPage=Integer.parseInt(pageNum);
        int startRow   =(currentPage-1)*numPerPage+1;
        int endRow     =currentPage*numPerPage;
       
        //페이지 수
        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);
         
        double d_page = (double)currentPage/pagePerBlock;
        int Pages     = (int)Math.ceil(d_page)-1;
        int startPage = Pages*pagePerBlock;
        int endPage   = startPage+pagePerBlock+1;
       
       
        List list=null;     
        if(totalRowCount>0){           
              list=dao.list2(startRow, endRow, col, word);          
        } else {           
              list=Collections.EMPTY_LIST;           
        }//if end
         
        int number=0;
        number=totalRowCount-(currentPage-1)*numPerPage;
         
        mav.addObject("number",    number);
        mav.addObject("pageNum",   currentPage);
        mav.addObject("startRow",  startRow);
        mav.addObject("endRow",    endRow);
        mav.addObject("count",     totalRowCount);
        mav.addObject("pageSize",  pagePerBlock);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage",   endPage);
        mav.addObject("list", list);
        return mav;		
		
	}//list() end
	
	


	
	@RequestMapping(value="create.do", method=RequestMethod.GET)
	public ModelAndView noticeForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeForm");
		return mav;
	}//noticeForm() end
	
	
	@RequestMapping(value="create.do", method=RequestMethod.POST)
	public ModelAndView createProc(@ModelAttribute NoticeDTO dto,HttpServletRequest req, HttpSession sess) {
		int cnt=dao.create(dto);
		sess.getAttribute("s_rating");

		ModelAndView mav=new ModelAndView();
	
		if(cnt==0) {
			mav.setViewName("notice/noticeForm");
		}else {
			mav.setViewName("redirect:/noticeList.do");
		}//if end
		
		return mav;
		
	}//creatProc() end
	
	
	
	
	@RequestMapping(value = "noticeRead.do")
	public ModelAndView read(int bbs_num) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = dao.read(bbs_num);
		
		mav.addObject("dto", dto);
		mav.setViewName("notice/noticeRead");		
		return mav;
	}//read() end
	
	
	
	@RequestMapping(value="noticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException {

		ModelAndView mav=new ModelAndView();
		int bbs_num = Integer.parseInt(req.getParameter("bbs_num"));
		
		NoticeDTO dto = dao.read(bbs_num);
		
		//System.out.println(dto);

		mav.setViewName("notice/noticeUpdate");
		mav.addObject("dto", dto);

		return mav;
	}//update() end
	
	
	
	@RequestMapping(value="noticeUpdate.do", method=RequestMethod.POST)
	public ModelAndView updateproc(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
		int cnt = dao.updateproc(dto);
		
		//System.out.println(dto);
		
		if(cnt==0) {
			System.out.println(cnt);
			mav.setViewName("notice/noticeUpdate");
		}else {
			System.out.println(cnt);
			//mav.setViewName("notice/noticeList");
			mav.setViewName("redirect:/noticeList.do");
		}//if end
		
		return mav;
	}//updateProc() end
	
	
	
	
	
	
	@RequestMapping(value="noticeDel.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest req, HttpSession session) {

		ModelAndView mav=new ModelAndView();
		int bbs_num = Integer.parseInt(req.getParameter("bbs_num"));
		
		NoticeDTO dto = dao.read(bbs_num);

		mav.setViewName("notice/noticeDel");
		mav.addObject("dto", dto);
	
		

		return mav;
	}//delete() end

	
	
	@RequestMapping(value="noticeDel.do", method=RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute NoticeDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
		int cnt = dao.delete(dto);
		
		if(cnt==0) {
			System.out.println(cnt);
			mav.setViewName("notice/noticeDel");
		}else {
			System.out.println(cnt);
			mav.setViewName("redirect:/noticeList.do");
		}//if end
		
		return mav;
	}//deleteproc() end
	
	
	
//------------------------------free------------------------------------------free
	@RequestMapping(value = "freeList.do")
	public ModelAndView freelist(HttpServletRequest req) {		
	
		/////////////////////////////////////////////////////////////////////
        String word=req.getParameter("word");	//검색어
    	String col=req.getParameter("col");		//검색칼럼
    	//System.out.println("#"+word+"#");
    	//System.out.println("#"+col+"#");
    	
    	word=Utility.checkNull(word);	//문자열값이 null이면 빈문자열로 치환
    	col	=Utility.checkNull(col);			
		/////////////////////////////////////////////////////////////////////
    	
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/freeList");	
		
		//int totalRowCount=dao.totalRowCount(); //검색하지 않았을 경우 글갯 
		int totalRowCount=dao.count2(col, word); //검색한 경우 글갯
		//System.out.println("--------------"+totalRowCount);
		
        
        //페이징
        int numPerPage   = 5;    // 한 페이지당 레코드 갯수
        int pagePerBlock = 10;   // 페이지 리스트
       
        String pageNum=req.getParameter("pageNum");
        if(pageNum==null){
              pageNum="1";
        }
       
        int currentPage=Integer.parseInt(pageNum);
        int startRow   =(currentPage-1)*numPerPage+1;
        int endRow     =currentPage*numPerPage;
       
        //페이지 수
        double totcnt = (double)totalRowCount/numPerPage;
        int totalPage = (int)Math.ceil(totcnt);
         
        double d_page = (double)currentPage/pagePerBlock;
        int Pages     = (int)Math.ceil(d_page)-1;
        int startPage = Pages*pagePerBlock;
        int endPage   = startPage+pagePerBlock+1;
       
       
        List list=null;     
        if(totalRowCount>0){           
              list=dao.list2(startRow, endRow, col, word);          
        } else {           
              list=Collections.EMPTY_LIST;           
        }//if end
         
        int number=0;
        number=totalRowCount-(currentPage-1)*numPerPage;
         
        mav.addObject("number",    number);
        mav.addObject("pageNum",   currentPage);
        mav.addObject("startRow",  startRow);
        mav.addObject("endRow",    endRow);
        mav.addObject("count",     totalRowCount);
        mav.addObject("pageSize",  pagePerBlock);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage",   endPage);
        mav.addObject("list", list);
        return mav;
		
	}//list() end

	
//	@RequestMapping(value="replyCreate.do", method=RequestMethod.GET)
//	public ModelAndView reply(HttpSession sess) {
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("notice/bbsReply");
//		sess.getAttribute("s_id");
//		sess.getAttribute("s_rating");
//		return mav;
//	}//reply() end

	
	@RequestMapping(value="replyCreate.do", method=RequestMethod.GET)
	public ModelAndView reply() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/bbsReply");
		return mav;
	}//reply() end
	
	
	
	
	@RequestMapping(value="replyCreate.do", method=RequestMethod.POST)
	public ModelAndView replyProc(@ModelAttribute NoticeDTO dto,HttpServletRequest req) {
							
		ModelAndView mav=new ModelAndView();
			
		int cnt=dao.reply(dto);
//		System.out.println(dto);
		
		if(cnt==0) {
			mav.setViewName("notice/bbsReply");
		}else {	
			mav.setViewName("redirect:/noticeList.do");
		}//if end
		
		return mav;
		
	}//replyProc() end
	
	

//    
//	@RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
//	public ModelAndView board(HttpServletRequest req) {
//		int bbs_diff = Integer.parseInt(req.getParameter("bbs_diff"));
//        
//		ModelAndView mav = new ModelAndView("board");
//		
//		//NoticeDTO dto = dao.read(bbs_diff);
//		
//		
//		mav.addObject("list", noticeList);
//		mav.addObject("bbs_diff", bbs_diff);
//		return mav;
//	}
//
//	

	
	
	
	
	
	
	
}//class end
