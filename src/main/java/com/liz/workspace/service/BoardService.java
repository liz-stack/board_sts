package com.liz.workspace.service;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;

import java.util.List;

public interface BoardService {

    int getBoardCount(Criteria cri);

    List<BoardVO> getBoardList();

    List<BoardVO> getBoardsByCri(Criteria cri);

    void writeBoard(BoardVO boardVO);
}
