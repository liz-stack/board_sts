package com.liz.workspace.service;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;

import java.util.List;

public interface BoardService {

    /*글 목록*/
    int getBoardCount(Criteria cri);

    List<BoardVO> getBoardList();

    List<BoardVO> getBoardsByCri(Criteria cri);

    /*글 작성*/
    void writeBoard(BoardVO boardVO);
    String getBoardDetail(int boardNo);

}
