package com.liz.workspace.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { //Criteria : 검색 기준, 분류 기준
    private int pageNo; //페이지 번호
    private int pageAmount; //한 페이지당 글 개수

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

    public void setPageNo(int pageNo) {
        if (pageNo <= 0) {
            this.pageNo = 1;
            return;
        }
    }

    public void setPageAmount(int pageAmount) {
        if (pageAmount <= 0 || pageAmount > 100) {
            this.pageAmount = 10;
            return;
        }
        this.pageAmount = pageAmount;
    }

    public int getPageStart() {
        return (this.pageNo - 1) * pageNo;
    }


}