package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;
import com.skhu.skhubooks.VO.fileVO;

public interface bookService {
	public List<HashMap<String, Object>> selectBook(Criteria cri) throws Exception;
	public int bookTotalCount() throws Exception;
	public int insertBook(bookVO vo) throws Exception;
	public int insertFile(fileVO vo) throws Exception;

}
