package com.naedam.admin.banner.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.banner.model.dao.BannerDao;
import com.naedam.admin.banner.model.vo.Banner;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private BannerDao bannerDao;

	/**
	 * 공통 : 배너 메시지
	 */
	@Override
	public Map<String, Object> bannerProcess(
			Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		Banner banner = (Banner) map.get("banner");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if("insert".equals(map.get("mode"))) {
			bannerDao.insertBanner(banner);
			resultMap.put("msg", "배너 정보가 등록되었습니다.");
		}else if("update".equals(map.get("mode"))) {
			bannerDao.updateBanner(banner);
			resultMap.put("msg", "팝업 정보가 수정되었습니다.");
		}else if("delete".equals(map.get("mode"))) {
			List<String> bannerNoList = Arrays.asList(request.getParameterValues("list[]"));
			for(String no : bannerNoList) {
				bannerDao.deleteBanner(Integer.parseInt(no));
				resultMap.put("msg", "배너가 삭제 되었습니다.");
			}
		}
		return resultMap;
	}
	
	/**
	 * 배너 이미지 조회
	 */
	@Override
	public Map<String, Object> selectOneBannerByBannerNo(int bannerNo) {
		Map<String, Object> resultMap = new HashMap<>();
		if(bannerNo == 0) {
			resultMap.put("url", "http://fs.joycity.com/web/images/common/fs1_er.png");
		}else {
			resultMap.put("url", bannerDao.selectOneBannerByBannerNo(bannerNo).getImgUrl());
		}
		resultMap.put("banner", bannerDao.selectOneBannerByBannerNo(bannerNo));
		return resultMap;
	}
	
	/**
	 * 배너 등록
	 */
	@Override
	public int insertBanner(Banner banner) {
		return bannerDao.insertBanner(banner);
	}

	/**
	 * 배너 수정
	 */
	@Override
	public int updateBanner(Banner banner) {
		return bannerDao.updateBanner(banner);
	}

	/**
	 * 배너 삭제 
	 */
	@Override
	public int deleteBanner(int bannerNo) {
		return bannerDao.deleteBanner(bannerNo);
	}

	
}
