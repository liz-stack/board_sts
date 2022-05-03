package com.liz.workspace.testingWeb;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * 스프링이 메인 configuration을 찾게 해서 스프링 어플리케이션 컨텍스트를 시작
 * 더 확실하게 하기위해 assertion 사용
 */
@SpringBootTest
class WorkspaceApplicationTests {

    @Autowired
    private HomeTestController controller;

    @Test
    void contextLoads() throws Exception{
        assertThat(controller).isNotNull();
    }

}