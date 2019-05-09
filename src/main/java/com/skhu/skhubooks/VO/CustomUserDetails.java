package com.skhu.skhubooks.VO;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails{
	private int	    member_no;
	private String  member_name;
	private String  member_id;
	private String  member_pw;
	private int     member_birth;
	private int     member_pnum;
	private String  member_role;
	private boolean member_enabled;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(member_role));
		return auth;
	}
	@Override
	public String getPassword() {
		return member_pw;
	}
	@Override
	public String getUsername() {
		return member_id;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return member_enabled;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(int member_birth) {
		this.member_birth = member_birth;
	}
	public int getMember_pnum() {
		return member_pnum;
	}
	public void setMember_pnum(int member_pnum) {
		this.member_pnum = member_pnum;
	}
}
