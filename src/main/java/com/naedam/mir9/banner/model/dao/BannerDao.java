package com.naedam.mir9.banner.model.dao;

import com.naedam.mir9.banner.model.vo.Banner;

public interface BannerDao {

	Banner selectOneBannerByBannerNo(int bannerNo);

	int updateBanner(Banner banner);

	int insertBanner(Banner banner);

	int deleteBanner(int bannerNo);

}
