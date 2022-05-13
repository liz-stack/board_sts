package com.liz.workspace.controller.api;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.PageDTO;
import com.liz.workspace.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequestMapping("/api")
@RestController
public class BoardApiController {

    @Autowired
    BoardService boardService;

    // api테스트
    @GetMapping("test")
    public String test() {
        return "Test RestAPI Get 연결";
    }


    /**
     * 게시글 목록
     *
     * @param
     * @return
     */
    @GetMapping(value = "/boards")
    public ResponseEntity<List<BoardDTO>> getBoardList( ) {
        List<BoardDTO> boardList = boardService.getBoardList();
        if (boardList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(boardList, HttpStatus.OK);
        /*try{
            Map<String, Object> map = new HashMap<>();
            map.put("boardList", boardService.getBoardList(cri));
            map.put("pageMaker", new PageDTO(cri, boardService.getBoardCount(cri)));
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }*/
    }

    /**
     * 상세조회
     *
     * @param boardId
     * @return
     */
    @GetMapping(value = "/boards/{boardId}")
    public ResponseEntity<BoardDTO> getBoardDetail(@PathVariable Long boardId) {
        BoardDTO boardDetail = boardService.getBoardDetail(boardId);

        if (boardDetail == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        boardService.updateViewCount(boardId);
        log.info("boardDetail: " + boardDetail, "조회수: " + boardDetail.getViewCount());
        return new ResponseEntity<BoardDTO>(boardDetail, HttpStatus.OK);
    }

    /**
     * 글 작성
     *
     * @param boardDTO
     * @return
     */
    @PostMapping(value = "/boards")
    public ResponseEntity<String> writeBoard(@RequestBody BoardDTO boardDTO) {
        ResponseEntity<String> entity = null;
        try {
            boardService.writeBoard(boardDTO);
            entity = new ResponseEntity<>("write 성공", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
}
        return entity;
                }

/**
 * 글 수정
 *
 * @param boardId
 * @param boardDTO
 * @return
 */
@PutMapping(value = "/boards/{boardId}")
public ResponseEntity<String> updateBoard(@PathVariable("BoardId") Long boardId, @RequestBody BoardDTO boardDTO) {
        ResponseEntity<String> entity = null;
        try {
            boardDTO.setBoardId(boardId);
            log.info("글번호: " + boardId);
            boardService.editBoard(boardDTO);
            entity = new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * 글 삭제
     * 
     * @param boardId
     * @return
     */
    @DeleteMapping("/boards/{boardId}")
    public ResponseEntity<String> deleteBoard(@PathVariable("boardId") Long boardId) {
        ResponseEntity<String> entity = null;
        try {
            boardService.deleteBoard(boardId);
            entity = new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}

