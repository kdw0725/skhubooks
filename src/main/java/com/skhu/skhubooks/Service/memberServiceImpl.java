package com.skhu.skhubooks.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.memberDAO;
import com.skhu.skhubooks.VO.memberVO;

@Service
public class memberServiceImpl implements memberService{
	@Autowired
	private memberDAO dao;

	
	@Override
	public int memberSignIn(memberVO VO) throws Exception {
		return dao.memberSignIn(VO);
	}

}
