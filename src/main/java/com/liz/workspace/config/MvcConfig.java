package com.liz.workspace.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //설정 파일을 만들기 위한 어노테이션 또는 Bean 등록을 위한 어노테이션
public class MvcConfig implements WebMvcConfigurer {

    /*@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoggerInterceptor())
                .excludePathPatterns("/css/**", "/plugin/**");
    }*/

    @Bean
    public CommonsMultipartResolver multipartResolver(){
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setDefaultEncoding("UTF-8");
        multipartResolver.setMaxUploadSize(5*1024*1024); //업로드 크기 제한(5MB)
        return multipartResolver;
    }
}
