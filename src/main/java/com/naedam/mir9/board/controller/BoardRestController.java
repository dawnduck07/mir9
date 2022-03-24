package com.naedam.mir9.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.board.model.service.BoardService;
import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.member.model.vo.Member;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value="json/listBoard")
	public List<Board> listBoard() throws Exception{
		
		System.out.println("/json/listBoard 시작");
		
		return boardService.getBoardTitle();
	}
	
	@GetMapping(value="json/getBoardAllData/{boardNo}")
	public Board getBoardAllData(@PathVariable("boardNo") int boardNo, Model model) throws Exception{
		
		System.out.println("getBoardAllData 시작");
		
		System.out.println("데이터 확인 ::: "+boardService.getBoardAllData(boardNo));
		
		return boardService.getBoardAllData(boardNo);
	}
	
	@GetMapping(value="json/getMemberData")
	public Member getMemberData() throws Exception{
		
		System.out.println("getMemberData 시작");
		
		
		//아이디 값이 없기 때문에 일단 memberNo 2번으로
		return boardService.getMemberData(2);
	}
	
}
