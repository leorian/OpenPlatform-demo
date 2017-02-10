package com.openplatform.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/2/10 0010.
 */
@Controller
@RequestMapping
public class TestController {

    @RequestMapping("/menuceshi01")
    public String menuceshi01() {
        return "menuceshi01";
    }
}
