package com.naedam.mir9.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.board.model.service.BoardService;
import com.naedam.mir9.board.model.vo.Board;

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
	public Board getBoardAllData(@PathVariable("boardNo") int boardNo) throws Exception{
		
		System.out.println("데이터 확인 ::: "+boardService.getBoardAllData(boardNo));
		
		return boardService.getBoardAllData(boardNo);
	}
	
}
