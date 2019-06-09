package com.skhu.skhubooks.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.bookVO;

@Repository
public class loanDAOImpl implements loanDAO{
	private static final String namespace="com.skhu.skhubooks.loanMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails) {
		return sqlSession.selectOne(namespace+".selectByMemberNo", userDetails);
	}

	@Override
	public List<HashMap<String, Object>> selectBook(Integer member_no) {
		return sqlSession.selectList(namespace+".selectBook", member_no);
	}

	@Override
	public Integer memberCount(Integer member_no) throws Exception {
		return sqlSession.selectOne(namespace+".memberCount", member_no);
	}

	@Override
	public int bookLoan(bookVO vo) throws Exception {
		return sqlSession.update(namespace+".bookLoan", vo);
	}

	@Override
	public int returnBook(String book_no) throws Exception {
		return sqlSession.update(namespace+".returnBook", book_no);
	}

	@Override
	public Integer reserCheck(String book_no) throws Exception {
		return sqlSession.selectOne(namespace+".reserCheck", book_no);
	}

	@Override
	public Integer isReserve(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace+".isReserve", map);
	}


}
