package com.skhu.skhubooks.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skhu.skhubooks.Service.loanService;
import com.skhu.skhubooks.VO.CustomUserDetails;

@Controller
public class loanController {
	@Autowired
	loanService service;
	
	@RequestMapping(value="/loan/memberCheck", method = RequestMethod.GET)
	public String memberCheck() {
		return "/loan/memberCheck";
	}
	
	@RequestMapping(value = "/loan/bookCheck", method = RequestMethod.GET)
	public String bookCheck(Model model, CustomUserDetails userDetails, String member_no) {
		if(member_no != null) {
			CustomUserDetails list = service.selectByMemberNo(userDetails);
			list.setMember_no(list.getMember_no());
			model.addAttribute("list", list);
			model.addAttribute("id",list.getUsername());
		}
		return "/loan/bookCheck";
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
}

