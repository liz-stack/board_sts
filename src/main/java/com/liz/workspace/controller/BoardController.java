package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
        log.info("글번호 : " + boardVO.getBoardNo());
        log.info("조회수: " + boardVO.getViewCount());
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
    public String editForm(@RequestParam int boardNo, Model model) {
        /*ModelAndView mav = new ModelAndView();
        mav.setViewName("/board/modify");
        mav.addObject("", boardServiceImpl.getBoardDetail(boardNo));
        return mav;*/
        BoardVO boardDetail = boardServiceImpl.getBoardDetail(boardNo);
        model.addAttribute("boardDetail", boardDetail);
        return "/board/modify";
    }

    @PostMapping("/modify")
    public String editBoard(@RequestParam("boardNo") int boardNo, BoardVO boardVO) { //c.f. @PathVariable : url에 있는 정보를 긁어오고 싶은 경우
        boardServiceImpl.editBoard(boardVO);
        return "/board/list";
    }

    /* 글 삭제 */
    @PostMapping("/delete")
    public String deleteBoard(BoardVO boardVO) {
        boardServiceImpl.deleteBoard(boardVO.getBoardNo());
        return "redirect:/board/list";
    }
}

