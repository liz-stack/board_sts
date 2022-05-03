package com.liz.workspace.mapper;

import com.liz.workspace.domain.fileVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {

    int insertFile(List<fileVO> fileList);
    fileVO selectFile(int fileId);
    List<fileVO> selectFileList(int boardId);
    int deleteFile(int boardId);

    //List<FileVO> selectFileList(int boardId);

    //int FileTotalCount(int boardId);


}
