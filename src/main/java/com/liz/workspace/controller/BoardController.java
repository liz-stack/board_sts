package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardServiceImpl boardServiceImpl;

    //전체 게시글 조회
    @GetMapping("/list")
    public String getBoardList(Criteria cri, Model model) {
        List<BoardVO> boardList = boardServiceImpl.getBoardList(cri);
        int boardCount = boardServiceImpl.getBoardCount(cri);

        PageDTO pageMaker = new PageDTO(cri, boardCount);
        model.addAttribute("getBoardCount", boardCount);
        model.addAttribute("getBoardList", boardList);
        model.addAttribute("pageMaker", pageMaker);
        return "/board/list";
    }

    /* 글 작성 */
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    @PostMapping("/write")
    public String writeBoard(BoardVO boardVO) {
        boardServiceImpl.writeBoard(boardVO);
        log.info("글번호 : "+ boardVO.getBoardNo());
        log.info("조회수: "+ boardVO.getViewCount());
        return "/board/view";
    }


    /* 글 상세보기 */
    @RequestMapping("/view")
    public ModelAndView getBoardDetail(@RequestParam("boardNo") int boardNo) {
        //TODO: 220425 새로고침해도 조회수 올라가지 않게 수정
        boardServiceImpl.updateViewCount(boardNo); //boardNo 넘김
        ModelAndView mav = new ModelAndView();
        //  mav.addObject("updateViewCount", boardServiceImpl.updateViewCount(boardNo));
        //  log.error("조회수: "+ boardVO.getViewCount());
        mav.setViewName("/board/view");
        mav.addObject("boardDetail", boardServiceImpl.getBoardDetail(boardNo));
        return mav;
    }


    /* 글 수정 */
    @GetMapping("/modify")
    public ModelAndView editForm(@RequestParam int boardNo) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/board/modify");
        mav.addObject("editBoard", boardServiceImpl.getBoardDetail(boardNo));
        return mav;
    }

    @PutMapping("/modify")
    public String editBoard(@PathVariable int boardNo){
        boardServiceImpl.editBoard(boardNo);
        log.info("글번호: "+ boardNo);
        return "/board/list";
    }



}

