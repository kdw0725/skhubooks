package com.skhu.skhubooks.DAO;

import java.util.Map;

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
	
	public int memberSignIn(CustomUserDetails userdetail) {
		return sqlSession.insert(namespace+".memberSignIn",userdetail);
	}
	
	public int selectUserID(String member_id) throws Exception{
//		Map<String, Object> resultMap = sqlSession.selectOne(namespace+".selectUserID", map);
//		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
//		return result;
		
		return sqlSession.selectOne(namespace+".selectUserID", member_id);
	}
	
}
