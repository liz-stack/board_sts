package com.liz.workspace.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMaker {
    private int startPage; //페이지 블럭 안에서의 시작 페이지
    private int endPage; //페이지 블럭 안에서의 끝페이지
    private boolean prev = true;
    private boolean next = true; //이전, 다음 페이지 유무

    private final int PAGE_BLOCK = 10; // 페이지네이션 개수

    private int boardCount; //전체 글 개수
    private Criteria cri; //요청 페이지 번호, 한 페이지당 글 개수


    public void setCri(Criteria cri){
        this.cri=cri;
    }

    public void setBoardCount(int boardCount) {
        this.boardCount = boardCount;
        calcData();
    }

    public void calcData(){
        endPage = (int) (Math.ceil(cri.getPageNo() / (double) PAGE_BLOCK) * PAGE_BLOCK);
        startPage = (endPage - PAGE_BLOCK) + 1;
        int tempEndPage = (int) (Math.ceil(boardCount / (double) cri.getPageAmount()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPageAmount() >= boardCount ? false : true;

    }

/*

    }
*/

}
