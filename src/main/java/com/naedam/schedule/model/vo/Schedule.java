package com.naedam.schedule.model.vo;

import java.io.Serializable;

import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Schedule implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int scheduleNo;
	private String scheduleTitle;
	private String scheduleContents;
	private String scheduleStartDate;
	private String scheduleEndDate;
	private String scheduleColor;
}
