package com.skhu.skhubooks.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.CustomUserDetails;

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
	public List<HashMap<String, Object>> selectBook() {
		return sqlSession.selectList(namespace+".selectBook");
	}

	@Override
	public Integer memberCount(Integer member_no) throws Exception {
		return sqlSession.selectOne(namespace+".memberCount", member_no);
	}


}
