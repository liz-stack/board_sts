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
        return boardMapper.getBoardCount(cri);
    }

    //페이징 출력
    @Override
    public List<BoardVO> getBoardList(Criteria cri) {
        int startRow = (cri.getPageNo() - 1) * cri.getPageAmount();
        cri.setStartRow(startRow);
        return boardMapper.getBoardList(cri);
    }

    /* 글 작성 */
    @Override
    public void writeBoard(BoardVO boardVO) {
        System.out.println("boardVO:"+boardVO);
        boardMapper.writeBoard(boardVO);
    }

    /*글 상세보기*/
    @Override
    public BoardVO getBoardDetail(int boardNo) {
        return boardMapper.getBoardDetail(boardNo);
    }

    @Override
    public int updateViewCount(int boardNo) {    //조회수 증가
        return boardMapper.updateViewCount(boardNo);
    }

    /* 글 수정 */
    @Override
    public void editBoard(BoardVO boardVO) {
        boardMapper.editBoard(boardVO);
    }

    @Override
    public void deleteBoard(int boardNo) {
        boardMapper.deleteBoard(boardNo);
    }
}
