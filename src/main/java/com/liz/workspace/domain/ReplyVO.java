package com.liz.workspace.domain;


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
    private Long replyId;
    private String replyContent;
    private Date replyDate;
    private Long boardId;
}
