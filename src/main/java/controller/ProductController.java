package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductDao;
import model.Person;
import model.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDao dao;
	
	@RequestMapping(value = "/product/writing.html", method = RequestMethod.GET)
	public ModelAndView writing_page() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Product());
		mav.addObject("BODY", "body/writing.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/product/writing.html", method = RequestMethod.POST)
	public ModelAndView writing(@Valid Product product, BindingResult bindingResult, HttpSession session) throws Exception {
		if(bindingResult.hasErrors()) {
			ModelAndView mav = new ModelAndView("index");
			mav.addObject("BODY", "body/writing.jsp");
			return mav;
		}
		MultipartFile file = product.getImagename();
		if(file != null) {
			ServletContext ctx = session.getServletContext();
			String path = ctx.getRealPath("/upload/");
			String saveName = file.getOriginalFilename();
			saveName = uploadFile(saveName, file.getBytes(), path);
			product.setProduct_img(saveName);
		}
		int max = 0;
		if(dao.getProductMaxNo() != null) {
			max = dao.getProductMaxNo() + 1;
		}
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Calendar time = Calendar.getInstance();
		String format_time = format.format(time.getTime());
		product.setProduct_no(max);
		product.setProduct_date(format_time);
		Person person = (Person)session.getAttribute("USER");
		product.setPerson_no(person.getPerson_no());	
		dao.insertProduct(product);
		return new ModelAndView("redirect:../main/list.html");
	}
	
	private String uploadFile(String originalName, byte[] fileDate, String path) throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+ "_" + originalName;
		File target = new File(path , savedName);
		FileCopyUtils.copy(fileDate, target);
		return savedName;
	}
	
	@RequestMapping(value = "/product/detail.html")
	public ModelAndView detail(HttpServletRequest request) {
		Integer no = Integer.parseInt((String)request.getParameter("no"));
		Product product = dao.detail(no);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("DETAIL", product);
		mav.addObject("BODY", "body/detail.jsp");
		return mav;
	}
	
	@RequestMapping(value ="/product/delete.html")
	public ModelAndView delete(Integer no) {
		dao.delete(no);
		return new ModelAndView("redirect:../main/list.html");
	}
	@RequestMapping(value ="/product/modify.html", method = RequestMethod.GET)
	public ModelAndView modify_page(Integer no) {
		Product product = dao.detail(no);
		ModelAndView mav = new ModelAndView("index");
		mav.addObject(new Product());
		mav.addObject("ITEM", product);
		mav.addObject("BODY", "body/modify.jsp");
		return mav;
	}
	
	@RequestMapping(value ="/product/modify.html", method = RequestMethod.POST)
	public ModelAndView modify(Product product, HttpSession session, BindingResult bindingResult) throws Exception {
		MultipartFile file = product.getImagename();
		if(file != null) {
			ServletContext ctx = session.getServletContext();
			String path = ctx.getRealPath("/upload/");
			String saveName = file.getOriginalFilename();
			saveName = uploadFile(saveName, file.getBytes(), path);
			product.setProduct_img(saveName);
		}
		dao.modify(product);
		return new ModelAndView("redirect:../product/detail.html?no=" + product.getProduct_no());
	}
}
