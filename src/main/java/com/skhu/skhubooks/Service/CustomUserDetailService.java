package com.skhu.skhubooks.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.skhu.skhubooks.DAO.UserAuthDAO;
import com.skhu.skhubooks.VO.CustomUserDetails;

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
}
