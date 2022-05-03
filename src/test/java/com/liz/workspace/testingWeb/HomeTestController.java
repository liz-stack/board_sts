package com.liz.workspace.testingWeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeTestController {

    @RequestMapping("/home")
    public @ResponseBody String greeting() {
        return "Hello, World";
    }
}
