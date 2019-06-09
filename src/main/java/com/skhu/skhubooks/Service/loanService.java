package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.bookVO;

public interface loanService {
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails);
	public List<HashMap<String, Object>> selectBook(Integer member_no);
	public Integer memberCount(Integer member_no) throws Exception;
	public int bookLoan(bookVO vo) throws Exception;
	public int returnBook(String book_no) throws Exception;
	public Integer reserCheck(String book_no) throws Exception; 

}
