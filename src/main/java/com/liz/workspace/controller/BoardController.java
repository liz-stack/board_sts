package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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
    //TODO: 220420 redirect하면 제목, 작성자, 내용 null _ redirectAttributes 사용해보기
    @GetMapping("/write")
    public String writeForm() {
        return "board/write";
    }

    @PostMapping("/write")
    public String writeBoard(BoardVO boardVO) {
        return "/board/view";
    }


    /* 글 상세보기 */
    @GetMapping("/view")
    public ModelAndView getBoardDetail(@RequestParam(value = "boardNo", defaultValue = "") int boardNo) {
        //TODO : 220419 조회수 update 작동 안됨
        boardServiceImpl.boardHit(boardNo);
        ModelAndView mav = new ModelAndView();
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

    /*TODO: 저장 누르면 boardNo=0으로 넘어감*/
    @PostMapping("/modify")
    public String editBoard(@ModelAttribute BoardVO boardVO) {
        boardServiceImpl.editBoard(boardVO);
        System.out.println(boardVO.getBoardNo());
        return "/board/view";
    }
}

