package com.liz.workspace.controller.api;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.Charset;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/api/board")
public class BoardApiController {

    @Autowired
    BoardService boardService;

    /**
     * 상세조회
     *
     * @param boardId
     * @return
     */
    @GetMapping(value = "/{boardId}")
    public ResponseEntity<BoardDTO> getBoardDetail(@PathVariable Long boardId) {
        BoardDTO boardDTO = new BoardDTO();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        boardDTO.setBoardId(boardId);
        log.info("boardDTO: "+boardDTO);
        return new ResponseEntity<BoardDTO>(boardDTO, headers, HttpStatus.OK);
    }


    @GetMapping
    public ResponseEntity<List<BoardDTO>> getBoardList(){
        return null;
    }

}

