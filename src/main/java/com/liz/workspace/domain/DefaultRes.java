package com.liz.workspace.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class DefaultRes<T> {

        /*
        * ResponseEntity의 진짜 상태코드는 DefaultRes의 status에 넣어준다.
          모든 응답메세지에 한국말로 넣어준다.
          응답 데이터가 있다면 제네릭 타입을 이용해서 데이터에 넣어준다.
        * */
        private int statusCode;
        private String responseMessage;
        private T data;

        public DefaultRes(final int statusCode, final String responseMessage) {
                this.statusCode = statusCode;
                this.responseMessage = responseMessage;
                this.data = null;
        }

        public static<T> DefaultRes<T> res(final int statusCode, final String responseMessage) {
                return res(statusCode, responseMessage, null); //보내줄 데이터가 없다면 null로 초기화
        }

        public static<T> DefaultRes<T> res(final int statusCode, final String responseMessage, final T t) {
                return DefaultRes.<T>builder()
                        .data(t)
                        .statusCode(statusCode)
                        .responseMessage(responseMessage)
                        .build();
        }
}