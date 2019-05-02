package com.skhu.skhubooks.Controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skhu.skhubooks.Service.memberService;
import com.skhu.skhubooks.VO.memberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	memberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "home";
	}
	
	@RequestMapping(value="signIn", method = RequestMethod.GET)
	public String signIn(Model model) {
		return "/member/signIn";
	}
	
	@RequestMapping(value="signInDo", method= RequestMethod.GET)
	public String signInDo(Model model, memberVO VO) throws Exception {
		System.out.println(VO);
		service.memberSignIn(VO);
		return "redirect:/";
	}
}
