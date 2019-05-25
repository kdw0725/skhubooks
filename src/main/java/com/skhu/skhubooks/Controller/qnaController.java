package com.skhu.skhubooks.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.skhu.skhubooks.Service.qnaService;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.PageMaker;
import com.skhu.skhubooks.VO.qnaVO;

@Controller
public class qnaController {
	@Autowired
	qnaService service;
	
	@RequestMapping(value = "/qna/qnaList", method = RequestMethod.GET)
	public String qnaList(Model model, Criteria cri)throws Exception{
		List<qnaVO> list;
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.qnaTotalCount());
		list = service.qnaList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker",pageMaker);
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
	
	@RequestMapping(value="/qna/commentInsert", method = RequestMethod.GET)
	public String commentInsert(qnaVO qnavo) throws Exception{
		service.commentInsert(qnavo);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping(value="/qna/commentDelete", method = RequestMethod.GET)
	public String commentDelete(Integer qna_no) throws Exception {
		service.commentDelete(qna_no);
		return "redirect:/qna/qnaList";
	}
	
	@RequestMapping(value="/qna/commentUpdate", method = RequestMethod.POST)
	@ResponseBody
	public int commentUpdate(qnaVO qnavo) throws Exception{
		return service.commentUpdate(qnavo);
	}
	
	@RequestMapping(value="/qna/fna", method = RequestMethod.GET)
	public String fna() throws Exception{
		return "/qna/fna";
	}
}
