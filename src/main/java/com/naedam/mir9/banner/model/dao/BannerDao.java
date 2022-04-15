package com.naedam.mir9.banner.model.dao;

import com.naedam.mir9.banner.model.vo.Banner;

public interface BannerDao {

	Banner selectOneBannerByBannerNo(int bannerNo);

}
