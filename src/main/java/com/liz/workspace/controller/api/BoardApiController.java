package com.liz.workspace.controller.api;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.Charset;
import java.util.List;

@Slf4j
@RequestMapping("/api")
@RestController
public class BoardApiController {

    @Autowired
    BoardService boardService;

    // api테스트
    @GetMapping("test")
    public String test(){
        return "Test RestAPI Get 연결";
    }


    /**
     *  게시글 목록
     * @param cri
     * @return
     */
    @GetMapping(value = "/board", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<BoardDTO>> getBoardList(Criteria cri) {
        List<BoardDTO> boardList = boardService.getBoardList(cri);
        if (boardList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(boardList, HttpStatus.OK);
    }

    /**
     * 상세조회
     * @param boardId
     * @return
     */
    @GetMapping(value = "/board/{boardId}")
    public ResponseEntity<BoardDTO> getBoardDetail(@PathVariable Long boardId) {

        //TODO: 해당 글의 id가 있는지 조회

        //TODO: 해당 글의 조회수 증가

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        //boardDTO.setBoardId(boardId);
        //log.info("boardDTO: "+boardDTO);

        BoardDTO boardDetail = boardService.getBoardDetail(boardId);
        log.info("boardDetail: " + boardDetail);
        return new ResponseEntity<BoardDTO>(boardDetail, headers, HttpStatus.OK);
    }

    /**
     * 글 작성
     * @param boardDTO
     * @return
     */
    @PostMapping(value = "/board/write")
    public ResponseEntity<String> writeBoard(@RequestBody BoardDTO boardDTO){
        ResponseEntity<String> entity = null;
        try{
            boardService.writeBoard(boardDTO);
            entity = new ResponseEntity<>("write 성공",HttpStatus.CREATED);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * 글 수정
     * @param boardId
     * @param boardDTO
     * @return
     */
    @PutMapping(value = "/board/modify/{boardId}")
    public ResponseEntity<String> updateBoard(@PathVariable("BoardId") Long boardId, @RequestBody BoardDTO boardDTO ){
        ResponseEntity<String> entity = null;
        try{
            boardDTO.setBoardId(boardId);
            log.info("글번호: " +boardId);
            boardService.editBoard(boardDTO);
            entity = new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    @DeleteMapping("/board/{boardId}")
    public ResponseEntity<String> deleteBoard(@PathVariable("boardId") Long boardId){
        ResponseEntity<String> entity = null;
        try {
            boardService.deleteBoard(boardId);
            entity = new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

}

