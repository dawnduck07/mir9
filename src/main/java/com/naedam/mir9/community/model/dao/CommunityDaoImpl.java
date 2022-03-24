package com.naedam.mir9.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

@Repository
public class CommunityDaoImpl implements CommunityDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<Review> reviewList() {
		return session.selectList("review.reviewList");
	}

	// 모달 정보
	@Override
	public List<Review> reviewModal(int reviewNo) {
		return session.selectList("review.reviewModal", reviewNo);
	}

	// 모달 이미지
	@Override
	public List<ReviewImg> reviewImgModal(int reviewNo) {
		return session.selectList("review.reviewImgModal", reviewNo);
	}
	
}
