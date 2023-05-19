package kr.fit.program;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.fit.notice.NoticeDTO;



@Controller
public class ProgramCont {
	
	ProgramDAO dao = null;
	
	public ProgramCont() {
		dao = new ProgramDAO();
		System.out.println("----ProgramCont() 객체 생성됨");
	}

	
	
	@RequestMapping(value = "program.do")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("program/program");
		mav.addObject("list", dao.list());		
		return mav;
	}//list() end

	
	
	
	@RequestMapping(value="programRead.do")
	public ModelAndView read(String c_code, HttpSession sess) {
		ModelAndView mav = new ModelAndView();
		ProgramDTO dto = dao.read(c_code);
		
//		sess.getAttribute("s_id");
		mav.addObject("dto", dto);
		mav.setViewName("program/programRead");
		return mav;
	}//read() end
	
	
	@RequestMapping(value="programCreate.do", method=RequestMethod.GET)
	public ModelAndView ProgramForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("program/programForm");
		return mav;
	}//create() end
	
	
	@RequestMapping(value="programCreate.do", method=RequestMethod.POST)
	public ModelAndView create(@ModelAttribute ProgramDTO dto,HttpServletRequest req,HttpSession sess) {
							
		int cnt=dao.create(dto);
//		sess.getAttribute("s_rating");

		ModelAndView mav=new ModelAndView();
	
		if(cnt==0) {
			mav.setViewName("program/programForm");
		}else {
			mav.setViewName("redirect:/program.do");
		}//if end	
		return mav;		
	}//create() end

	
	@RequestMapping(value="programUpd.do", method=RequestMethod.GET)
	public ModelAndView update(HttpServletRequest req, HttpSession session) {

		ModelAndView mav=new ModelAndView();
		String c_code = req.getParameter("c_code");
		
		ProgramDTO dto = dao.read(c_code);
		
		//System.out.println(dto);

		mav.setViewName("program/programUpd");
		mav.addObject("dto", dto);

		
		
		return mav;
	}//update() end
	
	
	@RequestMapping(value="programUpd.do", method=RequestMethod.POST)
	public ModelAndView update(@ModelAttribute ProgramDTO dto, HttpSession sess, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
		int cnt = dao.update(dto);
//		sess.getAttribute("s_id");
		System.out.println(cnt);
		System.out.println("------------------------------");
		
		System.out.println(dto);
		
		if(cnt==0) {
			System.out.println(cnt);
			mav.setViewName("program/programUpd");
		}else {
			System.out.println(cnt);
			mav.setViewName("redirect:/program.do");
			
		}//if end
		
		return mav;
	}//updateProc() end
	
	
	
	@RequestMapping(value="programDel.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest req, HttpSession session) {

		ModelAndView mav=new ModelAndView();
		
		String c_code = req.getParameter("c_code");
		
		ProgramDTO dto = dao.read(c_code);

		mav.setViewName("program/programDel");
		mav.addObject("dto", dto);
	
		return mav;
	}//delete() end

	
	
	@RequestMapping(value="programDel.do", method=RequestMethod.POST)
	public ModelAndView delete(@ModelAttribute ProgramDTO dto, HttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
		int cnt = dao.delete(dto);
		
		//System.out.println(dto);
		
		if(cnt==0) {
			System.out.println(cnt);
			mav.setViewName("program/programDel");
		}else {
			System.out.println(cnt);
			mav.setViewName("redirect:/program.do");
		}//if end
		
		return mav;
	}//deleteproc() end
	
	

}//class end
