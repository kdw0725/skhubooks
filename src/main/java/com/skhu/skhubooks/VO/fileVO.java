package com.skhu.skhubooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class fileVO {
	private int    file_no;
	private int    book_no;
	private String file_name;
	private String file_ori_name;
	private String file_url;
}
