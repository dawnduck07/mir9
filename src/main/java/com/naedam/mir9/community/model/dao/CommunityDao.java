package com.naedam.mir9.community.model.dao;

import java.util.List;

import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

public interface CommunityDao {

	List<Review> reviewList();

	List<Review> reviewModal(int reviewNo);

	List<ReviewImg> reviewImgModal(int reviewNo);

}
