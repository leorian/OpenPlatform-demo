package com.openplatform.test.model;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/2/8 0008.
 */
public class TokenModel implements Serializable{
    private String requestUrl;
    private String appKey;
    private String appSecret;
    private long currrentTime;
    private String signMsg;

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

    public long getCurrrentTime() {
        return currrentTime;
    }

    public void setCurrrentTime(long currrentTime) {
        this.currrentTime = currrentTime;
    }

    public String getSignMsg() {
        return signMsg;
    }

    public void setSignMsg(String signMsg) {
        this.signMsg = signMsg;
    }

    @Override
    public String toString() {
        return "TokenModel{" +
                "requestUrl='" + requestUrl + '\'' +
                ", appKey='" + appKey + '\'' +
                ", appSecret='" + appSecret + '\'' +
                ", currrentTime=" + currrentTime +
                ", signMsg='" + signMsg + '\'' +
                '}';
    }
}
