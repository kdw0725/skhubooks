package com.skhu.skhubooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.qnaDAO;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.qnaVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Service
public class qnaServiceImpl implements qnaService{
	@Autowired
	private qnaDAO dao;

	@Override
	public List<qnaVO> qnaList(Criteria cri) throws Exception {
		return dao.qnaList(cri);
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

	@Override
	public int commentDelete(int qna_no) throws Exception {
		return dao.commentDelete(qna_no);
	}

	@Override
	public int commentUpdate(qnaVO qnavo) throws Exception {
		return dao.commentUpdate(qnavo);
	}

	@Override
	public int qnaTotalCount(searchCriteria scri) throws Exception {
		return dao.qnaTotalCount(scri);
	}
	
}