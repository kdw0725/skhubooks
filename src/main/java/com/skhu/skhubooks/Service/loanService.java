package com.skhu.skhubooks.Service;

import java.util.HashMap;
import java.util.List;

import com.skhu.skhubooks.VO.CustomUserDetails;

public interface loanService {
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails);
	public List<HashMap<String, Object>> selectBook();
	public Integer memberCount(Integer member_no) throws Exception;

}
