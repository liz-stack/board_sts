package com.liz.workspace.mapper;

import com.liz.workspace.domain.FileVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FileMapper {

    int insertFile(List<FileVO> fileList);
    FileVO selectFile(int boardNo);
    int deleteFile(int boardNo);

    //List<FileVO> selectFileList(int boardNo);

    //int FileTotalCount(int boardNo);


}
