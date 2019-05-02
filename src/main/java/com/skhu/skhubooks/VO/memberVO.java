package com.skhu.skhubooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class memberVO {
	private int	   member_no;
	private String member_name;
	private String member_id;
	private String member_pw;
	private int    member_birth;
	private int    member_pnum;
	private String member_role;
}
