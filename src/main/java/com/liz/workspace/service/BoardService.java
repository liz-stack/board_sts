package com.liz.workspace.service;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;

import java.util.List;

public interface BoardService {

    /*글 목록*/
    int getBoardCount(Criteria cri);

    List<BoardDTO> getBoardList(Criteria cri);

    /*글 작성*/
    void writeBoard(BoardDTO boardDTO);

    BoardDTO getBoardDetail(int boardNo);
    int updateViewCount(int boardNo);
    void editBoard(BoardDTO boardDTO);
    void deleteBoard(int boardNo);

}
