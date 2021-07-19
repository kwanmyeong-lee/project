package com.it.lylj.boardComment.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardCommentVO {
	private int boardCommentNo;
	private int boardNo;
	private String boardCommentContent;
	private String boardCommentWriter;
	private Timestamp boardCommentDate;
	private String boardCommentDelflag;
	private int boardCommentGroupNo;
}
