package com.liz.workspace.controller.api;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.service.BoardService;
import org.apache.logging.log4j.message.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.Charset;

@RestController
public class BoardApiController {

    @Autowired
    BoardService boardService;

    @GetMapping(value = "/api/board/{boardNo}")
    public ResponseEntity<BoardDTO> boardDetail(@PathVariable int boardNo) {
        BoardDTO boardDTO = new BoardDTO();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        boardDTO.setBoardNo(boardNo);
        return new ResponseEntity<BoardDTO>( boardDTO, headers, HttpStatus.OK);
    }

}

