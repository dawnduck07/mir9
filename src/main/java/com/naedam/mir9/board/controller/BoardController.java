package com.naedam.mir9.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.mir9.board.model.service.BoardService;
import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.board.model.vo.BoardAuthority;
import com.naedam.mir9.board.model.vo.BoardOption;
import com.naedam.mir9.board.model.vo.Page;
import com.naedam.mir9.board.model.vo.Post;
import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.member.model.vo.Member;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	int pageUnit = 5;
	int pageSize = 5;
	
	@PostMapping("addBoard")
	public String addBoard(@ModelAttribute("board") Board board,
						   @ModelAttribute("boardAuthority") BoardAuthority boardAuthority,
						   @ModelAttribute("boardOption") BoardOption boardOption) throws Exception{
		
		System.out.println("board/addBoard 시작");
		boardService.addBoard(board);
		boardAuthority.setAuthorityBoard(board);
		boardService.addAuthority(boardAuthority);
		boardOption.setOptionBoard(board);
		boardService.addOption(boardOption);
		
		
		return "redirect:/board/listBoard";
	}
	
	@PostMapping("updateBoard")
	public String updateBoard(@RequestParam("boardNo") int boardNo,
			   @ModelAttribute("board") Board board,
			   @ModelAttribute("boardAuthority") BoardAuthority boardAuthority,
			   @ModelAttribute("boardOption") BoardOption boardOption) throws Exception{
		
		System.out.println("updateBoard 시작"); 
		System.out.println("board 확인 :: "+board);
		System.out.println("boardAuthority 확인 :: "+boardAuthority);
		System.out.println("boardOption 확인 :: "+boardOption);		
		
		boardService.updateBoard(board);
		boardAuthority.setAuthorityBoard(board);
		boardService.updateAuthority(boardAuthority);
		boardOption.setOptionBoard(board);
		boardService.updateOption(boardOption);
		
		
		return "redirect:/board/listBoard";
	}
	
	
	
	
	@GetMapping("listBoard")
	public String listBoard(@ModelAttribute("search") Search search, Board board, Model model) throws Exception {
		
		System.out.println("listBoard 시작");
		
		//페이지 처리
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		Map<String, Object> map = boardService.getBoardList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "board/boardList";
	}
	
	@GetMapping("postList")
	public String listPost(Board board, Model model) throws Exception {
		
		System.out.println("/listPost 시작");
		
		Post post = new Post();
		Member member = new Member();
		
		Board board2 = boardService.getBoardData(board.getBoardNo());
		int postCount = boardService.getTotalCount2(board.getBoardNo());
		Map<String, Object> map = boardService.getPostList(board.getBoardNo());
		member = boardService.getMemberData(board2.getBoardMemberNo().getMemberNo());
		map.put("member", member);
		map.put("postCount", postCount);
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("board", board);
		model.addAttribute("board2", board2);
		model.addAttribute("member", member);
		
		return "board/postList";
	}
	
	@PostMapping("deleteChoiceBoard")
	public void deleteChoiceBoard(@RequestParam(value = "boardNo[]") List<String> boardArr, 
								  Board board) throws Exception{
		
		System.out.println("deleteChoiceBoard 시작");
		
		int result = 0;
		int boardNo = 0;
		
		for(String i : boardArr) {
			boardNo = Integer.parseInt(i);
			board.setBoardNo(boardNo);
			boardService.deleteChoiceBoard(board.getBoardNo());
		}
		result = 1;
		
	}
}
























