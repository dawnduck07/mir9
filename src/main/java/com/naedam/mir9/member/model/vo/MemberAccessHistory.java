package com.naedam.mir9.member.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberAccessHistory extends Member {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String accessHistoryStatus;
	private Date accessHistoryTime;
	private String accessHistoryIp;
	
	public MemberAccessHistory(int memberNo, String firstName, String lastName, String email, String phone,
			Date regDate, String status, String id, String password, String profileImg, Date updateDate, Date loginDate,
			Date withdrawalDate, String reason, List<SimpleGrantedAuthority> authorities) {
		super(memberNo, firstName, lastName, email, phone, regDate, status, id, password, profileImg, updateDate, loginDate,
				withdrawalDate, reason, authorities);
		// TODO Auto-generated constructor stub
	}
	
	
}
