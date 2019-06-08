package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.loanDAO;
import com.skhu.skhubooks.VO.CustomUserDetails;

@Service
public class loanServiceImpl implements loanService{
	
	@Autowired
	loanDAO dao;

	@Override
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails) {
		return dao.selectByMemberNo(userDetails);
	}

	@Override
	public List<HashMap<String, Object>> selectBook() {
		return dao.selectBook();
	}

	@Override
	public Integer memberCount(Integer member_no) throws Exception {
		return dao.memberCount(member_no);
	}


}
