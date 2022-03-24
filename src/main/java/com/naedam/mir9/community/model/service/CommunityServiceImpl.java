package com.naedam.mir9.community.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.community.model.dao.CommunityDao;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao communityDao;

	@Override
	public List<Review> reviewList() {
		return communityDao.reviewList();
	}
	
	// 검색 조회
	@Override
	public List<Review> reviewSearch(Map<Object, String> param) {
		return communityDao.reviewSearch(param);
	}

	// 모달 정보
	@Override
	public List<Review> reviewModal(int reviewNo) {
		return communityDao.reviewModal(reviewNo);
	}

	// 모달 이미지
	@Override
	public List<ReviewImg> reviewImgModal(int reviewNo) {
		return communityDao.reviewImgModal(reviewNo);
	}


}
