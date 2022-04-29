package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.nio.file.Files;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

    private final BoardServiceImpl boardServiceImpl;

    //전체 게시글 조회
    @GetMapping("/list")
    public String getBoardList(Criteria cri, Model model) throws Exception {
        List<BoardDTO> boardList = boardServiceImpl.getBoardList(cri);
        int boardCount = boardServiceImpl.getBoardCount(cri);

        PageDTO pageMaker = new PageDTO(cri, boardCount);
        model.addAttribute("getBoardCount", boardCount);
        model.addAttribute("getBoardList", boardList);
        model.addAttribute("pageMaker", pageMaker);
        return "/board/list";
    }

    /* 글 작성 */
    @GetMapping("/write")
    public String writeForm() throws Exception {
        return "board/write";
    }

    @PostMapping("/write")
    public String writeBoard(@Valid BoardDTO boardDTO, BindingResult bindingResult, List<MultipartFile> files, RedirectAttributes rttr) {
        log.info("에러확인: " + bindingResult.hasErrors());


        if (bindingResult.hasErrors()) { //에러 존재하는지 확인하고 처리
            List<ObjectError> list = bindingResult.getAllErrors();
            //에러 리스트
            for (ObjectError e : list) {
                log.info(e.getDefaultMessage());
            }
            return "/board/list";
        }

        boardServiceImpl.writeBoard(boardDTO);
       // log.info("글번호 : " + boardDTO.getBoardNo());
       // log.info("조회수: " + boardDTO.getViewCount());
        rttr.addFlashAttribute("msg", "regSuccess"); //게시글 등록 후 임시데이터(그 순간만)를 전송
        return "redirect:/board/list";
    }


    /* 글 상세보기 */
    @RequestMapping("/view")
    public ModelAndView getBoardDetail(@RequestParam("boardNo") int boardNo) throws Exception {
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
    public String editForm(@RequestParam(value = "boardNo") int boardNo, Model model) throws Exception {
        /*ModelAndView mav = new ModelAndView();
        mav.setViewName("/board/modify");
        mav.addObject("", boardServiceImpl.getBoardDetail(boardNo));
        return mav;*/
        model.addAttribute("boardDetail", boardServiceImpl.getBoardDetail(boardNo));
        return "/board/modify";
    }

    //TODO: 220426 수정시 리턴화면 목록-> 해당글 상세보기 화면으로
    @PostMapping("/modify")
    public String editBoard(BoardDTO boardDTO, RedirectAttributes rttr) throws Exception { //c.f. @PathVariable : url에 있는 정보를 긁어오고 싶은 경우
        log.info("수정처리!" + boardDTO.getBoardNo());
        boardServiceImpl.editBoard(boardDTO);
        rttr.addFlashAttribute("msg", "modSuccess");
        int boardNo = boardDTO.getBoardNo();
        return "redirect:/board/view?boardNo=" + boardNo;
    }

    /* 글 삭제 */
    @RequestMapping("/delete")
    public String deleteBoard(@RequestParam("boardNo") int boardNo, RedirectAttributes rttr) throws Exception {
        boardServiceImpl.deleteBoard(boardNo);
        rttr.addFlashAttribute("msg", "delSuccess");
        return "redirect:/board/list";
    }

    /* 예외처리*/
    /*@ExceptionHandler({NullPointerException.class, SQLException.class, IOException.class})
    public Object CustomEx(Exception e) {
        log.error(e.getMessage());
        return "board/list";
    }*/

   /* @ExceptionHandler({})
    public Object sqlEx(SQLException e) {
        log.error(e.getMessage());
        return "board/list";
    }
    @ExceptionHandler({IOException.class})
    public Object ioEx(IOException e) {
        log.error(e.getMessage());
        return "board/list";
    }*/

}

