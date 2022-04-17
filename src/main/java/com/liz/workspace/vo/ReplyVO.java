package com.liz.workspace.vo;


import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Data
@NoArgsConstructor
@Setter
@Getter
public class ReplyVO {
    private int replyNo;
    private String replyContent;
    private Date replyDate;
}
