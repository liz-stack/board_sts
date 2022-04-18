package com.liz.workspace;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.liz.workspace.mapper")
public class WorkspaceApplication {
/*
    @Autowired
    BoardMapper boardMapper;*/

    public static void main(String[] args) {
        SpringApplication.run(WorkspaceApplication.class, args);
    }

  /*  @Override
    public void run(String... args) throws Exception {
        System.out.println("Time: "+boardMapper.getTime());
    }*/


}
