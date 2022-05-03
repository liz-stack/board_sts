package com.liz.workspace.domain;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class fileVO {
        private Long fileId;
        private String originFileName;
        private String modifyFileName;
        private String originFilePath;
        private int fileSize;
        private Long boardId;
}
