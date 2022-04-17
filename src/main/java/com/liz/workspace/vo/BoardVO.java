package com.liz.workspace.vo;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@NoArgsConstructor
@Setter
@Getter
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
}
