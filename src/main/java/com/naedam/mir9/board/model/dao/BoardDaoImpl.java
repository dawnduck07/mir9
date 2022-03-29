package com.naedam.mir9.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.board.model.vo.BoardTranslate;
import com.naedam.mir9.board.model.vo.Post;
import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.member.model.vo.Member;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시판 등록
	@Override
	public int addBoard(Board board) throws Exception {
		return sqlSession.insert("board.addBoard", board);
	}
	
	//게시글 등록
	@Override
	public int addPost(Post post) throws Exception {
		return sqlSession.insert("board.addPost", post);
	}

	//게시판 등록의 권한
	@Override
	public int addAuthority(BoardAuthority boardAuthority) throws Exception {
		return sqlSession.insert("board.addAuthority", boardAuthority);
	}
	
	//게시판 등록의 옵션
	@Override
	public int addOption(BoardOption boardOption) throws Exception {
		return sqlSession.insert("board.addOption", boardOption);
	}
	
	//게시판 등록의 번역
	@Override
	public int addTranslate(BoardTranslate boardTranslate) throws Exception {
		return sqlSession.insert("board.addTranslate", boardTranslate);
	}
	
	//게시판 목록
	@Override
	public List<Board> getBoardList(Search search) throws Exception {
		return sqlSession.selectList("board.getBoardList", search);
	}
	
	//게시판의 수
	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("board.getTotalCount", search);
	}
	
	//게시글 목록
	@Override
	public List<Post> getPostList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("board.getPostList", map);
	}
	
	//header의 게시판 제목
	@Override
	public List<Board> getBoardTitle() {
		return sqlSession.selectList("board.getBoardTitle");
	}
	
	//게시판의 데이터
	@Override
	public Board getBoardData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardData", boardNo);
	}
	
	//게시판의 모든 데이터
	@Override
	public Board getBoardAllData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardAllData", boardNo);
	}
	
	//회원의 데이터
	@Override
	public Member getMemberData(int memberNo) throws Exception {
		return sqlSession.selectOne("board.getMemberData", memberNo);
	}
	
	//게시판 선택 산제
	@Override
	public void deleteChoiceBoard(int boardNo) throws Exception {
		sqlSession.delete("board.deleteChoiceBoard", boardNo);
	}
	
	//게시판 수정 (게시판, 권한, 옵션) 시작 //////////////////////////////
	@Override
	public int updateBoard(Board board) throws Exception {
		return sqlSession.update("board.updateBoard", board);
	}

	@Override
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception {
		return sqlSession.update("board.updateAuthority", boardAuthority);
	}

	@Override
	public int updateOption(BoardOption boardOption) throws Exception {
		return sqlSession.update("board.updateOption", boardOption);
	}
	//게시판 수정 (게시판, 권한, 옵션) 종료 //////////////////////////////
	
	//게시글의 수
	@Override
	public int getTotalCount2(Map<String, Object> map) {
		return sqlSession.selectOne("board.getTotalCount2", map);
	}


	




	








}





