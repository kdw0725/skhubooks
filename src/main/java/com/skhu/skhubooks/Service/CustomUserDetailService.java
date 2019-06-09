package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.skhu.skhubooks.DAO.UserAuthDAO;
import com.skhu.skhubooks.VO.CustomUserDetails;
import com.skhu.skhubooks.VO.boardVO;

public class CustomUserDetailService implements UserDetailsService{
	@Autowired
	private UserAuthDAO userAuthDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetails user = userAuthDAO.getUserById(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}
	
	public int memberSignIn(CustomUserDetails userdetail) {
		return userAuthDAO.memberSignIn(userdetail);
	}
	
	public int selectUserID(String member_id) throws Exception{
		return userAuthDAO.selectUserID(member_id);
	}
	
	public int checkPnum(int member_pnum) throws Exception{
		return userAuthDAO.checkPnum(member_pnum);
	}
	
	public int checkNo(int member_no) throws Exception{
		return userAuthDAO.checkNo(member_no);
	}
	
	public CustomUserDetails selectByMemberId(String member_id) throws Exception{
		return userAuthDAO.selectByMemberId(member_id);
	}
	
	public List<HashMap<String, Object>> selectBook (Integer member_no) throws Exception{
		return userAuthDAO.selectBook(member_no);
	}
	
	public List<boardVO> selectNotice() throws Exception{
		return userAuthDAO.selectNotice();
	}

	
}
