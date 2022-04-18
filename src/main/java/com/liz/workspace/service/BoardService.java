package com.liz.workspace.service;

import com.liz.workspace.mapper.BoardMapper;
import com.liz.workspace.vo.BoardVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor //Mapper 생성자
@Transactional(readOnly = true)
public class BoardService {
    private final BoardMapper boardMapper;

    public int boardCount(){
        return boardMapper.boardCount();
    }

    public List<BoardVO> getBoardList(){
        return boardMapper.getBoardList();
    }
}
