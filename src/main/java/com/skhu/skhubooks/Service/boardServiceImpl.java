package com.skhu.skhubooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.skhubooks.DAO.boardDAO;
import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.boardVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Service
public class boardServiceImpl implements boardService{
	@Autowired
	private boardDAO dao;

	@Override
	public List<boardVO> boardList(Criteria cri) throws Exception {
		return dao.boardList(cri);
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

	@Override
	public int boardUpdate(boardVO VO) throws Exception {
		return dao.boardUpdate(VO);
	}

	@Override
	public int countBoardList(searchCriteria scri) throws Exception {
		return dao.countBoardList(scri);
	}




}
