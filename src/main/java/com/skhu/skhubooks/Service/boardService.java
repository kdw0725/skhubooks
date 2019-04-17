package com.skhu.skhubooks.Service;

import java.util.List;

import com.skhu.skhubooks.VO.boardVO;

public interface boardService {
	public List<boardVO> boardList() throws Exception;
	public int boardInsert(boardVO VO) throws Exception;
	public boardVO boardDetail(int board_no) throws Exception;

}
