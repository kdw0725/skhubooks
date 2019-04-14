package com.skhu.ProjectManager.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.ProjectManager.DAO.boardDAO;
import com.skhu.ProjectManager.VO.boardVO;

@Service
public class boardServiceImpl implements boardService{
	@Autowired
	private boardDAO dao;

	@Override
	public List<boardVO> boardList() throws Exception {
		return dao.boardList();
	}

}
