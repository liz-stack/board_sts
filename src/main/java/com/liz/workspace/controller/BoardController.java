package com.liz.workspace.controller;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    /**
     * 전체 게시글 조회
     *
     * @param cri
     * @param model
     * @return
     * @throws Exception
     */
    @GetMapping("/list")
    public String getBoardListCri(Criteria cri, Model model) throws Exception {
        List<BoardDTO> boardList = boardService.getBoardListCri(cri);
        int boardCount = boardService.getBoardCount(cri);

        PageDTO pageMaker = new PageDTO(cri, boardCount);
        model.addAttribute("getBoardCount", boardCount);
        model.addAttribute("getBoardList", boardList);
        model.addAttribute("pageMaker", pageMaker);
        return "/board/list";
    }

    /**
     * 글 작성폼
     *
     * @return
     * @throws Exception
     */
    @GetMapping("/write")
    public String writeForm() throws Exception {
        return "board/write";
    }

    /**
     * 글 작성
     *
     * @param boardId
     * @param boardDTO
     * @param model
     * @param files
     * @param bindingResult
     * @return
     */
    @PostMapping("/write")
    public String writeBoard(@Valid BoardDTO boardDTO, Model model, MultipartFile[] files, BindingResult bindingResult) {
        //@RequestParam("boardId")Long boardId 사용시 MethodArgumentTypeMismatchException ERROR
        if (bindingResult.hasErrors()) { //에러 존재하는지 확인하고 처리
            List<ObjectError> list = bindingResult.getAllErrors();
            //에러 리스트
            for (ObjectError e : list) {
                log.info(e.getDefaultMessage());
            }
            return "/board/list";
        }
        model.addAttribute(boardDTO);
        //model.addAttribute(files);
        //rttr.addFlashAttribute("msg", "regSuccess"); //게시글 등록 후 임시데이터(그 순간만)를 전송
        return "/board/list";
    }


    /* 글 상세보기 */
    @RequestMapping("/view")
    public String getBoardDetail(@RequestParam("boardId") Long boardId, Model model) throws Exception {
        //TODO: 220425 새로고침해도 조회수 올라가지 않게 수정
        boardService.updateViewCount(boardId); //boardId 넘김
       /* ModelAndView mav = new ModelAndView();
        //  mav.addObject("updateViewCount", boardServiceImpl.updateViewCount(boardId));
        //  log.error("조회수: "+ boardVO.getViewCount());
        mav.setViewName("/board/view");
        mav.addObject("boardDetail", boardServiceImpl.getBoardDetail(boardId));*/
        model.addAttribute("boardDetail", boardService.getBoardDetail(boardId));
        return "/board/view";
    }


    /* 글 수정 */
    @GetMapping("/modify")
    public String editForm(@RequestParam(value = "boardId") Long boardId, Model model) throws Exception {
        /*ModelAndView mav = new ModelAndView();
        mav.setViewName("/board/modify");
        mav.addObject("", boardServiceImpl.getBoardDetail(boardId));
        return mav;*/
        model.addAttribute("boardDetail", boardService.getBoardDetail(boardId));
        return "/board/modify";
    }

    //TODO: 220426 수정시 리턴화면 목록-> 해당글 상세보기 화면으로
    @PostMapping("/modify")
    public String editBoard(BoardDTO boardDTO, RedirectAttributes rttr) throws Exception { //c.f. @PathVariable : url에 있는 정보를 긁어오고 싶은 경우
        log.info("수정처리!" + boardDTO.getBoardId());
        boardService.editBoard(boardDTO);
        rttr.addFlashAttribute("msg", "modSuccess");
        Long boardId = boardDTO.getBoardId();
        return "redirect:/board/view?boardId=" + boardId;
    }

    /* 글 삭제 */
    @RequestMapping("/delete")
    public String deleteBoard(@RequestParam("boardId") Long boardId, RedirectAttributes rttr) throws Exception {
        boardService.deleteBoard(boardId);
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

