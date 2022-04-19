package com.naedam.mir9.coupon.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.coupon.model.dao.CouponDao;
import com.naedam.mir9.coupon.model.vo.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDao couponDao;

	@Override
	public Coupon selectOneCouponByCouponNo(int couponNo) {
		// TODO Auto-generated method stub
		return couponDao.selectOneCouponByCouponNo(couponNo);
	}

	@Override
	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return couponDao.insertCoupon(coupon);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return couponDao.updateCoupon(coupon);
	}

	@Override
	public int deleteCoupon(int couponNo) {
		// TODO Auto-generated method stub
		return couponDao.deleteCoupon(couponNo);
	}
	
	
	
}
