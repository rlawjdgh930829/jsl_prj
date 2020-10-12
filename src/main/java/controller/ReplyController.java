package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ReplyDao;
import model.Person;
import model.Reply;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyDao dao;
	
	@RequestMapping(value="/reply/addComment.html")
	@ResponseBody
	public String ajax_addComment(@ModelAttribute Reply reply, HttpServletRequest request, HttpSession session) throws Exception {
		int max = 0;
		int maxOrder = 0;
		if(dao.getReplyMax() != null) {
			max = dao.getReplyMax() + 1;
		}
		if(dao.getReplyMaxOrder() != null) {
			maxOrder = dao.getReplyMaxOrder() + 1;
		}
		Person person = (Person)session.getAttribute("USER");
		reply.setReply_no(max);
		reply.setReply_group(max);
		reply.setReply_order(maxOrder);
		reply.setReply_depth(0);
		reply.setPerson_no(person.getPerson_no());
		dao.insertReply(reply);
		return "success";
	}
	
	@RequestMapping(value="/reply/subComment.html")
	@ResponseBody
	public String ajax_subComment(@ModelAttribute Reply reply, HttpServletRequest request, HttpSession session) throws Exception {
		int no = reply.getReply_no();
		int order = dao.getOrder(no);
		dao.setOrder(order);
		int depth =  dao.getDepth(no);
		Person person = (Person)session.getAttribute("USER");
		reply.setReply_no(dao.getReplyMax() + 1);
		reply.setReply_group(no);
		reply.setReply_order(order+1);
		reply.setReply_depth(depth+1);
		reply.setPerson_no(person.getPerson_no());
		dao.insertReply(reply);
		return "success";
	}
	
	@RequestMapping(value="/reply/deleteComment.html")
	@ResponseBody
	public String ajax_deleteComment(Integer no) {
		dao.deleteReply(no);
		return "success";
	}
	
	@RequestMapping(value = "/reply/commentList.html")
	@ResponseBody
	public ResponseEntity ajax_commentList(@ModelAttribute Reply reply, HttpServletRequest request, HttpSession session) throws Exception {
		int no = reply.getProduct_no();
		Person person = (Person)session.getAttribute("USER");
		HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        List<Reply> list = dao.allReply(no);
        if(list.size() > 0) {
        	for (int i = 0; i < list.size(); i++) {
        		HashMap hm = new HashMap();
        		hm.put("reply_no", list.get(i).getReply_no());
        		hm.put("reply_content", list.get(i).getReply_content());
        		hm.put("reply_group", list.get(i).getReply_group());
        		hm.put("reply_order", list.get(i).getReply_order());
        		hm.put("reply_depth", list.get(i).getReply_depth());
        		hm.put("person_no", list.get(i).getPerson_no());
        		hm.put("product_no", list.get(i).getProduct_no());
        		hm.put("person_name", list.get(i).getPerson_name());
        		if(person != null) {
        			hm.put("USER_NO", person.getPerson_no());
        		}
        		hmlist.add(hm);
			}
        }
        JSONArray json = new JSONArray(hmlist); 
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
}
