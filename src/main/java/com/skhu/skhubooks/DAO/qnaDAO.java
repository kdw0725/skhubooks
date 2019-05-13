package com.skhu.skhubooks.DAO;

import java.util.List;

import com.skhu.skhubooks.VO.qnaVO;

public interface qnaDAO {
	public List<qnaVO> qnaList() throws Exception;
	public int qnaInsert(qnaVO qnavo) throws Exception;
	
}
