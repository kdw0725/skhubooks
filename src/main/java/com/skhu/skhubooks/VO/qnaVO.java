package com.skhu.skhubooks.VO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter@Setter
@ToString
public class qnaVO {
	private int	   qna_no;
	private String qna_writer;
	private String qna_content;
	private String qna_insertdate;
	private String qna_comment;
}
