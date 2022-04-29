package com.liz.workspace.mapper;

import com.liz.workspace.domain.FileVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface FileMapper {

    int insertFile(List<FileVO> fileList);
    FileVO selectFile(int fileNo);
    List<FileVO> selectFileList(int boardNo);
    int deleteFile(int boardNo);

    //List<FileVO> selectFileList(int boardNo);

    //int FileTotalCount(int boardNo);


}
