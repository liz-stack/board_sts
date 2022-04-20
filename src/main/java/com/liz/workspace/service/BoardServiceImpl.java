package com.liz.workspace.service;

import com.liz.workspace.domain.BoardVO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor //Mapper 생성자
@Transactional(readOnly = false)
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    //총 게시글수
    @Override
    public int getBoardCount(Criteria cri) {
        return boardMapper.boardCount(cri);
    }

    //게시판 글목록
    @Override
    public List<BoardVO> getBoardList() {
        return boardMapper.getBoardList();
    }

    //페이징 출력
    @Override
    public List<BoardVO> getBoardsByCri(Criteria cri) {

        int startRow = (cri.getPageNo() - 1) * cri.getPageAmount();
        cri.setStartRow(startRow);
        return boardMapper.getBoardsByCri(cri);
    }

    @Override
    public void writeBoard(BoardVO boardVO) {
        boardMapper.writeBoard(boardVO);
    }

    //TODO : 220419조회수 update
    /*public int updateViewCount(int boardNo) {
        return boardMapper.updateViewCount(boardNo);
    }*/
}
