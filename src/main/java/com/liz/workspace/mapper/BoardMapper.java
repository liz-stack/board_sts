package com.liz.workspace.mapper;

import com.liz.workspace.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardMapper {
//    String getTime();

    int boardCount();

    List<BoardVO> getBoardList();
}
