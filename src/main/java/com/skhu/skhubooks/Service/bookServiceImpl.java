package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.bookDAO;
import com.skhu.skhubooks.VO.bookVO;
import com.skhu.skhubooks.VO.fileVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Service
public class bookServiceImpl implements bookService{
	@Autowired
	private bookDAO dao;
	
	@Override
	public List<HashMap<String, Object>> selectBook(searchCriteria scri) throws Exception {
		return dao.selectBook(scri);
	}

	@Override
	public int bookTotalCount() throws Exception {
		return dao.bookTotalCount();
	}

	@Override
	public int insertBook(bookVO vo) throws Exception {
		return dao.insertBook(vo);
	}

	@Override
	public int insertFile(fileVO vo) throws Exception {
		return dao.insertFile(vo);
	}

	@Override
	public HashMap<String, Object> bookDetail(String book_no) {
		return dao.bookDetail(book_no);
	}

	@Override
	public int delBook(String book_no) throws Exception {
		return dao.delBook(book_no);
	}

	@Override
	public int delFile(String book_no) throws Exception {
		return dao.delFile(book_no);
	}

}
