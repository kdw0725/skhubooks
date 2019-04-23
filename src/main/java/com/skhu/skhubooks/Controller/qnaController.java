package com.skhu.skhubooks.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skhu.skhubooks.Service.qnaService;
import com.skhu.skhubooks.VO.qnaVO;

@Controller
public class qnaController {
	@Autowired
	qnaService service;
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model)throws Exception{
		List<qnaVO> list;
		list = service.qnaList();
		model.addAttribute("list", list);
		return "/qna/qnaList";
	}
}
