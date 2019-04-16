package com.skhu.skhubooks.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.boardVO;

@Repository
public class boardDAOImpl implements boardDAO{
	private static final String namespace="com.skhu.skhubooks.boardMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<boardVO> boardList() throws Exception {
		return sqlSession.selectList(namespace+".boardList");
	}

	@Override
	public int boardInsert(boardVO VO) throws Exception {
		return sqlSession.insert(namespace+".boardInsert",VO);
	}

}
