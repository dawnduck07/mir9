package com.naedam.mir9.board.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.board.model.vo.BoardTranslate;
import com.naedam.mir9.board.model.vo.Post;
import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.member.model.vo.Member;

public interface BoardDao {
	
	//게시판 등록
	public int addBoard(Board board) throws Exception;
	
	//게시글 등록
	public int addPost(Post post) throws Exception;
	
	//게시판 등록의 권한
	public int addAuthority(BoardAuthority boardAuthority) throws Exception;
	
	//게시판 등록의 옵션
	public int addOption(BoardOption boardOption) throws Exception;
	
	//게시판 등록의 번역
	public int addTranslate(BoardTranslate boardTranslate) throws Exception;
	
	//게시판 목록
	public List<Board> getBoardList(Search search) throws Exception;
	
	//게시판 목록의 수
	public int getTotalCount(Search search) throws Exception;
	
	//게시글 목록
	public List<Post> getPostList(Map<String, Object> map) throws Exception;
	
	//header의 게시판 제목
	public List<Board> getBoardTitle();
	
	//게시판의 데이터
	public Board getBoardData(int boardNo) throws Exception;
	
	//게시판의 모든 데이터
	public Board getBoardAllData(int boardNo) throws Exception;
	
	//회원의 데이터
	public Member getMemberData(int memberNo) throws Exception;
	
	//게시판 선택 삭제
	public void deleteChoiceBoard(int boardNo) throws Exception;
	
	//게시판 수정 (게시판, 권한, 옵션)
	public int updateBoard(Board board) throws Exception;
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception;
	public int updateOption(BoardOption boardOption) throws Exception;
	
	//게시글 수
	public int getTotalCount2(Map <String, Object> map) throws Exception;
	
	
}
