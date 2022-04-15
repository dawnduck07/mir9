package com.naedam.mir9.member.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class MemberEntity extends Member {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String addressMain;
	private String addressSub;
	private String addressZipcode;
	private int pointAmt;
	
	public MemberEntity(int memberNo, String firstName, String lastName, String address,
			String email, String phone, Date regDate, String status, String id, String password, String profileImg,
			List<SimpleGrantedAuthority> authorities, String addressMain, String addressSub, int pointAmt,
			String addressZipcode) {
		super(memberNo, firstName, lastName, email, phone, regDate, status, id, password, profileImg,
				authorities);
		this.addressMain = addressMain;
		this.addressSub = addressSub;
		this.addressZipcode = addressZipcode;
		this.pointAmt = pointAmt;	
	}
	
}

