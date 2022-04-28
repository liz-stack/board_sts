package com.liz.workspace.domain;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@Setter
@Getter
public class FileVO {
        private int fileNo;
        private String originFileName;
        private String uploadFileName;
        private String originFilePath;
        private String uploadFilePath;
        private int boardNo;
}
