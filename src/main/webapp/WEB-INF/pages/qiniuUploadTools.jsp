<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head> 
    <%--<%@include file="include.inc.jsp" %>--%>
    <style>
        .ipt {
            width: 300px;
        }

        label {
            width: 130px;
            display: block;
        }

        ul li {
            list-style: none;
        }

        .ui-progressbar {
            position: relative;
        }

        .progress-label {
            position: absolute;
            left: 50%;
            top: 4px;
            font-weight: bold;
            text-shadow: 1px 1px 0 #fff;
        }

        #progressbar {
            height: 30px;
            display: none;
        }

        #dialog {
            display: none;
        }
    </style>
    <script>

        $(document).ready(function () {
            var Qiniu_UploadUrl = "http://up-z2.qiniu.com";
            var progressbar = $("#progressbar"),
                progressLabel = $(".progress-label");
            progressbar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressbar.progressbar("value") + "%");
                },
                complete: function () {
                    progressLabel.text("Complete!");
                }
            });
            $("#btn_upload").click(function () {
                //普通上传
                var Qiniu_upload = function (f, token, key) {
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', Qiniu_UploadUrl, true);
                    var formData, startDate;
                    formData = new FormData();
                    if (key !== null && key !== undefined) formData.append('key', key);
                    formData.append('token', token);
                    formData.append('file', f);
                    var taking;
                    xhr.upload.addEventListener("progress", function (evt) {
                        if (evt.lengthComputable) {
                            var nowDate = new Date().getTime();
                            taking = nowDate - startDate;
                            var x = (evt.loaded) / 1024;
                            var y = taking / 1000;
                            var uploadSpeed = (x / y);
                            var formatSpeed;
                            if (uploadSpeed > 1024) {
                                formatSpeed = (uploadSpeed / 1024).toFixed(2) + "Mb\/s";
                            } else {
                                formatSpeed = uploadSpeed.toFixed(2) + "Kb\/s";
                            }
                            var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                            progressbar.progressbar("value", percentComplete);
                            // console && console.log(percentComplete, ",", formatSpeed);
                        }
                    }, false);

                    xhr.onreadystatechange = function (response) {
                        if (xhr.readyState == 4 && xhr.status == 200 && xhr.responseText != "") {
                            var blkRet = JSON.parse(xhr.responseText);
                            console && console.log(blkRet);
                            $("#dialog").html(xhr.responseText).dialog();
                        } else if (xhr.status != 200 && xhr.responseText) {

                        }
                    };
                    startDate = new Date().getTime();
                    $("#progressbar").show();
                    xhr.send(formData);
                };
                var token = $("#token").val();
                if ($("#file")[0].files.length > 0 && token != "") {
                    Qiniu_upload($("#file")[0].files[0], token, $("#key").val());
                } else {
                    console && console.log("form input error");
                }
            })
        });
    </script>
</head>
<body>
<div style="width: 800px;">
    <h1>七牛上传示例</h1>
    <br/>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="token" class="col-sm-2 control-label">七牛upToken:</label>
            <div class="col-sm-8">
                <input id="token" name="token" class="form-control" value="${upToken}">
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="key" class="col-sm-2 control-label">key:</label>
            <div class="col-sm-8">
                <input id="key" name="key" class="form-control" value="${key}">
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <label for="file" class="col-sm-2 control-label">照片</label>
            <div class="col-sm-8">
                <input id="file" name="file" class="form-control" type="file"/>
            </div>
            <div class="col-sm-2">

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <input id="btn_upload" type="button" class="btn btn-primary" value="提交">
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <div id="progressbar">
                    <div class="progress-label"></div>
                </div>
            </div>
        </div>
    </form>
</div>
<div id="dialog" title="上传成功"></div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

</body>
</html>