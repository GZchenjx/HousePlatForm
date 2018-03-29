<%--
  Created by IntelliJ IDEA.
  User: CMY
  Date: 2017/8/30
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%><!DOCTYPE html>
<html>
<head>
    <title>经销商基本信息</title>
    <link type="text/css" rel="stylesheet" href="<%=path %>/public/css/bootstrap.min.css">

    <link type="text/css" rel="stylesheet" href="<%=path%>/public/lightbox2-master/css/lightbox.css" />
    <link href="<%=path%>/public/css/bootstrap-fileinput.css" rel="stylesheet">
    <script src="<%=path%>/public/angular/angular.min.js"></script>
    <style type="text/css" >
        .error{
            color:red;
        }
    </style>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
<input type="hidden" id="path" value="<%=path%>">
<form class="form-horizontal" id="register-form" enctype='multipart/form-data'>
    <div class="form-group" style="margin-top: 20px;">
        <label class="col-sm-2 control-label">楼盘封面：</label>
        <div class="fileinput fileinput-new col-sm-7" data-provides="fileinput"  id="exampleInputUpload">
            <div class="fileinput-new thumbnail" style="width: 500px;height: auto;max-height:500px;">
                <img id='picImg' style="width: 100%;height: auto;max-height: 500px;" src="<%=path%>/public/img/noimage.png" alt="" />
            </div>
            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 500px; max-height: 500px;"></div>
            <div >
                <span class="btn btn-primary btn-file ">
                    <span class="fileinput-new  ">选择文件</span>
                    <span class="fileinput-exists ">换一张</span>
                    <input  class="form-control " type="file" name="upload" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
                </span>
                <a href="javascript:;" class="btn btn-warning fileinput-exists " data-dismiss="fileinput" >移除</a>
            </div>
        </div>
    </div>
    <input type="hidden" id="logo" name="buildings.logo">
    <input type="hidden" id="id" name="buildings.id">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">楼盘名称：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="name"   name="buildings.name"  >
        </div>
    </div>
    <div class="form-group" style="margin-left :3px">
        <label for="area" class="col-sm-2 control-label" >所属区域：</label>
        <div class="col-sm-7 form-inline">
            <div class="docs-methods " id="area">
                <div id="distpicker">
                    <div class="form-group">
                        <label class="sr-only" for="province">Province</label>
                        <select class="form-control" id="province" name="buildings.province"></select>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="city">City</label>
                        <select class="form-control" id="city" name="buildings.city"></select>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="district">District</label>
                        <select class="form-control" id="district" name="buildings.area"></select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="address"  name="buildings.address"   >
        </div>
    </div>
    <div class="form-group">
        <label for="leader" class="col-sm-2 control-label">占地面积：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="leader"  name="buildings.floor_area"  >
        </div>
    </div>
    <div class="form-group">
        <label for="building_area" class="col-sm-2 control-label">建筑面积：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="building_area"  name="buildings.building_area"  >
        </div>
    </div>
    <div class="form-group">
        <label for="house_type" class="col-sm-2 control-label">房源类型：</label>
        <div class="col-sm-7">
            <select class="form-control" id="house_type"  name="buildings.house_type">
                <option>普通住宅</option>
                <option>花园洋房</option>
                <option>商品房</option>
                <option>集资房</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="building_type" class="col-sm-2 control-label">房源类型：</label>
        <div class="col-sm-7">
            <select class="form-control" id="building_type"  name="buildings.building_type">
                <option>板楼</option>
                <option>塔楼</option>
                <option>板塔结合</option>
                <option>高层</option>
                <option>普通住宅</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="longitude" class="col-sm-2 control-label">经度：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="longitude"  name="buildings.longitude" >
        </div>
    </div>
    <div class="form-group">
        <label for="latitude" class="col-sm-2 control-label">纬度：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="latitude"  name="buildings.latitude"  >
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 col-sm-offset-2 "   >
            <input type="button" id="coordinate" class="btn btn-info" value="拾取坐标">
        </div>
    </div>
    <div class="form-group">
        <label for="avg_price" class="col-sm-2 control-label">楼盘均价：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="avg_price"  name="buildings.avg_price" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]"  />
        </div>
    </div>
    <div class="form-group">
        <label for="company" class="col-sm-2 control-label">开发公司：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control"  id="company"  name="buildings.company"  >
        </div>
    </div>
    <div class="form-group">
        <label for="open_date" class="col-sm-2 control-label">开盘时间：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control open_date" id="open_date"  name="buildings.open_date" style="background:rgba(0, 0, 0, 0);"  placeholder="请输入开盘日期" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="total_rooms" class="col-sm-2 control-label">总套数：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="total_rooms"  name="buildings.total_rooms" onkeyup="this.value=this.value.replace(/\D/g,'')"  />
        </div>
    </div>
    <div class="form-group">
        <label for="reception_address" class="col-sm-2 control-label">接待地址：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="reception_address"  name="buildings.reception_address"  >
        </div>
    </div>
    <div class="form-group">
        <label for="tel" class="col-sm-2 control-label">楼盘售楼电话：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="tel"   name="buildings.tel"  >
        </div>
    </div>
    <div class="form-group">
        <label for="green_ratio" class="col-sm-2 control-label">绿化率：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="green_ratio"  name="buildings.green_ratio" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]"  />
        </div>
    </div>
    <div class="form-group">
        <label for="plot_ratio" class="col-sm-2 control-label">容积率：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="plot_ratio"  name="buildings.plot_ratio" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]"  />
        </div>
    </div>
    <div class="form-group">
        <label for="property_company" class="col-sm-2 control-label">物业公司：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" id="property_company"  name="buildings.property_company"  >
        </div>
    </div>
    <div class="form-group">
        <label for="property_fee" class="col-sm-2 control-label">物业费：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="property_fee"  name="buildings.property_fee" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]"  />
        </div>
    </div>
    <div class="form-group">
        <label for="car_station" class="col-sm-2 control-label">车位数：</label>
        <div class="col-sm-7">
            <input type="text"  class="form-control" id="car_station"  name="buildings.car_station" onkeyup="this.value=this.value.replace(/\D/g,'')"  />
        </div>
    </div>
    <div class="form-group">
        <label for="traffic" class="col-sm-2 control-label">交通状况：</label>
        <div class="col-sm-7">
            <textarea  rows="5" class="form-control" id="traffic"  name="buildings.traffic"  ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="equipments" class="col-sm-2 control-label">周边配套：</label>
        <div class="col-sm-7">
            <textarea  rows="5" class="form-control" id="equipments"  name="buildings.equipments"  ></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="intro" class="col-sm-2 control-label">简介：</label>
        <div class="col-sm-7">
            <textarea  rows="5" class="form-control" id="intro"   name="buildings.intro"  ></textarea>
        </div>
    </div>

    <div class="form-group">
        <label for="created_time"  class="col-sm-2 control-label">开工时间：</label>
        <div class="col-sm-4">
            <input type="text" class="form-control created_time"  name="buildings.created_time" style="background:rgba(0, 0, 0, 0);" id="created_time" placeholder="请输入楼盘开工时间" readonly>
        </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-2 col-sm-offset-2 " id="submit" >
            <input type="button" class="btn btn-primary btn-lg btn-block"  ng-click="submit()" value="提交">
        </div>
    </div>
