package com.liz.workspace.mapper;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {

    int getBoardCount(Criteria cri);
    List<BoardDTO> getBoardListCri(Criteria cri);
    List<BoardDTO> getBoardList();
    void writeBoard(BoardDTO boardDTO);

    BoardDTO getBoardDetail(Long boardId);
    boolean updateViewCount(Long boardId);

    void editBoard(BoardDTO boardDTO);
    void deleteBoard(Long boardId);

}
