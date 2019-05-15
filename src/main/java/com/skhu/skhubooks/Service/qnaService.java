package com.skhu.skhubooks.Service;

import java.util.List;

import com.skhu.skhubooks.VO.qnaVO;

public interface qnaService {
	public List<qnaVO> qnaList() throws Exception;
	public int qnaInsert(qnaVO qnavo) throws Exception;
	public int qnaDelete(int qna_no) throws Exception;
	public int qnaUpdate(qnaVO qnavo) throws Exception;
	
}
