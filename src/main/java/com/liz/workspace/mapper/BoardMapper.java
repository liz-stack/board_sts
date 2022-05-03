package com.liz.workspace.mapper;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {

    int getBoardCount(Criteria cri);
    List<BoardDTO> getBoardList(Criteria cri);
    void writeBoard(BoardDTO boardDTO);

    BoardDTO getBoardDetail(int boardId);
    int updateViewCount(int boardId);

    void editBoard(BoardDTO boardDTO);
    void deleteBoard(int boardId);

}
