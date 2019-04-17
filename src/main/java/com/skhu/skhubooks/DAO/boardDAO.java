package com.skhu.skhubooks.DAO;

import java.util.List;

import com.skhu.skhubooks.VO.boardVO;

public interface boardDAO {
	public List<boardVO> boardList() throws Exception;
	public int boardInsert(boardVO VO) throws Exception;
	public boardVO boardDetail(int board_no) throws Exception;
	public int boardDelete(int board_no) throws Exception;
	
}
