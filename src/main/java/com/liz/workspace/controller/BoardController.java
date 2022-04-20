package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardServiceImpl boardServiceImpl;

    //전체 게시글 조회
    @GetMapping("/list")
    public String getBoardList(Model model, Criteria cri) {
/*
        ModelAndView mv = new ModelAndView("/board/list"); //view 설정
        List<BoardVO> boardList = boardServiceImpl.getBoardList(); //게시판 목록 조회
        int boardCount = boardServiceImpl.boardCount(); //총 게시글수
         mv.addObject("boardList", boardList);
        mv.addObject("boardCount", boardCount);
*/

        List<BoardVO> boardList = boardServiceImpl.getBoardsByCri(cri);

        int totalCount = boardServiceImpl.getBoardCount(cri);

        PageDTO pageDTO = new PageDTO(cri, totalCount);

        model.addAttribute("boardCount", totalCount);
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageMaker", pageDTO);
        return "/board/list";
    }


    @GetMapping("/write")
    public String writeForm(){
        return "board/write";
    }

    @PostMapping("/write")
    public String writeBoard(BoardVO boardVO){
        boardServiceImpl.writeBoard(boardVO);
        return "redirect:/board/list";//TODO: 220420 list->view 페이지로
    }


    //TODO: 220419 조회수 증가 로직

}

