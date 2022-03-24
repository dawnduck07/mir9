package com.naedam.mir9.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.board.model.dao.BoardDao;
import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.board.model.vo.BoardTranslate;
import com.naedam.mir9.board.model.vo.Post;
import com.naedam.mir9.member.model.vo.Member;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	@Override
	public int addBoard(Board board) throws Exception {
		return boardDao.addBoard(board);
	}
	
	@Override
	public int addPost(Post post) throws Exception {
		return boardDao.addPost(post);
	}

	@Override
	public int addAuthority(BoardAuthority boardAuthority) throws Exception {
		return boardDao.addAuthority(boardAuthority);
	}

	@Override
	public int addOption(BoardOption boardOption) throws Exception {
		return boardDao.addOption(boardOption);
	}

	@Override
	public int addTranslate(BoardTranslate boardTranslate) throws Exception {
		return boardDao.addTranslate(boardTranslate);
	}

	@Override
	public Map<String, Object> getBoardList(Board board) throws Exception {
		
		List<Board> list = boardDao.getBoardList(board);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}

	@Override
	public Map<String, Object> getPostList(int boardNo) throws Exception {
		
		List<Post> list = boardDao.getPostList(boardNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	
	@Override
	public List<Board> getBoardTitle() throws Exception {
		return boardDao.getBoardTitle();
	}

	@Override
	public Board getBoardData(int boardNo) throws Exception {
		return boardDao.getBoardData(boardNo);
	}
	
	@Override
	public Board getBoardAllData(int boardNo) throws Exception {
		return boardDao.getBoardAllData(boardNo);
	}

	@Override
	public Member getMemberData(int memberNo) throws Exception {
		return boardDao.getMemberData(memberNo);
	}

	@Override
	public void deleteChoiceBoard(int boardNo) throws Exception {
		boardDao.deleteChoiceBoard(boardNo);
	}

	@Override
	public int updateBoard(Board board) throws Exception {
		return boardDao.updateBoard(board);
	}

	@Override
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception {
		return boardDao.updateAuthority(boardAuthority);
	}

	@Override
	public int updateOption(BoardOption boardOption) throws Exception {
		return boardDao.updateOption(boardOption);
	}

	






}
