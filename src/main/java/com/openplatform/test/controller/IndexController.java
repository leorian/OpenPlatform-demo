package com.openplatform.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class IndexController {

    @RequestMapping("/index")
    public String list(HttpServletRequest request) {
        return "index";
    }

    @RequestMapping("/hello")
    public String hello(HttpServletRequest request) {
        return "hello";
    }

    @RequestMapping("/openApi")
    public String openapi(HttpServletRequest request) {
        return "openApi";
    }

    @RequestMapping("/qiniuUpload")
    public String upload(HttpServletRequest request) {
        return "qiniuUpload";
    }

    @RequestMapping("/getToken")
    public String ceshi(HttpServletRequest request) {
        return "getToken";
    }

}