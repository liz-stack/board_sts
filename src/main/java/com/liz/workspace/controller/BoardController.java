package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardServiceImpl boardServiceImpl;

    //전체 게시글 조회
    @GetMapping("/list")
    public String getBoardList(Model model, Criteria cri) {
        List<BoardVO> boardList = boardServiceImpl.getBoardsByCri(cri);
        int totalCount = boardServiceImpl.getBoardCount(cri);
        PageDTO pageDTO = new PageDTO(cri, totalCount);
        model.addAttribute("boardCount", totalCount);
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageMaker", pageDTO);
        return "/board/list";
    }

    //글작성 화면 불러오기
    @GetMapping("/write")
    public String writeForm(){
        return "board/write";
    }

    //글 작성
    @PostMapping("/write")
    public String writeBoard(BoardVO boardVO){
        return "/board/view";
    }

    //상세보기
    @GetMapping("/view")
    public String getBoardDetail(Model model, int boardNo){
        model.addAttribute("boardDetail", boardServiceImpl.getBoardDetail(boardNo));
        return "/board/view";
    }


    //TODO: 220419 조회수 증가 로직



}

