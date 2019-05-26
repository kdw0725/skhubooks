package com.skhu.skhubooks.DAO;

import java.util.List;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;

public interface bookDAO {
	public List<bookVO> selectBook(Criteria cri) throws Exception;
	public int bookTotalCount() throws Exception;
	public int insertBook(bookVO vo) throws Exception;
	
}
