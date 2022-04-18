package com.liz.workspace.controller;

import com.liz.workspace.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/hello")
    public String hello() {
        return "index";
    }

    @GetMapping("/test")
    public String test(Model model) {
        model.addAttribute("count", boardService.boardCount());
        model.addAttribute("getBoardList", boardService.getBoardList());
        return "board/list";
    }


}
