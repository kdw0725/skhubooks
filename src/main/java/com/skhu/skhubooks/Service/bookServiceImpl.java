package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.bookDAO;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;
import com.skhu.skhubooks.VO.fileVO;

@Service
public class bookServiceImpl implements bookService{
	@Autowired
	private bookDAO dao;
	
	@Override
	public List<HashMap<String, Object>> selectBook(Criteria cri) throws Exception {
		return dao.selectBook(cri);
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

}
