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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.*;

@Controller
@RequestMapping
@Scope("prototype")
public class IndexController {
    public static final String GLOBAL_REQUEST_URL = "globalRequestUrl";
    public static final String GLOBAL_OPEN_API_URL = "globalOpenApiUrl";
    public static final String GLOBAL_APP_KEY = "globalOpenAppKey";
    public static final String GLOBAL_APP_SECRET = "globalOpenAppSecret";

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
        String url = tokenModel.getRequestUrl() + "/token/getToken";
        Date currentDate = new Date();
        tokenModel.setCurrentTime(currentDate.getTime());
        tokenModel.setSignMsg(getMD5((tokenModel.getAppKey() + tokenModel.getCurrentTime()
                + tokenModel.getAppSecret())));
        modelMap.putAll(new BeanMap(tokenModel));
        encapsulationTokenToModelMap(modelMap, url);
        return "openApi";
    }

    @RequestMapping("/openApi2")
    public String openApi2(HttpServletRequest request, ModelMap modelMap) {
        openApi(request, modelMap);
        return "openApi2";
    }

    @RequestMapping("/openApi2Tools")
    public String openApi2Tools(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        openApi2(request, modelMap);
        return "openApi2Tools";
    }

    @RequestMapping("/openApi2Document")
    public String openApi2Document(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        modelMap.put("requestUrl", tokenModel.getRequestUrl());
        return "openApi2Document";
    }

    @RequestMapping("/qiniuUpload")
    public String qiniuUpload(HttpServletRequest request, ModelMap modelMap) {
        openApi(request, modelMap);
        String url = tokenModel.getRequestUrl() + "/" + tokenModel.getOpenApiUrl();
//        String url = tokenModel.getRequestUrl() + "/" + tokenModel.getRoute() + "/" + tokenModel.getAddr()
//                + "/" + tokenModel.getVer() + "/" + tokenModel.getMethod();
        tokenModel.setToken((String) modelMap.get("accessToken"));
        String params = tokenModel.getParams();
        if (StringUtils.hasText(params)) {
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                modelMap.putAll(objectMapper.readValue(params, Map.class));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        modelMap.putAll(new BeanMap(tokenModel));
        encapsulationTokenToModelMap(modelMap, url);
        return "qiniuUpload";
    }

    @RequestMapping("/qiniuUploadTools")
    public String qiniuUploadTools(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        qiniuUpload(request, modelMap);
        return "qiniuUploadTools";
    }

    @RequestMapping("/qiniuUploadDocument")
    public String qiniuUploadDocument(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        modelMap.put("requestUrl", tokenModel.getRequestUrl());
        return "qiniuUploadDocument";
    }

    @RequestMapping("/getToken")
    public String getToken(HttpServletRequest request, ModelMap modelMap) {
        modelMap.putAll(new BeanMap(tokenModel));
        return "getToken";
    }

    @RequestMapping("/getTokenTools")
    public String getTokenTools(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        getToken(request, modelMap);
        return "getTokenTools";
    }

    @RequestMapping("/getTokenDocument")
    public String getTokenDocument(HttpServletRequest request, ModelMap modelMap) {
        globalSetting(request);
        modelMap.put("requestUrl", tokenModel.getRequestUrl());
        return "getTokenDocument";
    }

    /**
     * 对字符串md5加密
     *
     * @param str
     * @return
     */
    public static String getMD5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return str;
    }

    /**
     * 封装token
     *
     * @param modelMap
     * @param url
     */
    private void encapsulationTokenToModelMap(ModelMap modelMap, String url) {

        HttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(url);
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();

        Set<String> keySet = modelMap.keySet();
        for (String key : keySet) {
            if (!StringUtils.hasText(key) || modelMap.get(key) == null) {
                continue;
            }

            nvps.add(new BasicNameValuePair(key, modelMap.get(key).toString()));
        }

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpResponse httpResponse = null;
        try {
            httpResponse = httpClient.execute(httpPost);
        } catch (Exception e) {
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
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * @param request
     */
    private void globalSetting(HttpServletRequest request) {
        String globalRequestUrl = (String) request.getParameter(GLOBAL_REQUEST_URL);
        if (org.apache.commons.lang3.StringUtils.isNotBlank(globalRequestUrl)) {
            tokenModel.setRequestUrl(globalRequestUrl);
        }

        String globalAppKey = request.getParameter(GLOBAL_APP_KEY);
        if (org.apache.commons.lang3.StringUtils.isNotBlank(globalAppKey)) {
            tokenModel.setAppKey(globalAppKey);
        }

        String globalAppSecret = request.getParameter(GLOBAL_APP_SECRET);
        if (org.apache.commons.lang3.StringUtils.isNotBlank(globalAppSecret)) {
            tokenModel.setAppSecret(globalAppSecret);
        }

        String globalOpenApiUrl = request.getParameter(GLOBAL_OPEN_API_URL);
        if (org.apache.commons.lang3.StringUtils.isNotBlank(globalOpenApiUrl)) {
            tokenModel.setOpenApiUrl(globalOpenApiUrl);
        }
    }

}