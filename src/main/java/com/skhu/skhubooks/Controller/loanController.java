package com.skhu.skhubooks.Controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skhu.skhubooks.Service.loanService;
import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.bookVO;

@Controller
public class loanController {
	@Autowired
	loanService service;
	
	@RequestMapping(value="/loan/memberCheck", method = RequestMethod.GET)
	public String memberCheck() {
		return "/loan/memberCheck";
	}
	
	@RequestMapping(value = "/loan/bookCheck", method = RequestMethod.GET)
	public String bookCheck(Model model, CustomUserDetails userDetails, Integer member_no) {
		if(member_no != 0) {
			CustomUserDetails list = service.selectByMemberNo(userDetails);
			list.setMember_no(list.getMember_no());
			model.addAttribute("list", list);
			model.addAttribute("lentBook",service.selectBook(member_no));
			model.addAttribute("id",list.getUsername());
			return "/loan/bookCheck";
		}
		else {
			return "/loan/noMember";
		}
		
	}
	
	@RequestMapping(value="/loan/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public Integer idcheck(Integer member_no) throws Exception {
		return service.memberCount(member_no);
	}
	
	@RequestMapping(value = "/loan/returnpage", method = RequestMethod.GET)
	public String returnpage() {
		return "/loan/returnpage";
	}
	
	@RequestMapping(value = "/loan/noMember", method = RequestMethod.GET)
	public String noMember() {
		return "/loan/noMember";
	}
	
	@RequestMapping(value = "/loan/bookLoanDo", method = RequestMethod.GET)
	public String bookLoanDo(bookVO vo) throws Exception {
		service.bookLoan(vo);
		return "redirect:/loan/bookCheck?member_no="+vo.getMember_no(); 
	}
	
	@RequestMapping(value = "/loan/bookReturnDo", method = RequestMethod.GET)
	public String bookReturnDo(String book_no) throws Exception{
		service.returnBook(book_no);
		return "redirect:/loan/returnpage";
	}
	
	@RequestMapping(value = "/loan/reserCheck", method = RequestMethod.POST)
	@ResponseBody
	public Integer reserCheck(String book_no) throws Exception{
		return service.reserCheck(book_no);
	}
	
	@RequestMapping(value="/loan/isReserve", method = RequestMethod.POST)
	@ResponseBody
	public Integer isReserve(String book_no, String member_id) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("book_no", book_no);
		map.put("member_id", member_id);
		return service.isReserve(map);
	}
	
}

