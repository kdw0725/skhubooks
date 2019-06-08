package com.skhu.skhubooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class bookVO {
	private String book_no;
	private String book_name;
	private String book_author;
	private String book_publisher;
	private String book_insertdate;
	private int    member_no;
	private String book_loandate;
	private String book_loancount;
	
}
