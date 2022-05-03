package com.liz.workspace.service;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.fileVO;
import com.liz.workspace.mapper.BoardMapper;
import com.liz.workspace.mapper.FileMapper;
import com.liz.workspace.util.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Service
@Transactional(readOnly = false)
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private FileMapper fileMapper;

    @Autowired
    private FileUtils fileUtils;
    //총 게시글수
    @Override
    public int getBoardCount(Criteria cri) {
        return boardMapper.getBoardCount(cri);
    }

    //페이징 출력
    @Override
    public List<BoardDTO> getBoardList(Criteria cri) {
        int startRow = (cri.getPage() - 1) * cri.getPageAmount();
        cri.setStartRow(startRow);
        return boardMapper.getBoardList(cri);
    }


    /* 글 작성 */
    @Override
    public void writeBoard(BoardDTO boardDTO) {
        boardMapper.writeBoard(boardDTO);
    }

    @Override
    public void writeBoard( BoardDTO boardDTO, MultipartFile[] files) {
        List<fileVO> fileList = fileUtils.uploadFiles(files, boardDTO.getBoardId());
        log.info("boardId: "+boardDTO.getBoardId());
        fileMapper.insertFile(fileList);
    }

    /*글 상세보기*/
    @Override
    public BoardDTO getBoardDetail(Long boardId) {
        return boardMapper.getBoardDetail(boardId);
    }
    @Override
    public boolean updateViewCount(Long boardId) {    //조회수 증가
        return boardMapper.updateViewCount(boardId);
    }

    /* 글 수정 */
    @Override
    public void editBoard(BoardDTO boardDTO) {
        boardMapper.editBoard(boardDTO);
    }

    /* 글 삭제 */
    @Override
    public void deleteBoard(Long boardId) {
        boardMapper.deleteBoard(boardId);
    }
}
