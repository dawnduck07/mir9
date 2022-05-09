package com.naedam.mir9.coupon.model.dao;

import java.util.List;

import com.naedam.mir9.coupon.model.vo.Coupon;
import com.naedam.mir9.coupon.model.vo.MemberCoupon;

public interface CouponDao {

	Coupon selectOneCouponByCouponNo(int couponNo);

	int insertCoupon(Coupon coupon);

	int updateCoupon(Coupon coupon);

	int deleteCoupon(int couponNo);

	List<Coupon> selectCouponList();

	int insertMemberCoupon(MemberCoupon memberCoupon);

	List<Coupon> getCoupon(String code);
}
