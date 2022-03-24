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
import com.naedam.mir9.board.model.vo.Post;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("addBoard")
	public String addBoard(@ModelAttribute("board") Board board,
						   @ModelAttribute("boardAuthority") BoardAuthority boardAuthority,
						   @ModelAttribute("boardOption") BoardOption boardOption) throws Exception{
		
		System.out.println("board/addBoard 시작");
		boardService.addBoard(board);
		boardAuthority.setBoardNo(board);
		boardService.addAuthority(boardAuthority);
		boardOption.setBoardNo(board);
		boardService.addOption(boardOption);
		
		
		return "redirect:/board/listBoard";
	}
	
	@PostMapping("updateBoard")
	public String updateBoard(@ModelAttribute("board") Board board,
			   @ModelAttribute("boardAuthority") BoardAuthority boardAuthority,
			   @ModelAttribute("boardOption") BoardOption boardOption) throws Exception{
		
		System.out.println("updateBoard 시작"); 
		System.out.println("board 확인 :: "+board);
		System.out.println("boardAuthority 확인 :: "+boardAuthority);
		System.out.println("boardOption 확인 :: "+boardOption);		
		
		boardService.updateBoard(board);
		boardAuthority.setBoardNo(board);
		boardService.updateAuthority(boardAuthority);
		boardOption.setBoardNo(board);
		boardService.updateOption(boardOption);
		
		
		return "redirect:/board/listBoard";
	}
	
	
	
	
	@GetMapping("listBoard")
	public String listBoard(Board board, Model model) throws Exception {
		
		System.out.println("listBoard 시작");
		
		Map<String, Object> map = boardService.getBoardList(board);
		
		System.out.println("확인 ::: "+map);
		
		model.addAttribute("list", map.get("list"));
		
		return "board/boardList";
	}
	
	@GetMapping("postList")
	public String listPost(Board board, Model model) throws Exception {
		
		System.out.println("/listPost 시작");
		System.out.println("확인 ::: "+board);
		
		Post post = new Post();
		
		Board board2 = boardService.getBoardData(board.getBoardNo());
		Map<String, Object> map = boardService.getPostList(board.getBoardNo());
		
		System.out.println("map 확인 :: "+map);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("board", board);
		model.addAttribute("board2", board2);
		
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
