</form>
<div id="normalDatePicker"></div>
<div id="HiddenSomthingDatePicker"></div>
</body>
<script src="<%=path %>/public/js/jquery.min.js"></script>
<script src="<%=path %>/public/js/bootstrap.min.js"></script>
<script  src="<%=path%>/public/userRegister/jedate/jedate.js"></script>
<script src="<%=path%>/public/jquery-from/jquery-from.js"></script>
<script src="<%=path %>/public/lightbox2-master/js/lightbox.min.js"></script>
<script src="<%=path%>/public/js/bootstrap-fileinput.js"></script>
<script src="<%=path%>/public/js/three/distpicker.data.js"></script>
<script src="<%=path%>/public/js/three/distpicker.js"></script>
<script src="<%=path%>/public/js/three/main.js"></script>
<script src="<%=path%>/public/agency/js/jquery-validate.js"></script>
<script src="<%=path%>/public/validate/validate.js"></script>
<script src="<%=path %>/layer-v3.1.0/layer/layer.js"></script>
<script>
    (function($){
        //日期选择
            if($("#open_date").get(0)){
                jeDate({
                    dateCell:"#open_date",
                    format:"YYYY-MM-DD",
                    minDate:"1900-1-1",
                    maxDate:"2099-12-31 23:59:59",
                    ishmsVal:false
                });
            };
            if($("#created_time").get(0)){
                jeDate({
                    dateCell:"#created_time",
                    format:"YYYY-MM-DD",
                    minDate:"1900-1-1",
                    maxDate:"2099-12-31 23:59:59",
                    ishmsVal:false
                });
            };
        $("#open_date").trigger("click");
        $("#created_time").trigger("click");
        $("body").trigger("click");
        var app = angular.module('myApp', []);
        app.config(function ($httpProvider) {

            $httpProvider.defaults.transformRequest = function (obj) {
                var str = [];
                for (var p in obj) {
                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                }
                return str.join("&");
            };

            $httpProvider.defaults.headers.post = {
                'Content-Type': 'application/x-www-form-urlencoded'
            }

        });
        app.controller('myCtrl', function($scope,$http,$timeout) {
            var url = GetQueryString("url");
            var buildingsId = GetQueryString("buildingsId");
            $scope.buildings = "";
            var  frameindex= parent.layer.getFrameIndex(window.name);//当此页面被其他页面弹窗时，获取此页面元素
            if(buildingsId !=null&&buildingsId!='') {
                $http({
                    method: 'POST',
                    url: "<%=path%>/buildings/buildingsDetail",
                    data: {"id": buildingsId}
                }).then(function successCallback(response) {
                    $scope.buildings = response.data.buildings;
                    $("#id").val($scope.buildings.id);//楼盘名称
                    $("#name").val($scope.buildings.name);//楼盘名称
                    $("#district").val($scope.buildings.area);//所属区域
                    $("#address").val($scope.buildings.address);//地址
                    $("#floor_area").val($scope.buildings.floor_area);//占地面积
                    $("#building_area").val($scope.buildings.building_area);//建筑面积
                    $("#house_type").val($scope.buildings.house_type);//房源类型
                    $("#building_type").val($scope.buildings.building_type);//建筑类型
                    $("#longitude").val($scope.buildings.longitude);//经度
                    $("#latitude").val($scope.buildings.latitude);//纬度
                    $("#avg_price").val($scope.buildings.avg_price);//楼盘均价
                    $("#company").val($scope.buildings.company);//开发公司

                    $("#open_date").val(date($scope.buildings.open_date));//开盘时间

                    $("#total_rooms").val($scope.buildings.total_rooms);//总套数
                    $("#reception_address").val($scope.buildings.reception_address);//接待地址
                    $("#tel").val($scope.buildings.tel);//楼盘售楼电话
                    $("#green_ratio").val($scope.buildings.green_ratio);//绿化率
                    $("#plot_ratio").val($scope.buildings.plot_ratio);//容积率
                    $("#property_company").val($scope.buildings.property_company);//物业公司
                    $("#property_fee").val($scope.buildings.property_fee);//物业费
                    $("#car_station").val($scope.buildings.car_station);//车位数
                    $("#traffic").val($scope.buildings.traffic);//交通状况
                    $("#equipments").val($scope.buildings.equipments);//周边配套
                    $("#logo").val($scope.buildings.logo);//楼盘封面
                    $("#picImg").attr("src","<%=path%>/" +$scope.buildings.logo);//楼盘封面
                    $("#intro").val($scope.buildings.province);//简介
                    $("#province").val($scope.buildings.province);//省
                    $("#city").val($scope.buildings.city);//市
                }, function errorCallback(response) {

                });
            }
            function date(dates) {
                var str = dates;
                var strA = str.split(/[a-zA-Z]/);
                var d = {}

                d.year = strA[0].split('-')[0];
                d.month = strA[0].split('-')[1];
                d.day = strA[0].split('-')[2];
                d.hour = strA[1].split(':')[0];
                d.minute = strA[1].split(':')[1];
                d.second = strA[1].split(':')[2];
                d.weekday = str.match(/[a-zA-Z]/)[0];
                return d.year+"-"+d.month+"-"+d.day;
            }

            $scope.submit =  function() {
                if ($("#register-form").valid()==true) {
                    var index = layer.load(0, {shade: false});//发送请求时让页面出现加载样式
                    var addurl = '<%=path %>/buildings/addbuildings';
                    if(buildingsId !=null&&buildingsId!='') {
                        addurl =  '<%=path %>/buildings/updateBuildings';
                    }
                    $('#register-form').ajaxSubmit({
                        url: addurl,
                        type: 'POST',
                        data: $("#register-form").serialize(),
                        success: function (data) {
                            $timeout(function(){//用jquery时不会自动渲染，只能手动渲染就调用此方法,
                                if (data.result.result != "fail") {
                                    layer.close(index);//关闭加载窗口
                                    layer.alert(data.result.msg, {
                                        skin: 'layui-layer-lan' //样式类名
                                        ,closeBtn: 0
                                    }, function(){
                                        if(url !=null&&url!='') {
                                            parent.layer.close(frameindex);//此页面被其他页面iframe弹窗时，调用此方法进行关闭
                                            parent.location.href="<%=path%>/"+url;
                                        };
                                        if(buildingsId !=null&&buildingsId!='') {
                                            parent.layer.close(frameindex);//此页面被其他页面iframe弹窗时，调用此方法进行关闭
                                            parent.layer.msg(data.result.msg);
                                            parent.$('#update',parent.document).trigger('click');//添加完后让父页面局部刷新
                                        }
                                        window.location.reload();
                                    });
                                } else {
                                    layer.msg(data.result.msg);
                                }
                            },0);
                        }
                    });
                }
            };
            function GetQueryString(name) {//获取url上的值
                var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if(r!=null){
                    return  unescape(r[2]);
                }
                return null;
            }
        });
        $("#coordinate").click(function(){
            layer.ready(function(){
                layer.open({
                    type: 2,
                    title: '获取坐标',
                    maxmin: true,
                    area: ['800px', '500px'],
                    content: 'http://api.map.baidu.com/lbsapi/getpoint/index.html"',
                    cancel: function(){
                        //关闭当前窗口时就进入此方法 ?buildingsId='+$scope.buildingsPager[$scope.count].id
                    }
                });
            });
        });
    }(jQuery));
