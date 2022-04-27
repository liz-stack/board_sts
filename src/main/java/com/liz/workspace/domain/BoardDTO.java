package com.liz.workspace.domain;


import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Data
public class BoardDTO {

    private int boardNo;

    @NotBlank(message = "카테고리를 입력해주세요.")
    private String category;

    @NotBlank(message = "이름을 입력해주세요.")
    //@Pattern(regexp = "(^[가-힣]){2,4}", message = "이름은 2~4글자 한글로 입력해야합니다.")
    private String userName;

    @NotBlank(message = "패스워드를 입력해주세요.")
    //@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+|<>?:{}]).{4,16}", message = "비밀번호는 영문,숫자, 특수문자 포함 4~16자리로 입력해야합니다")
    private String password;

    //@Length(min = 4, max = 99, message = "제목은 4글자 이상 100자 미만이어야합니다.")
    private String title;

    @Length(min = 4, max = 1999, message = "내용은 4글자 이상 2000자 미만이어야합니다.")
    private String content;

    private Date createDate;
    private Date modifyDate;
    private int viewCount;

    //private List<FileVO> fileList;
}
