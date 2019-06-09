package com.skhu.skhubooks.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.boardVO;

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
		return sqlSession.selectOne(namespace+".selectUserID", member_id);
	}
	
	public int checkPnum(int member_pnum) throws Exception{
		return sqlSession.selectOne(namespace+".checkPnum", member_pnum);
	}
	
	public int checkNo(int member_no) throws Exception{
		return sqlSession.selectOne(namespace+".checkNo", member_no);
	}
	
	public CustomUserDetails selectByMemberId(String member_id) throws Exception{
		return sqlSession.selectOne(namespace+".selectByMemberId", member_id);
	}
	
	public List<HashMap<String, Object>> selectBook (Integer member_no) throws Exception{
		return sqlSession.selectList(namespace+".selectBook", member_no);
	}
	
	public List<boardVO> selectNotice() throws Exception{
		return sqlSession.selectList(namespace+".selectNotice");
	}
	
}
