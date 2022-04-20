package com.liz.workspace.mapper;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {


    List<BoardVO> getBoardList();
    List<BoardVO> getBoardsByCri(Criteria cri);
    int boardCount(Criteria cri);
    void writeBoard(BoardVO boardVO);

    // void updateViewCount(int boardNo);
}
