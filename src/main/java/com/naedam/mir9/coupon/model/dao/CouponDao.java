package com.naedam.mir9.coupon.model.dao;

import com.naedam.mir9.coupon.model.vo.Coupon;

public interface CouponDao {

	Coupon selectOneCouponByCouponNo(int couponNo);

	int insertCoupon(Coupon coupon);

	int updateCoupon(Coupon coupon);

	int deleteCoupon(int couponNo);

}
