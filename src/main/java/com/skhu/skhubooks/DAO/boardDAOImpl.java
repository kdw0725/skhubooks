package com.skhu.skhubooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.boardVO;

@Repository
public class boardDAOImpl implements boardDAO{
	private static final String namespace="com.skhu.skhubooks.boardMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<boardVO> boardList(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".boardList", cri);
	}

	@Override
	public int boardInsert(boardVO VO) throws Exception {
		return sqlSession.insert(namespace+".boardInsert", VO);
	}

	@Override
	public boardVO boardDetail(int board_no) throws Exception {
		return sqlSession.selectOne(namespace+".boardDetail", board_no);
	}

	@Override
	public int boardDelete(int board_no) throws Exception {
		return sqlSession.delete(namespace+".boardDelete", board_no);
	}

	@Override
	public int boardUpdate(boardVO VO) throws Exception {
		return sqlSession.update(namespace+".boardUpdate", VO);
	}

	@Override
	public int countBoardList() throws Exception {
		return sqlSession.selectOne(namespace+".countBoardList");
	}

}
