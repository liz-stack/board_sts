package com.liz.workspace.handler;

import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
//@ControllerAdvice("com.liz.workspace.controller")
//@RestController
public class ExceptionHandler {

  /*  @ExceptionHandler(value =NullPointerException.class)
    public Map<String, String> handleException(Exception e) {
        log.info(e.toString());
        Map<String, String> map = new HashMap<>();
        map.put("errMsg", e.getMessage());
        return map;
    }
*/
}
