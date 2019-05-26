package com.skhu.skhubooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.bookDAO;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;

@Service
public class bookServiceImpl implements bookService{
	@Autowired
	private bookDAO dao;
	
	@Override
	public List<bookVO> selectBook(Criteria cri) throws Exception {
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

}
