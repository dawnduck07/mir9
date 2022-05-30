package com.naedam.admin.board.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.board.model.dao.BoardDao;
import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.BoardAuthority;
import com.naedam.admin.board.model.vo.BoardComment;
import com.naedam.admin.board.model.vo.BoardFile;
import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.board.model.vo.BoardTranslate;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.member.model.vo.Member;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;

	public void boardProcess(Map<String, Object> map) throws Exception {
			Board board = (Board) map.get("board");
			BoardAuthority boardAuthority = (BoardAuthority) map.get("boardAuthority");
			BoardOption boardOption = (BoardOption) map.get("boardOption");			
		if("insert".equals(map.get("mode"))) {
			boardDao.addBoard(board);
			boardAuthority.setAuthorityBoard(board);
			boardOption.setOptionBoard(board);
			boardDao.addAuthority(boardAuthority);
			boardDao.addOption(boardOption);
		}else if("update".equals(map.get("mode"))) {
			boardDao.updateBoard(board);
			boardAuthority.setAuthorityBoard(board);
			boardOption.setOptionBoard(board);
			boardDao.updateAuthority(boardAuthority);
			boardDao.updateOption(boardOption);
		}else if("delete".equals(map.get("mode"))) {
			List<String> boardArr = (List<String>) map.get("boardArr");
			for(String i : boardArr) {
				boardDao.deleteChoiceBoard(Integer.parseInt(i));
			}
		}
	}
	
	public void postProcess(Map<String, Object> map) throws Exception{
		Post post = (Post) map.get("post");
		post.setPostBoard((Board) map.get("board"));
		BoardFile boardFile = new BoardFile();
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode")) || "answer".equals(map.get("mode"))) {
			Member member = boardDao.getMemberData(Integer.parseInt(map.get("secNo").toString()));
			post.setPostMember(member);
			post.setPostMemberName(member.getLastName()+member.getFirstName());			
			MultipartFile[] postName = (MultipartFile[]) map.get("postName");
			String[] postName2 = (String[]) map.get("postName2");
			MultipartFile ThombnailName = (MultipartFile) map.get("ThombnailName");
			File file = new File(map.get("filePath")+ThombnailName.getOriginalFilename());
			if("insert".equals(map.get("mode"))) {
				post.setPostThombnail(ThombnailName.getOriginalFilename());
				ThombnailName.transferTo(file);
				boardDao.addPost(post);
			}else if("update".equals(map.get("mode"))) {
				if(ThombnailName.isEmpty() == false) {
					post.setPostThombnail(ThombnailName.getOriginalFilename());
					ThombnailName.transferTo(file);
				}else if(ThombnailName.isEmpty() == true) {
					Post postData = boardDao.getPostData(post.getPostNo());
					post.setPostThombnail(postData.getPostThombnail());
					ThombnailName.transferTo(file);
				}
				boardDao.updatePost(post);
			}else if("answer".equals(map.get("mode"))) {
				if(ThombnailName.isEmpty() == false) {
					post.setPostThombnail(ThombnailName.getOriginalFilename());
					ThombnailName.transferTo(file);
				}else if(ThombnailName.isEmpty() == true) {
					Post postData = boardDao.getPostData(post.getPostNo());
					post.setPostThombnail(postData.getPostThombnail());
					ThombnailName.transferTo(file);
				}
				Post post2 = boardDao.getPostData(post.getPostNo());
				post.setPostOrd(post2.getPostAsc());
				post.setPostLayer(post2.getPostLayer());
				boardDao.addAnswerPost(post);
			}
			if(postName.length != 0) {
				for(int i = 0; i < postName.length; i++) {
					File file2 = new File(map.get("filePath")+postName[i].getOriginalFilename());
					boardFile.setFilePost(post);
					boardFile.setFileName(postName[i].getOriginalFilename());
					postName[i].transferTo(file2);
					boardDao.addFile(boardFile);				
				}
			}else if(postName2.length != 0) {
				for(int i = 0; i < postName2.length; i++) {
					boardFile.setFilePost(post);
					boardFile.setFileName(postName2[i]);
					boardDao.addFile(boardFile);
				}
			}			
		}else if("delete".equals(map.get("mode"))) {
			List<String> postArr = (List<String>) map.get("postArr");
			for(String i : postArr) {
				boardDao.deleteChoicePost(Integer.parseInt(i));
			}
		}else if("copy".equals(map.get("mode"))) {
			List<String> postArr = (List<String>) map.get("postArr");
			for(String i : postArr) {
				Post postCopy = boardDao.getPostData(Integer.parseInt(i));
				postCopy.getPostBoard().setBoardNo((int)map.get("boardNo"));
				boardDao.addPost(postCopy);
			}
		}else if("change".equals(map.get("mode"))) {
			List<String> postArr = (List<String>) map.get("postArr");
			for(String i : postArr) {
				Post postCopy = boardDao.getPostData(Integer.parseInt(i));
				postCopy.getPostBoard().setBoardNo((int)map.get("boardNo"));
				boardDao.addPost(postCopy);
				boardDao.deleteChoicePost(Integer.parseInt(i));
			}
		}
	}
	
	@Override
	public int addComment(BoardComment boardComment) throws Exception {
		return boardDao.addComment(boardComment);
	}

	@Override
	public int addTranslate(BoardTranslate boardTranslate) throws Exception {
		return boardDao.addTranslate(boardTranslate);
	}
	
	@Override
	public int addFile(BoardFile boardFile) throws Exception {
		return boardDao.addFile(boardFile);
	}

	@Override
	public Map<String, Object> getBoardList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardDao.getBoardList(map));
		resultMap.put("totalCount", boardDao.getTotalCount(map));
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getPostList(Map<String, Object> map, int offset, int limit) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardDao.getPostList(map, offset, limit));
		resultMap.put("totalCount", boardDao.getTotalCount2(map));
				
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getPostList2(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", boardDao.getPostList2(map));
		resultMap.put("totalCount", boardDao.getTotalCount2(map));
		return resultMap;
	}
	
	@Override
	public List<BoardComment> getCommentList(int postNo) throws Exception {
		return boardDao.getCommentList(postNo);
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
	public Post getPostData(int postNo) throws Exception {
		return boardDao.getPostData(postNo);
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
	public List<BoardFile> getPostFile(int postNo) throws Exception {
		return boardDao.getPostFile(postNo);
	}
	
	@Override
	public BoardFile getFileData(int fileNo) throws Exception {
		return boardDao.getFileData(fileNo);
	}
	
	@Override
	public void deleteFile(int fileNo) throws Exception {
		boardDao.deleteFile(fileNo);
	}
	
	@Override
	public void deleteComment(int commentNo) throws Exception {
		boardDao.deleteComment(commentNo);
	}
	
	@Override
	public int postViewCount(Post post) throws Exception {
		return boardDao.postViewCount(post);
	}
	
	@Override
	public int postFileCount(Post post) throws Exception {
		return boardDao.postFileCount(post);
	}
	
	@Override
	public int updatePostReply(Post post) throws Exception {
		return boardDao.updatePostReply(post);
	}

	@Override
	public int updateThombnail(Post post) throws Exception {
		return boardDao.updateThombnail(post);
	}
	
	@Override
	public int getTotalCount3(int boardNo) throws Exception {
		return boardDao.getTotalCount3(boardNo);
	}
	
	//down순서변경
	@Override
	public void updateDownAsc(Map<String, Object> map) throws Exception {
		boardDao.updateDownAsc(map);
	}

	//up순서변경
	@Override
	public void updateUpAsc(Map<String, Object> map) throws Exception {
		boardDao.updateUpAsc(map);
	}




}
