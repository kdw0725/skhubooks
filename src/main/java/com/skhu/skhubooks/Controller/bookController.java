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
import com.skhu.skhubooks.VO.fileVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Controller
public class bookController {
	private static final Logger logger = LoggerFactory.getLogger(bookController.class);
	
	@Autowired
	bookService service;
	
	@RequestMapping(value = "/book/bookList", method = RequestMethod.GET)
	public String bookList(Model model, Criteria cri, searchCriteria scri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.bookTotalCount(scri));
		model.addAttribute("list",service.selectBook(scri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("keyword",scri.getKeyword());
		return "/book/bookList";
	}
	
	@RequestMapping(value = "/book/bookInsert", method = RequestMethod.GET)
	public String bookInsert() throws Exception{
		return "/book/bookInsert";
	}
	
	@RequestMapping(value = "/book/bookInsertDo", method = RequestMethod.POST)
	public String bookInsertdDo(bookVO vo, fileVO fvo,
			@RequestParam("book_img") MultipartFile files
			) throws Exception{
		
		if(files.isEmpty()) {
			service.insertBook(vo);
		}else {
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
			
			fvo.setBook_no(vo.getBook_no());
			fvo.setFile_name(destinationFileName);
			fvo.setFile_ori_name(sourceFileName);
			fvo.setFile_url(fileURL);
			service.insertFile(fvo);
		}
		return "redirect:/book/bookList";
	}
	
	@RequestMapping(value = "/book/bookDetail", method = RequestMethod.GET)
	public String bookDetail(Model model, bookVO vo) {
		model.addAttribute("list",service.bookDetail(vo.getBook_no()));
		return "/book/bookDetail";
	}

	@RequestMapping(value="/book/bookDelete", method = RequestMethod.GET)
	public String bookDelete(bookVO vo, fileVO fvo) throws Exception {
		String fileURL = "C:/dev/sts-bundle/sts-3.9.7.RELEASE/workspace/SKHUBooks/src/main/webapp/resources/bootstrap/images/upload/";
		String fileName = fvo.getFile_name();
		File file = new File(fileURL+fileName);
		if(file.exists()==true) {
			file.delete();
		}
		service.delBook(vo.getBook_no());
		service.delFile(vo.getBook_no());
		return "redirect:/book/bookList";
	}
	
	@RequestMapping(value = "/book/bookUpdate", method = RequestMethod.GET)
	public String bookUpdate(Model model, bookVO vo) throws Exception{
		model.addAttribute("list",service.bookDetail(vo.getBook_no()));
		return "/book/bookUpdate";
	}
	
	@RequestMapping(value = "/book/bookSearch", method=RequestMethod.GET)
	public String bookSearch(Model model) throws Exception{
		model.addAttribute("newBook",service.newBook());
		return "/book/bookSearch";
	}
	
}
	