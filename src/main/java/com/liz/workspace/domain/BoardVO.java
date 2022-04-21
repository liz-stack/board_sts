package com.liz.workspace.domain;


import lombok.*;

import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
public class BoardVO {
    private int boardNo;
    private String category;
    private String userName;
    private int userNo;
    private String password;
    private String title;
    private String content;
    private Date createDate;
    private Date modifyDate;
    private int viewCount;

    private List<FileVO> fileList;
}
