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

	@Override
	public int qnaInsert(qnaVO qnavo) throws Exception {
		return dao.qnaInsert(qnavo);
	}

	@Override
	public int qnaDelete(int qna_no) throws Exception {
		return dao.qnaDelete(qna_no);
	}

	@Override
	public int qnaUpdate(qnaVO qnavo) throws Exception {
		return dao.qnaUpdate(qnavo);
	}

	@Override
	public int commentInsert(qnaVO qnavo) throws Exception {
		return dao.commentInsert(qnavo);
	}
	
}
