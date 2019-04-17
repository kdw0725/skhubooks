package com.skhu.skhubooks.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.boardDAO;
import com.skhu.skhubooks.VO.boardVO;

@Service
public class boardServiceImpl implements boardService{
	@Autowired
	private boardDAO dao;

	@Override
	public List<boardVO> boardList() throws Exception {
		return dao.boardList();
	}

	@Override
	public int boardInsert(boardVO VO) throws Exception {
		return dao.boardInsert(VO);
	}

	@Override
	public boardVO boardDetail(int board_no) throws Exception {
		return dao.boardDetail(board_no);
	}

	@Override
	public int boardDelete(int board_no) throws Exception {
		return dao.boardDelete(board_no);
	}



}
