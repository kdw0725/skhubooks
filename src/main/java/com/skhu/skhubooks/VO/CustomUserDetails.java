package com.skhu.skhubooks.VO;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.ToString;

@SuppressWarnings("serial")
@ToString
public class CustomUserDetails implements UserDetails{
	private int     member_no;
	private String  member_name;
	private String  member_id;
	private String  member_pw;
	private int     member_birth;
	private int     member_pnum;
	private String  member_role;
	private boolean member_enabled;
	private String  member_department;
	private int		member_grade;
	
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
	public void setPassword(String member_pw) {
		this.member_pw=member_pw;
	}
	@Override
	public String getUsername() {
		return member_id;
	}
	public void setUsername(String member_id) {
		this.member_id=member_id;
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
	public String getMember_department() {
		return member_department;
	}
	public void setMember_department(String member_department) {
		this.member_department = member_department;
	}
	public int getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}
	
}
