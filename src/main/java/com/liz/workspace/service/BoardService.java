package com.liz.workspace.service;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface BoardService {

    /* 글 목록 */
    int getBoardCount(Criteria cri);
    List<BoardDTO> getBoardList(Criteria cri);

    /* 글 작성 */
    void writeBoard(BoardDTO boardDTO);
    void writeBoard(BoardDTO boardDTO, MultipartFile[] files);

    /* 글 상세보기 */
    BoardDTO getBoardDetail(int boardNo);
    int updateViewCount(int boardNo);

    /* 글 수정 */
    void editBoard(BoardDTO boardDTO);

    /* 글 삭제 */
    void deleteBoard(int boardNo);

}
