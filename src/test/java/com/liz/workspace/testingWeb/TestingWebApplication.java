package com.liz.workspace.testingWeb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Configuration,
 * @EnableAutoConfiguration(클래스 경로설정),
 * @EnableWebMvc(웹 어플리케이션으로 플래그, 클래스패스에서 보일 때 자동으로 추가?),
 * @ComponentScan 포함하는 어노테이션
 */
@SpringBootApplication
public class TestingWebApplication {
    public static void main(String[] args) {
        SpringApplication.run(TestingWebApplication.class, args);
    }
}
