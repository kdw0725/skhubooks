package com.skhu.skhubooks.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.memberVO;

@Repository
public class memberDAOImpl implements memberDAO{
	private static final String namespace="com.skhu.skhubooks.memberMapper";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memberSignIn(memberVO VO) throws Exception {
		return sqlSession.insert(namespace+".memberSignIn", VO);
	}

}
