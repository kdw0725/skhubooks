package com.skhu.skhubooks.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skhu.skhubooks.Service.boardService;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.PageMaker;
import com.skhu.skhubooks.VO.boardVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Controller
public class boardController {
	@Autowired
	boardService service;
	
	@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
	public String boardList(Model model, Criteria cri, searchCriteria scri)throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.countBoardList(scri));
		model.addAttribute("list",  service.boardList(scri));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("keyword",scri.getKeyword());
		return "/board/boardList";
	}
	
	@RequestMapping(value = "/board/boardInsert", method = RequestMethod.GET)
	public String boardInsert(Model model)throws Exception{
		return "/board/boardInsert";
	}
	
	@RequestMapping(value = "/board/boardInsertDo", method = RequestMethod.GET)
	public String boardInsertDo(Model model, boardVO boardvo)throws Exception{
		service.boardInsert(boardvo);
		return "redirect:/board/boardList?oage=1";
	}
	
	@RequestMapping(value = "/board/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, boardVO boardvo)throws Exception{
		model.addAttribute("list",service.boardDetail(boardvo.getBoard_no()));
		return "/board/boardDetail";
	}
	
	@RequestMapping(value = "/board/boardDelete", method = RequestMethod.GET)
	public String boardDelete(Model model, boardVO boardvo)throws Exception{
		service.boardDelete(boardvo.getBoard_no());
		return "redirect:/board/boardList?page=1";
	}
	
	@RequestMapping(value = "/board/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(Model model, boardVO boardvo)throws Exception{
		model.addAttribute("list",service.boardDetail(boardvo.getBoard_no()));
		return "/board/boardUpdate";
	}
	
	@RequestMapping(value = "/board/boardUpdateDo", method = RequestMethod.GET)
	public String boardUpdateDo(Model model, boardVO boardvo)throws Exception{
//		System.out.println(boardvo);
		service.boardUpdate(boardvo);
		return "redirect:/board/boardDetail?board_no="+boardvo.getBoard_no();
	}
}
