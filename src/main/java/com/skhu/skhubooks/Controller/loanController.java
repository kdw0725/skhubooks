package com.skhu.skhubooks.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class loanController {
	
	@RequestMapping(value = "/loan/loan", method = RequestMethod.GET)
	public String loan() {
		return "/loan/loan";
	}

}
