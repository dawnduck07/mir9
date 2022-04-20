package com.naedam.mir9.member.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString(callSuper=true)
public class WithdrawalMember extends Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String reason;
	private Date withdrawalDate;
	private List<SimpleGrantedAuthority> grade;
	
	public WithdrawalMember(int memberNo, String firstName, String lastName, String address,
			String email, String phone, Date regDate, String status, String id, String password, String profileImg, String reason, Date withdrawalDate, List<SimpleGrantedAuthority> grade
			, Date updateDate, Date loginDate) {
		super(memberNo, firstName, lastName, email, phone, regDate, status, id, password, profileImg, updateDate, loginDate, grade);
		this.reason = reason;
		this.withdrawalDate = withdrawalDate;
		this.grade = grade;
		// TODO Auto-generated constructor stub
	}
	
	
	
	

}
