package com.skhu.skhubooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.qnaVO;

@Repository
public class qnaDAOImpl implements qnaDAO{
	private static final String namespace="com.skhu.skhubooks.qnaMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<qnaVO> qnaList() throws Exception {
		return sqlSession.selectList(namespace+".qnaList");
	}

}
