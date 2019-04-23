package com.skhu.skhubooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.qnaDAO;
import com.skhu.skhubooks.VO.qnaVO;

@Service
public class qnaServiceImpl implements qnaService{
	@Autowired
	private qnaDAO dao;

	@Override
	public List<qnaVO> qnaList() throws Exception {
		return dao.qnaList();
	}

}
