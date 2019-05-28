package com.skhu.skhubooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class searchCriteria extends Criteria{
	private String searchType;
	private String keyword;
	
}