</script>
<%--<script>--%>
    <%--//表单验证--%>
    <%--$("#register-form").validate();--%>
    <%--//楼盘或楼栋的名称验证--%>
    <%--$("#name").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:50,--%>
        <%--messages:{--%>
            <%--required:'请输入名称！',--%>
            <%--maxlength:'楼盘名称不能大于{0}位！'--%>
        <%--}--%>
    <%--});--%>


    <%--//参考单价--%>
    <%--$("#unit_price").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:10,--%>
        <%--messages:{--%>
            <%--required:'请输入参考单价！',--%>
            <%--maxlength:'超出了范围！'--%>
        <%--}--%>
    <%--});--%>

    <%--//户型面积--%>
    <%--$("#area").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:10,--%>
        <%--messages:{--%>
            <%--required:'请输入户型面积！',--%>
            <%--maxlength:'没有那么大地方哦！'--%>
        <%--}--%>
    <%--});--%>

    <%--//占地面积--%>
    <%--$("#floor_area").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:12,--%>
        <%--messages:{--%>
            <%--required:'请输入楼盘占地面积！',--%>
            <%--maxlength:'没有那么大地方哦！'--%>
        <%--}--%>
    <%--});--%>

    <%--//建筑面积--%>
    <%--$("#building_area").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:16,--%>
        <%--messages:{--%>
            <%--required:'请输入建筑面积！',--%>
            <%--maxlength:'没有那么大地方哦！'--%>
        <%--}--%>
    <%--});--%>

    <%--//经度验证--%>
    <%--$("#longitude").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:10,--%>
        <%--longitude:true,--%>
        <%--messages:{--%>
            <%--required:'请输入你的位置经度！',--%>
            <%--maxlength:'你输入的经度超出了范围！',--%>
            <%--longitude:'你输入的经度是不合法的'--%>
        <%--}--%>
    <%--});--%>

    <%--//纬度验证--%>
    <%--$("#latitude").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:9,--%>
        <%--latitude:true,--%>
        <%--messages:{--%>
            <%--required:'请输入你的位置纬度！',--%>
            <%--maxlength:'你输入的纬度超出了范围！',--%>
            <%--latitude:'你输入的纬度是不合法的'--%>
        <%--}--%>
    <%--});--%>

    <%--//楼盘均价--%>
    <%--$("#avg_price").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:12,--%>
        <%--messages:{--%>
            <%--required:'请输入你楼盘均价',--%>
            <%--maxlength:'你输入数字过大！'--%>
        <%--}--%>
    <%--});--%>

    <%--//接待地址验证--%>
    <%--$("#reception_address").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:100,--%>
        <%--messages:{--%>
            <%--required:'请输入楼盘接待地址',--%>
            <%--maxlength:'输入的信息不能超过100个字符'--%>
        <%--}--%>
    <%--});--%>

    <%--//开发公司验证--%>
    <%--$("#company").rules('add',{--%>
        <%--maxlength:100,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的信息不能超过100个字符'--%>
        <%--}--%>
    <%--});--%>

    <%--//验证开盘时间--%>
    <%--$("#open_date").rules('add',{--%>
        <%--required:true,--%>
        <%--date:true,--%>
        <%--messages:{--%>
            <%--required:'请选择开盘时间，如1993-03-29！',--%>
            <%--date:'时间格式不正确'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证总层数，数字长度--%>
    <%--$("#total_floor").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:3,--%>
        <%--messages:{--%>
            <%--required:'这是必填的',--%>
            <%--maxlength:'最多只能三位数'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证电梯数--%>
    <%--$("#total_lift").rules('add',{--%>
        <%--required:true,--%>
        <%--maxlength:3,--%>
        <%--messages:{--%>
            <%--required:'这是必填的',--%>
            <%--maxlength:'最多只能三位数'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证总套数--%>
    <%--$("#total_rooms").rules('add',{--%>
        <%--maxlength:8,--%>
        <%--messages:{--%>
            <%--maxlength:'只能输入10位数'--%>
        <%--}--%>
    <%--});--%>


    <%--//验证绿化率，限制数字长度--%>
    <%--$("#green_ratio").rules('add',{--%>
        <%--maxlength:5,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的数字过长'--%>
        <%--}--%>
    <%--});--%>

    <%--//验证容积率，限制数字长度--%>
    <%--$("#plot_ratio").rules('add',{--%>
        <%--maxlength:5,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的数字过长'--%>
        <%--}--%>
    <%--});--%>

    <%--//验证物业公司名称的长度--%>
    <%--$("#property_company").rules('add',{--%>
        <%--maxlength:100,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的信息过长'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证电话号码--%>
    <%--$("#tel").rules('add',{--%>
        <%--digits:true,--%>
        <%--tel:true,--%>
        <%--messages:{--%>
            <%--digits:'请输入正确的电话号码！',--%>
            <%--tel:'请输入正确的电话号码！'--%>
        <%--}--%>
    <%--});--%>

    <%--//简介验证--%>
    <%--$("#intro").rules('add',{--%>
        <%--maxlength:498,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的信息不能超过500个字符'--%>
        <%--}--%>
    <%--});--%>

    <%--//地址验证--%>
    <%--$("#address").rules('add',{--%>
        <%--maxlength:100,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的信息不能超过100个字符'--%>
        <%--}--%>
    <%--});--%>

    <%--//验证物业费的整数长度--%>
    <%--$("#property_fee").rules('add',{--%>
        <%--maxlength:10,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的数字超出上限'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证车位数的整数长度--%>
    <%--$("#car_station").rules('add',{--%>
        <%--maxlength:8,--%>
        <%--messages:{--%>
            <%--maxlength:'输入的数字超出上限'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证交通状况输入的信息，不能超过多少--%>
    <%--$("#traffic").rules('add',{--%>
        <%--maxlength:1000,--%>
        <%--messages:{--%>
            <%--maxlength:'只能输入1000个字符'--%>
        <%--}--%>
    <%--});--%>
    <%--//验证周边配套的信息长度--%>
    <%--$("#equipments").rules('add',{--%>
        <%--maxlength:1000,--%>
        <%--messages:{--%>
            <%--maxlength:'只能输入1000个字符'--%>
        <%--}--%>
    <%--});--%>

    <%--//经度验证规则--%>
    <%--$.validator.addMethod('longitude',function(value,element){--%>
        <%--var longitude = /^(((\d|[1-9]\d|1[1-7]\d|0)\.\d{0,4})|(\d|[1-9]\d|1[1-7]\d|0{1,3})|180\.0{0,4}|180)$/;--%>
        <%--return this.optional(element)||(longitude.test(value));--%>
    <%--});--%>

    <%--//纬度验证规则--%>
    <%--$.validator.addMethod('latitude',function(value,element){--%>
        <%--var latitude = /^([0-8]?\d{1}\.\d{0,4}|90\.0{0,4}|[0-8]?\d{1}|90)$/;--%>
        <%--return this.optional(element)||(latitude.test(value));--%>
    <%--});--%>

    <%--//生日验证规则--%>
    <%--$.validator.addMethod('date',function(value,element){--%>
        <%--var date = /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/;--%>
        <%--return this.optional(element)||(date.test(value));--%>
    <%--});--%>

    <%--//电话号码验证--%>
    <%--$.validator.addMethod('tel',function (value,element) {--%>
        <%--var tel =  /^(0\d{2,3}-?)?\d{7,8}$/;--%>
        <%--return this.optional(element)||(tel.test(value));--%>
    <%--});--%>

    <%--//责任人名称验证--%>
    <%--$.validator.addMethod('zer',function(value,element){--%>
        <%--var zer = /^[\w]+$/;--%>
        <%--return this.optional(element)||(zer.test(value));--%>
    <%--});--%>


<%--</script>--%>
</html>
