package com.openplatform.test.controller;

import javax.servlet.http.HttpServletRequest;

import com.openplatform.test.model.TokenModel;
import org.apache.commons.beanutils.BeanMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class IndexController {

    @Autowired
    private TokenModel tokenModel;

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
    public String ceshi(HttpServletRequest request, ModelMap modelMap) {
        modelMap.putAll(new BeanMap(tokenModel));
        return "getToken";
    }

}