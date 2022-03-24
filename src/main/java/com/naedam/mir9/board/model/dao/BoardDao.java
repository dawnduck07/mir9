package com.naedam.mir9.board.model.dao;

import java.util.List;

import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.board.model.vo.BoardTranslate;
import com.naedam.mir9.board.model.vo.Post;
import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.member.model.vo.Member;

public interface BoardDao {
	
	public int addBoard(Board board) throws Exception;
	
	public int addPost(Post post) throws Exception;
	
	public int addAuthority(BoardAuthority boardAuthority) throws Exception;
	
	public int addOption(BoardOption boardOption) throws Exception;
	
	public int addTranslate(BoardTranslate boardTranslate) throws Exception;
	
	public List<Board> getBoardList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public List<Post> getPostList(int boardNo) throws Exception;
	
	public int getTotalCount2(int boardNo) throws Exception;
	
	public List<Board> getBoardTitle();
	
	public Board getBoardData(int boardNo) throws Exception;
	
	public Board getBoardAllData(int boardNo) throws Exception;
	
	public Member getMemberData(int memberNo) throws Exception;
	
	public void deleteChoiceBoard(int boardNo) throws Exception;
	
	public int updateBoard(Board board) throws Exception;
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception;
	public int updateOption(BoardOption boardOption) throws Exception;
	
	
	
}
