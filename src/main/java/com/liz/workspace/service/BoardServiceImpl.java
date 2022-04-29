package com.liz.workspace.service;

import com.liz.workspace.domain.BoardDTO;
import com.liz.workspace.domain.Criteria;
import com.liz.workspace.domain.FileVO;
import com.liz.workspace.mapper.BoardMapper;
import com.liz.workspace.mapper.FileMapper;
import com.liz.workspace.util.FileUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
@RequiredArgsConstructor //Mapper 생성자
@Transactional(readOnly = false)
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;
    private final FileMapper fileMapper;

    private final FileUtils fileUtils;
    //총 게시글수
    @Override
    public int getBoardCount(Criteria cri) {
        return boardMapper.getBoardCount(cri);
    }

    //페이징 출력
    @Override
    public List<BoardDTO> getBoardList(Criteria cri) {
        int startRow = (cri.getPageNo() - 1) * cri.getPageAmount();
        cri.setStartRow(startRow);
        return boardMapper.getBoardList(cri);
    }

    // 글 작성시 유효성 체크
   /* public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }*/

    /* 글 작성 */
    @Override
    public void writeBoard(BoardDTO boardDTO) {
        boardMapper.writeBoard(boardDTO);
    }

    @Override
    public void writeBoard(BoardDTO boardDTO, MultipartFile[] files) {
        List<FileVO> fileList = fileUtils.uploadFiles(files, boardDTO.getBoardNo() );
        fileMapper.insertFile(fileList);
    }

    /*글 상세보기*/
    @Override
    public BoardDTO getBoardDetail(int boardNo) {
        return boardMapper.getBoardDetail(boardNo);
    }
    @Override
    public int updateViewCount(int boardNo) {    //조회수 증가
        return boardMapper.updateViewCount(boardNo);
    }

    /* 글 수정 */
    @Override
    public void editBoard(BoardDTO boardDTO) {
        boardMapper.editBoard(boardDTO);
    }

    /* 글 삭제 */
    @Override
    public void deleteBoard(int boardNo) {
        boardMapper.deleteBoard(boardNo);
    }
}
