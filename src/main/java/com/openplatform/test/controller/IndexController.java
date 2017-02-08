package com.openplatform.test.controller;

import javax.servlet.http.HttpServletRequest;

import com.openplatform.test.model.TokenModel;
import org.apache.commons.beanutils.BeanMap;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.*;

@Controller
@RequestMapping
public class IndexController {

    @Autowired
    private TokenModel tokenModel;

    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
        return "index";
    }

    @RequestMapping("/hello")
    public String hello(HttpServletRequest request) {
        return "hello";
    }

    @RequestMapping("/openApi")
    public String openApi(HttpServletRequest request, ModelMap modelMap) {
        Date currentDate = new Date();
        tokenModel.setCurrentTime(currentDate.getTime());
        tokenModel.setSignMsg(getMD5((tokenModel.getAppKey() + tokenModel.getCurrentTime()
                + tokenModel.getAppSecret())));
        HttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(tokenModel.getRequestUrl() + "/token/getToken");
        Map<String, Object> tokenModelMap = new BeanMap(tokenModel);
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();

        Set<String> keySet = tokenModelMap.keySet();
        for (String key : keySet) {
            nvps.add(new BasicNameValuePair(key, tokenModelMap.get(key).toString()));
        }

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        HttpResponse httpResponse = null;
        try {
            httpResponse = httpClient.execute(httpPost);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String resultJsonStr = null;
        try {
            resultJsonStr = EntityUtils.toString(httpResponse.getEntity());
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> resultJsonMap = objectMapper.readValue(resultJsonStr, Map.class);
            Boolean flag = (Boolean) resultJsonMap.get("success");
            if (flag) {
                modelMap.putAll((Map<? extends String, ?>) resultJsonMap.get("data"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(tokenModelMap);
        modelMap.putAll(tokenModelMap);
        return "openApi";
    }

    @RequestMapping("/qiniuUpload")
    public String qiniuUpload(HttpServletRequest request) {
        return "qiniuUpload";
    }

    @RequestMapping("/getToken")
    public String getToken(HttpServletRequest request, ModelMap modelMap) {
        modelMap.putAll(new BeanMap(tokenModel));
        return "getToken";
    }

    /**
     * 对字符串md5加密
     *
     * @param str
     * @return
     */
    public static String getMD5(String str) {
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算md5函数
            md.update(str.getBytes());
            // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return str;
    }

}