package com.skhu.skhubooks.Controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skhu.skhubooks.Service.CustomUserDetailService;
import com.skhu.skhubooks.Service.bookService;
import com.skhu.skhubooks.VO.CustomUserDetails;

/**
 * Handles requests for the application home page.
 */
@Controller
public class memberController {
	@Autowired
	CustomUserDetailService service;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	bookService bservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("newBook",bservice.newBook());
		model.addAttribute("list", service.selectNotice());
		return "home";
	}
	
	@RequestMapping(value="/member/signIn", method = RequestMethod.GET)
	public String signIn(Model model) {
		return "/member/signIn";
	}
	
	@RequestMapping(value="/member/signInDo", method = RequestMethod.GET)
	public String signInDo(Model model, CustomUserDetails userDetail,
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw
			) throws Exception {
		userDetail.setUsername(member_id);
		String pass = passEncoder.encode(member_pw);
		userDetail.setPassword(pass);
		service.memberSignIn(userDetail);
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/logIn", method = RequestMethod.GET)
	public String logIn(Model model) {
		return "/member/logIn";
	}
	
	@RequestMapping(value="/member/logInDo", method = RequestMethod.GET)
	public String logInDo(Model model) {
		return "redirect:/";
	}
	
	@RequestMapping(value="/access_denied_page")
	public String accessDeniedPage() throws Exception{
		return "/member/access_denied_page";
	}
	
	@RequestMapping(value="/member/checkMemberID", method = RequestMethod.POST)
	@ResponseBody
	public int checkUserID(CustomUserDetails userDetail, String member_id) throws Exception{
		return service.selectUserID(member_id);
	}
	
	@RequestMapping(value="/member/checkPnum", method = RequestMethod.POST)
	@ResponseBody
	public int checkPnum(CustomUserDetails userDetail, int member_pnum) throws Exception{
		return service.checkPnum(member_pnum);
	}
	
	@RequestMapping(value="/member/checkMemberNo", method = RequestMethod.POST)
	@ResponseBody
	public int checkMemberNo(CustomUserDetails userDetails, int member_no) throws Exception{
		return service.checkNo(member_no);
	}
	
	@RequestMapping(value="/member/myInfo", method = RequestMethod.GET)
	public String myInfo(Model model, CustomUserDetails userDetails, String member_id) throws Exception {
		if(member_id != null) {
			userDetails = service.selectByMemberId(member_id);
			model.addAttribute("member", userDetails);
			model.addAttribute("id", member_id);
			model.addAttribute("lentBook", service.selectBook(userDetails.getMember_no()));
			return "/member/myInfo";
		}
		else {
			return "/loan/noMember";
		}
		
	}
}
