package com.liz.workspace.domain;

import lombok.Data;
/*TODO: 220420 unversioned file로 설정된것 해제하기*/
@Data
public class PageDTO {
    private int startPage; //페이지 블럭 안에서의 시작 페이지
    private int endPage; //페이지 블럭 안에서의 끝페이지
    private boolean prev;
    private boolean next; //이전, 다음 페이지 유무

    private final int PAGE_BLOCK = 10; // 페이지네이션 개수

    private int totalCount; //전체 글 개수
    private Criteria cri; //요청 페이지 번호, 한 페이지당 글 개수

    public PageDTO(Criteria cri, int totalCount) {
        this.cri = cri;
        this.totalCount = totalCount;

        //getPageNo = 3 일때, 10으로 실수 나눗셈 -> 1 * 10 = endPage 10
        endPage = (int) (Math.ceil((double) cri.getPageNo() / PAGE_BLOCK)) * PAGE_BLOCK; //마지막 페이지
        startPage = endPage - (PAGE_BLOCK -1); //시작 페이지


        //실제 끝 페이지가 PAGE_AMOUNT 만큼 딱 안떨어질 때
        int realEnd = (int) Math.ceil((double) totalCount / cri.getPageAmount());

        if (realEnd < endPage) {
            endPage = realEnd;
        }

        //이전, 다음 버튼 부를지 결정
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }


}
