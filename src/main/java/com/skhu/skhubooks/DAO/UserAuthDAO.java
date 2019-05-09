package com.skhu.skhubooks.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.CustomUserDetails;

@Repository("userAuthDAO")
public class UserAuthDAO {
	private static final String namespace="com.skhu.skhubooks.memberMapper";

	@Autowired
	private SqlSession sqlSession;

	public CustomUserDetails getUserById(String username) {
		return sqlSession.selectOne(namespace+".selectUserById", username);
	}

	
}
