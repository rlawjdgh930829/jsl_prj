package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.PersonDao;
import dao.ProductDao;
import model.Person;
import model.Product;

@Controller
public class MainController {
	
	@Autowired
	private PersonDao dao;
	@Autowired
	private ProductDao list_dao;
	
	@RequestMapping(value = "/main/main.html")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("body/main");
		return mav;
	}
	
	@RequestMapping(value = "/main/signup.html", method = RequestMethod.GET)
	public ModelAndView signup_page() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Person());
		mav.addObject("BODY", "body/signup.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/main/signup.html", method = RequestMethod.POST)
	public ModelAndView signup(@Valid Person person, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("index");
		if(bindingResult.hasErrors()) {
			mav.addObject("BODY", "body/signup.jsp");
			return mav;
		} else {
			int max = 0;
			if(dao.getPersonMaxNo() != null) {
				max = dao.getPersonMaxNo() + 1;
			}
			person.setPerson_no(max);
			dao.insertPerson(person);
			return new ModelAndView("redirect:../index.jsp");
		}
	}
	
	@RequestMapping(value = "/main/signin.html", method = RequestMethod.GET)
	public ModelAndView signin_page() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Person());
		mav.addObject("BODY", "body/signin.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/main/signin.html", method = RequestMethod.POST)
	public ModelAndView signin(@Valid Person person, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		if(bindingResult.hasErrors()) {
			mav.addObject("BODY", "body/signin.jsp");
			return mav;
		}
		Person login = dao.selectPerson(person);
		if(login == null) {
			mav.addObject("BODY", "body/signin.jsp");
			mav.addObject("MESSAGE", "false");
			return mav;
		} else {
			session.setAttribute("USER", login);
			return new ModelAndView("redirect:../index.jsp");
		}
	}
	
	@RequestMapping(value = "/main/logout.html")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:../index.jsp");
	}
	
	@RequestMapping(value = "/main/list.html", method = RequestMethod.GET)
	public ModelAndView list_page(HttpSession session, HttpServletRequest request, Integer pageNo) {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("BODY", "body/list.jsp");
		if(pageNo == null || pageNo < 1 ) {
			pageNo = 1;
		}
		String search = request.getParameter("search");
		if(search == null) {
			search = "";
		}
		int pageCnt = (list_dao.listCnt(search) + 5) / 6;
		if(pageNo > pageCnt) {
			pageNo = pageCnt;
		}
		List<Product> list = list_dao.listProduct(pageNo, search);
		int range = (pageNo + 4) / 5;
		int start = (range - 1) * 5 + 1;
		int end = range * 5;
		if(end > pageCnt) {
			end = pageCnt;
		}
		mav.addObject("PAGE_CNT", pageCnt);
		mav.addObject("pageNo", pageNo);
		mav.addObject("range", range);
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("LIST", list);
		return mav;
	}
	
}
