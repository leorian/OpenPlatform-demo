package com.openplatform.test.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/2/8 0008.
 */
public class TokenModel implements Serializable{
    private String requestUrl;
    private String appKey;
    private String appSecret;
    private long currentTime;
    private String signMsg;

    private String route;
    private String addr;
    private String ver;
    private String method;
    private String params;
    private String token;

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public long getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(long currentTime) {
        this.currentTime = currentTime;
    }

    public String getSignMsg() {
        return signMsg;
    }

    public void setSignMsg(String signMsg) {
        this.signMsg = signMsg;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getVer() {
        return ver;
    }

    public void setVer(String ver) {
        this.ver = ver;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "TokenModel{" +
                "requestUrl='" + requestUrl + '\'' +
                ", appKey='" + appKey + '\'' +
                ", appSecret='" + appSecret + '\'' +
                ", currentTime=" + currentTime +
                ", signMsg='" + signMsg + '\'' +
                ", route='" + route + '\'' +
                ", addr='" + addr + '\'' +
                ", ver='" + ver + '\'' +
                ", method='" + method + '\'' +
                ", params='" + params + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}
