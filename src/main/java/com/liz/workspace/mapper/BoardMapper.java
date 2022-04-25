package com.liz.workspace.mapper;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {

    int getBoardCount(Criteria cri);
    List<BoardVO> getBoardList(Criteria cri);
    void writeBoard(BoardVO boardVO);

    BoardVO getBoardDetail(int boardNo);
    int updateViewCount(int boardNo);

    void editBoard(int boardNo);

}
