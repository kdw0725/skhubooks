package com.skhu.skhubooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.Criteria;
import com.skhu.skhubooks.VO.qnaVO;
import com.skhu.skhubooks.VO.searchCriteria;

@Repository
public class qnaDAOImpl implements qnaDAO{
	private static final String namespace="com.skhu.skhubooks.qnaMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<qnaVO> qnaList(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace+".qnaList", cri);
	}

	@Override
	public int qnaInsert(qnaVO qnavo) throws Exception {
		return sqlSession.insert(namespace+".qnaInsert",qnavo);
	}

	@Override
	public int qnaDelete(int qna_no) throws Exception {
		return sqlSession.delete(namespace+".qnaDelete",qna_no);
	}

	@Override
	public int qnaUpdate(qnaVO qnavo) throws Exception {
		return sqlSession.update(namespace+".qnaUpdate",qnavo);
	}

	@Override
	public int commentInsert(qnaVO qnavo) throws Exception {
		return sqlSession.update(namespace+".commentInsert", qnavo);
	}

	@Override
	public int commentDelete(int qna_no) throws Exception {
		return sqlSession.update(namespace+".commentDelete", qna_no);
	}

	@Override
	public int commentUpdate(qnaVO qnavo) throws Exception {
		return sqlSession.update(namespace+".commentUpdate", qnavo);
	}

	@Override
	public int qnaTotalCount(searchCriteria scri) throws Exception {
		return sqlSession.selectOne(namespace+".qnaTotalCount",scri);
	}
}
