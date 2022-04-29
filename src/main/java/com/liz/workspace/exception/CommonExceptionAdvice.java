package com.liz.workspace.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@ControllerAdvice
public class CommonExceptionAdvice {

    @ExceptionHandler(Exception.class)
    public ModelAndView commonException(Exception e){
        log.info(e.toString());
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.setViewName("/common/commonError");

        return mav;
    }
}
