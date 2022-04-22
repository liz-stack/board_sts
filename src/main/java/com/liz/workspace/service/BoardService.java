package com.liz.workspace.service;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;

import java.util.List;

public interface BoardService {

    /*글 목록*/
    int getBoardCount(Criteria cri);

    List<BoardVO> getBoardList(Criteria cri);

    /*글 작성*/
    void writeBoard(BoardVO boardVO);
    BoardVO getBoardDetail(int boardNo);
    void boardHit(int boardNo);
    void editBoard(BoardVO boardVO);

}
