package com.naedam.mir9.banner.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.banner.model.vo.Banner;

@Repository
public class BannerDaoImpl implements BannerDao {
	@Autowired
	private SqlSession session;

	@Override
	public Banner selectOneBannerByBannerNo(int bannerNo) {
		// TODO Auto-generated method stub
		return session.selectOne("banner.selectOneBannerByBannerNo", bannerNo);
	}
	
	
}
