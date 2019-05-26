package com.skhu.skhubooks.Controller;


import java.io.File;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.skhu.skhubooks.Service.bookService;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.PageMaker;
import com.skhu.skhubooks.VO.bookVO;

@Controller
public class bookController {
	private static final Logger logger = LoggerFactory.getLogger(bookController.class);
	
	@Autowired
	bookService service;
	
	@RequestMapping(value = "/book/bookList", method = RequestMethod.GET)
	public String bookList(Model model, Criteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.bookTotalCount());
		model.addAttribute("list",service.selectBook(cri));
		return "/book/bookList";
	}
	
	@RequestMapping(value = "/book/bookInsert", method = RequestMethod.GET)
	public String bookInsert() throws Exception{
		return "/book/bookInsert";
	}
	
	@RequestMapping(value = "/book/bookInsertDo", method = RequestMethod.POST)
	public String bookInsertdDo(bookVO vo,
			@RequestParam("book_img") MultipartFile files
			) throws Exception{
		String sourceFileName = files.getOriginalFilename();
		String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileURL = "C:\\dev\\sts-bundle\\sts-3.9.7.RELEASE\\workspace\\SKHUBooks\\src\\main\\webapp\\resources\\bootstrap\\images\\upload\\";
		
		do {
			destinationFileName = RandomStringUtils .randomAlphanumeric(32)+"."+sourceFileNameExtension;
			destinationFile = new File(fileURL+destinationFileName);
		}while(destinationFile.exists());
		
		destinationFile.getParentFile().mkdirs();
		files.transferTo(destinationFile);
		
		service.insertBook(vo);
		
		return "redirect:/book/bookList";
	}
	
}
	