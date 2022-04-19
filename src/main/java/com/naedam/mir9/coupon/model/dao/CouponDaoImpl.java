package com.naedam.mir9.coupon.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.coupon.model.vo.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired
	private SqlSession session;

	@Override
	public Coupon selectOneCouponByCouponNo(int couponNo) {
		// TODO Auto-generated method stub
		return session.selectOne("coupon.selectOneCouponByCouponNo", couponNo);
	}

	@Override
	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return session.insert("coupon.insertCoupon", coupon);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return session.update("coupon.updateCoupon", coupon);
	}

	@Override
	public int deleteCoupon(int couponNo) {
		// TODO Auto-generated method stub
		return session.delete("coupon.deleteCoupon", couponNo);
	}
	
	
}
