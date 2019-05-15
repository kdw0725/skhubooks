package com.skhu.skhubooks.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skhu.skhubooks.Service.qnaService;
import com.skhu.skhubooks.VO.qnaVO;

@Controller
public class qnaController {
	@Autowired
	qnaService service;
	
	@RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model)throws Exception{
		List<qnaVO> list;
		list = service.qnaList();
		model.addAttribute("list", list);
		return "/qna/qnaList";
	}
	
	@RequestMapping(value="/qna/qnaInsert", method  = RequestMethod.GET)
	public String qnaInsert(Model model, qnaVO qnavo) throws Exception{
		service.qnaInsert(qnavo);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping(value="/qna/qnaDelete", method  = RequestMethod.GET)
	public String qnaDelete(Model model, qnaVO qnavo) throws Exception {
		service.qnaDelete(qnavo.getQna_no());
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping(value="/qna/qnaUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int qnaUpdate(qnaVO qnavo, String qna_content) throws Exception{
		return service.qnaUpdate(qnavo);
	}
}
