package com.skhu.skhubooks.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skhu.skhubooks.Service.boardService;
import com.skhu.skhubooks.VO.boardVO;

@Controller
public class boardController {
	@Autowired
	boardService service;
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String boardList(Model model)throws Exception{
		List<boardVO> list;
		list = service.boardList();
		model.addAttribute("list", list);
		return "/board/boardList";
	}
	
	@RequestMapping(value = "/boardInsert", method = RequestMethod.GET)
	public String boardInsert(Model model)throws Exception{
		return "/board/boardInsert";
	}
	
	@RequestMapping(value = "/boardInsertDo", method = RequestMethod.GET)
	public String boardInsertDo(Model model, boardVO boardvo)throws Exception{
		service.boardInsert(boardvo);
		return "redirect:/boardList";
	}
	
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, boardVO boardvo)throws Exception{
		model.addAttribute("list", service.boardDetail(boardvo.getBoard_no()));
		return "/board/boardDetail";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(Model model, boardVO boardvo)throws Exception{
		service.boardDelete(boardvo.getBoard_no());
		return "redirect:/boardList";
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(Model model)throws Exception{
		return "/board/boardUpdate";
	}
	
}
