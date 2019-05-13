package com.skhu.skhubooks.Service;

import java.util.List;

import com.skhu.skhubooks.VO.qnaVO;

public interface qnaService {
	public List<qnaVO> qnaList() throws Exception;
	public int qnaInsert(qnaVO qnavo) throws Exception;

}
