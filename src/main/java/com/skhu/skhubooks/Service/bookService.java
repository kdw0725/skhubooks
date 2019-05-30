package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;
import com.skhu.skhubooks.VO.fileVO;
import com.skhu.skhubooks.VO.searchCriteria;

public interface bookService {
	public List<HashMap<String, Object>> selectBook(Criteria cri) throws Exception;
	public int bookTotalCount(searchCriteria scri) throws Exception;
	public int insertBook(bookVO vo) throws Exception;
	public int insertFile(fileVO vo) throws Exception;
	public HashMap<String, Object> bookDetail(String book_no);
	public int delBook(String book_no) throws Exception;
	public int delFile(String book_no) throws Exception;

}
