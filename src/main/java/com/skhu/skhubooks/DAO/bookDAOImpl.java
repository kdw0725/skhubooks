package com.skhu.skhubooks.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.bookVO;
import com.skhu.skhubooks.VO.fileVO;

@Repository
public class bookDAOImpl implements bookDAO{
	private static final String namespace="com.skhu.skhubooks.bookMapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HashMap<String, Object>> selectBook(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".selectBook", cri);
	}

	@Override
	public int bookTotalCount() throws Exception {
		return sqlSession.selectOne(namespace+".bookTotalCount");
	}

	@Override
	public int insertBook(bookVO vo) throws Exception {
		return sqlSession.insert(namespace+".insertBook", vo);
	}

	@Override
	public int insertFile(fileVO vo) throws Exception {
		return sqlSession.insert(namespace+".insertFile",vo);
	}

}
