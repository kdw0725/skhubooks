package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.loanDAO;
import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.bookVO;

@Service
public class loanServiceImpl implements loanService{
	
	@Autowired
	loanDAO dao;

	@Override
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails) {
		return dao.selectByMemberNo(userDetails);
	}

	@Override
	public List<HashMap<String, Object>> selectBook(Integer member_no) {
		return dao.selectBook(member_no);
	}

	@Override
	public Integer memberCount(Integer member_no) throws Exception {
		return dao.memberCount(member_no);
	}

	@Override
	public int bookLoan(bookVO vo) throws Exception {
		return dao.bookLoan(vo);
	}

	@Override
	public int returnBook(Integer book_no) throws Exception {
		return dao.returnBook(book_no);
	}


}
