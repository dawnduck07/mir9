package com.naedam.mir9.board.model.dao;

import java.util.List;

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

	@Override
	public int addBoard(Board board) throws Exception {
		return sqlSession.insert("board.addBoard", board);
	}
	
	@Override
	public int addPost(Post post) throws Exception {
		return sqlSession.insert("board.addPost", post);
	}

	@Override
	public int addAuthority(BoardAuthority boardAuthority) throws Exception {
		return sqlSession.insert("board.addAuthority", boardAuthority);
	}

	@Override
	public int addOption(BoardOption boardOption) throws Exception {
		return sqlSession.insert("board.addOption", boardOption);
	}

	@Override
	public int addTranslate(BoardTranslate boardTranslate) throws Exception {
		return sqlSession.insert("board.addTranslate", boardTranslate);
	}

	@Override
	public List<Board> getBoardList(Search search) throws Exception {
		return sqlSession.selectList("board.getBoardList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("board.getTotalCount", search);
	}
	
	@Override
	public List<Post> getPostList(int boardNo) throws Exception {
		return sqlSession.selectList("board.getPostList", boardNo);
	}	
	
	@Override
	public int getTotalCount2(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getTotalCount2",boardNo);
	}
	
	@Override
	public List<Board> getBoardTitle() {
		return sqlSession.selectList("board.getBoardTitle");
	}

	@Override
	public Board getBoardData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardData", boardNo);
	}
	
	@Override
	public Board getBoardAllData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardAllData", boardNo);
	}

	@Override
	public Member getMemberData(int memberNo) throws Exception {
		return sqlSession.selectOne("board.getMemberData", memberNo);
	}

	@Override
	public void deleteChoiceBoard(int boardNo) throws Exception {
		sqlSession.delete("board.deleteChoiceBoard", boardNo);
	}

	@Override
	public int updateBoard(Board board) throws Exception {
		System.out.println("여기는 보드임플 ::: "+board);
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




	








}





