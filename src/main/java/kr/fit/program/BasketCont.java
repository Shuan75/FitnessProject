package kr.fit.program;


import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.fit.notice.NoticeDTO;
import kr.fit.login.*;




@Controller
public class BasketCont {
	BasketDAO dao = null;
	
	public BasketCont() {
		dao = new BasketDAO();
		System.out.println("----BasketCont() 객체 생성됨");
	}

		
	
	
	// myPage basket
	@RequestMapping(value = "basketList.do")
	public ModelAndView list(HttpSession sess, HttpServletRequest req) {

		String id = req.getParameter("id");

		System.out.println(id);
		sess.getAttribute("s_id");
		ModelAndView mav=new ModelAndView();
//		sess.getAttribute("s_id");
		mav.setViewName("basket/basketList");
		mav.addObject("list", dao.list(id));		
//		System.out.println(dao.list());
		return mav;
	}//list() end
	
	
	
	@RequestMapping(value = "add.do", method=RequestMethod.GET)
	public ModelAndView basket(HttpSession sess) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("basket/basket"); // 구매 담기 누를시
		sess.getAttribute("s_id");

		return mav;
	}//add() end
	
	
	@RequestMapping(value="basketAdd.do")
	public ModelAndView add(@ModelAttribute BasketDTO dto, HttpSession sess, HttpServletRequest req) {
		
		sess.getAttribute("s_id");
		int cnt = dao.add(dto);
	
		
		ModelAndView mav = new ModelAndView();

		if(cnt==0) {			
			mav.setViewName("login/loginForm");
		}else {
			mav.setViewName("redirect:/basketList.do");
		}//if end		

		return mav;		
	}//add() end
	

//	@RequestMapping(value="basketAdd.do")
//	public String add(@ModelAttribute BasketDTO dto, HttpSession sess, HttpServletRequest req) throws Exception{
//	
//		BasketDTO b_id=(BasketDTO)req.getSession().getAttribute("b_id");
//		
//		sess.getAttribute("s_id");
//		int cnt = dao.add(dto);
//	
//		
////		ModelAndView mav = new ModelAndView();
//
//		if(b_id == null) {
//			req.setAttribute("msg", "로그인이 필요합니다.");
//			req.setAttribute("url", "login/loginForm");
//			return "alert";
//			
////			mav.setViewName("login/loginForm");
//		}else {
//			req.setAttribute("msg", "상품이 장바구니에 추가되었습니다.");
//			req.setAttribute("url", "redirect:/basketList.do");
//			return "alert";
//
//			
////			mav.setViewName("redirect:/basketList.do");
//		}//if end		
//
////		return mav;		
//	}//add() end
//	
	

	
	@RequestMapping(value="basketDel.do", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest req, HttpSession session) {

		ModelAndView mav=new ModelAndView();
		int b_num = Integer.parseInt(req.getParameter("b_num"));
		
//		BasketDTO dto = dao.list(b_num);

		mav.setViewName("redirect:/basketList.do");
//		mav.addObject("dto", dto);
	
		return mav;
	}//delete() end

	
	
	

	
}//class end
