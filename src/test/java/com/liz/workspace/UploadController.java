package com.liz.workspace;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public class UploadController {
    Logger log = (Logger) LoggerFactory.getLogger(UploadController.class);

    @Autowired



    @GetMapping("/uploadForm")
    public void uploadForm() {
        log.info("upload form");
    }

    @Test
    public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

        String uploadFolder = "C:\\Intellij\\upload";

        for (MultipartFile multipartFile : uploadFile) {
            log.info("------------------------------");
            log.info("Upload File Name: " + multipartFile.getOriginalFilename());
            log.info("Upload File Size: " + multipartFile.getSize());

            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            }
        }
    }
}
