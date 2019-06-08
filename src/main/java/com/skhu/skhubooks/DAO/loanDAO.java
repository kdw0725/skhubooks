package com.skhu.skhubooks.DAO;
import java.util.HashMap;
import java.util.List;

import com.skhu.skhubooks.VO.CustomUserDetails;

public interface loanDAO {
	public CustomUserDetails selectByMemberNo(CustomUserDetails userDetails);
	public List<HashMap<String, Object>> selectBook();
	public Integer memberCount(Integer member_no) throws Exception;
	
}
