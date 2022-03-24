package com.naedam.mir9.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.naedam.mir9.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Post implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int postNo;				//게시글번호
	private Board boardNo;			//board의 데이터
	private String postTitle;		//게시판종류제목
	private String postContents;	//게시판종류내용
	private String postDate;		//게시판종류작성일자
	private String postThombnail;	//게시판종류섬네일
	private int postViewCount;		//게시판종류 본횟수
	private Member memberNo;		//회원데이터
	
}
