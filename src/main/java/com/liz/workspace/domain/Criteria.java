package com.liz.workspace.domain;

import lombok.Data;

@Data
public class Criteria { //Criteria : 검색 기준, 분류 기준
    private int pageNo; //페이지 번호
    private int pageAmount; //한 페이지당 글 개수

    private int startRow; //가져올 글의 시작 행번호

    private String type = ""; //검색 유형
    private String keyword = ""; //검색어

    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNo, int pageAmount) {
        super();
        this.pageNo = pageNo;
        this.pageAmount = pageAmount;
    }
}