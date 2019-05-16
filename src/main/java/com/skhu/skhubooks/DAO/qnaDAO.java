package com.skhu.skhubooks.DAO;

import java.util.List;

import com.skhu.skhubooks.VO.qnaVO;

public interface qnaDAO {
	public List<qnaVO> qnaList() throws Exception;
	public int qnaInsert(qnaVO qnavo) throws Exception;
	public int qnaDelete(int qna_no) throws Exception;
	public int qnaUpdate(qnaVO qnavo) throws Exception;
	public int commentInsert(qnaVO qnavo) throws Exception;
	public int commentDelete(int qna_no) throws Exception;
	public int commentUpdate(qnaVO qnavo) throws Exception;
	
}
