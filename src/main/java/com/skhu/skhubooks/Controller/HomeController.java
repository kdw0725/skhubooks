package com.skhu.skhubooks.Controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skhu.skhubooks.Service.CustomUserDetailService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	CustomUserDetailService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "home";
	}
	
	@RequestMapping(value="/member/signIn", method = RequestMethod.GET)
	public String signIn(Model model) {
		return "/member/signIn";
	}
	
	@RequestMapping(value="/member/signInDo", method = RequestMethod.GET)
	public String signInDo(Model model) throws Exception {
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
}
