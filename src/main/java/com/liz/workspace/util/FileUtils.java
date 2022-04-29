package com.liz.workspace.util;

import com.liz.workspace.domain.FileVO;
import com.liz.workspace.exception.FileException;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Component
public class FileUtils {

    //경로에 넣을 날짜추가
    // fileDateFormat -> "yyyyMMdd" 형식의 String 으로 리턴
    private final String fileDateFormat = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

    //업로드 경로
    private final String originFilePath = "C:\\Intellij\\upload";
    //private final String modifyFilePath = Paths.get(originFilePath, fileDateFormat).toString();

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

        File modifyFilePath = new File(originFilePath + fileDateFormat);
        // uploadPath = "C:/Intellij/upload/2021/12/29"

        // 폴더 경로가 존재 하는지 체크
        if (modifyFilePath.exists() == false) { // 경로가 존재하지 않을때
            modifyFilePath.mkdirs();  /* Creates the directory named by this abstract pathname.
                                        Returns: true if and only if the directory was created; false otherwise */
        }

        for (MultipartFile file : files) {
            try {
                //Gets the extension of a fileName. foo.txt => txt
                final String extension = FilenameUtils.getExtension(file.getOriginalFilename());

                //서버에 저장할 파일명 (랜덤 문자열 +확장자)
                final String modifyFileName = getRandomString() + "." + extension;

                //업로드 경로에 modifyFileName과 동일한 이름을 가진 파일 생성
                File target = new File(modifyFilePath, modifyFileName);
                //Transfer the received file to the given destination file.
                file.transferTo(target);

                /* 파일 정보 저장 */
                FileVO fileVO = new FileVO();
                fileVO.setBoardNo(boardNo);
                fileVO.setOriginFileName(file.getOriginalFilename());
                fileVO.setModifyFileName(modifyFileName);

                /* 파일 정보 추가 */
                fileList.add(fileVO);

            } catch (IOException e) {
                throw new FileException("[" + file.getOriginalFilename() + "] failed to save file...");
            } catch (Exception e) {
                throw new FileException("[" + file.getOriginalFilename() + "] failed to save file...");
            }
        }//end of for

        return fileList;
    }

}

