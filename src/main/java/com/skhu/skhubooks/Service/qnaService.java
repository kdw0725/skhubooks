package com.skhu.skhubooks.Service;

import java.util.List;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.qnaVO;

public interface qnaService {
	public List<qnaVO> qnaList(Criteria cri) throws Exception;
	public int qnaInsert(qnaVO qnavo) throws Exception;
	public int qnaDelete(int qna_no) throws Exception;
	public int qnaUpdate(qnaVO qnavo) throws Exception;
	public int commentInsert(qnaVO qnavo) throws Exception;
	public int commentDelete(int qna_no) throws Exception;
	public int commentUpdate(qnaVO qnavo) throws Exception;
	public int qnaTotalCount() throws Exception;

}
