package com.liz.workspace.util;

import com.liz.workspace.domain.FileVO;
import com.liz.workspace.exception.FileException;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Component
public class FileUtils {

    //경로에 넣을 날짜추가
    private final String fileDateFormat = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

    //업로드 경로
    private final String originFilePath = "C:/Intellij/upload";
    private final String uploadPath = Paths.get(originFilePath, fileDateFormat).toString();

    private final String getRandomString() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    public List<FileVO> uploadFiles(MultipartFile[] files, int boardNo) {

        /*null 이면 비어있는 리스트 반환*/
        if (files[0].getSize() < 1) {
            return Collections.emptyList();
        }

        /*업로드 파일 정보를 담을 비어있는 리스트*/
        List<FileVO> fileList = new ArrayList<>();

        /* uploadPath에 해당하는 디렉터리가 존재하지 않으면, 부모 디렉터리를 포함한 모든 디렉터리 생성*/
        File dir = new File(uploadPath);
        if (dir.exists() == false) {
            dir.mkdir(); /*Creates the directory named by this abstract pathname.
                               Returns: true if and only if the directory was created; false otherwise*/
        }

        for (MultipartFile file : files) {
            try {
                //Gets the extension of a fileName. foo.txt => txt
                final String extension = FilenameUtils.getExtension(file.getOriginalFilename());

                //서버에 저장할 파일명 (랜덤 문자열 +확장자)
                final String modifyFileName = getRandomString() + "." + extension;

                //업로드 경로에 modifyFileName과 동일한 이름을 가진 파일 생성
                File target = new File(uploadPath, modifyFileName);
                //Transfer the received file to the given destination file.
                file.transferTo(target);


                FileVO fileVO = new FileVO();
                fileVO.setBoardNo(boardNo);
                fileVO.setOriginFileName(file.getOriginalFilename());
                fileVO.setModifyFileName(file.getOriginalFilename());

                fileList.add(fileVO);
            } catch (IOException e) {
                throw new FileException("[" + file.getOriginalFilename() + "] failed to save file...");
            }
        }//end of for

        return fileList;
    }

}

