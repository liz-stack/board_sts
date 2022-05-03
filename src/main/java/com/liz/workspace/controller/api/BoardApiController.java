package com.liz.workspace.controller.api;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.Charset;

@RestController("/api")
public class BoardApiController {

    @Autowired
    BoardService boardService;

    /**
     *
     * @param boardId
     * @return
     */
    @GetMapping(value = "/api/board/{boardId}")
    public ResponseEntity<BoardDTO> boardDetail(@PathVariable int boardId) {
        BoardDTO boardDTO = new BoardDTO();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        boardDTO.setBoardId(boardId);
        return new ResponseEntity<BoardDTO>( boardDTO, headers, HttpStatus.OK);
    }

}

