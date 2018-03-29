<%--
  Created by IntelliJ IDEA.
  User: ID.LQF
  Date: 2017/8/31
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%><!DOCTYPE html>
<html>
<head>
    <title>销售记录添加页面</title>
    <link rel="stylesheet" href="<%=path %>/public/css/bootstrap.min.css">
    <link href="<%=path%>/public/admin/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <style type="text/css" >
        .error{
            color:red;
        }
    </style>
</head>
<body>
<form class="form-horizontal" id="register-form" style="margin-top: 20px;">
    <div class="form-group">
        <label for="customerName" class="col-sm-3 control-label">客户编号：</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="customerPrice.name" id="customerName" placeholder="请输入客户的编号" disabled>
            <input type="hidden" name="customerPrice.id" id="customerId">
        </div>
        <input type="button" class="btn btn-default form-inline" id="selectCustomer" value="选择客户">
    </div>
    <div class="form-group">
        <label for="birthday" class="col-sm-3 control-label">销售时间：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control form_datetime" name="sale_time" style="background:rgba(0, 0, 0, 0);" id="birthday" placeholder="请输入销售时间" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="inputIdentity3" class="col-sm-3 control-label">销售单价：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" name="unit_price" id="inputIdentity3" placeholder="请输入销售单价" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]">
        </div>
    </div>
    <div class="form-group">
        <label for="roomName" class="col-sm-3 control-label">房屋编号：</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" name="room.name" id="roomName" placeholder="请输入房屋编号" disabled>
            <input type="hidden" id="roomId" name="room.id">
        </div>
        <input type="button" class="btn btn-default form-inline" id="selectRoom" value="选择房号">
    </div>
    <div class="form-group">
        <label for="inputAddress3" class="col-sm-3 control-label">销售折扣：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" name="discount" id="inputAddress3" placeholder="请输入销售折扣"
                   onkeyup= "this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]"
                   oninput="if(value.length>5){
                                        this.value=value.slice(0,6);
                                    }else if((parseFloat(value)) > 100){
                                            this.value =100;
                                    }">
        </div>
    </div>
    <div class="form-group">
        <label for="introduce3" class="col-sm-3 control-label">销售总价：</label>
        <div class="col-sm-7">
            <input type="text" class="form-control" name="total_cost" id="introduce3" placeholder="请输入销售总价" onkeyup="this.value=(this.value.match(/^([1-9]\d*)(\.\d{0,2})?/)||[''])[0]">
        </div>
    </div>
    <label class="col-md-3"></label>
    <input class="btn btn-primary col-sm-3" id="submit" style="margin-top: 10px;margin-left: 40px;margin-bottom: 20px;" value="添加"  >
</form>
</body>
<script src="<%=path %>/public/js/jquery.min.js"></script>
<script src="<%=path %>/public/js/bootstrap.min.js"></script>
<script src="<%=path %>/public/admin/js/bootstrap-datetimepicker.js"></script>
<script src="<%=path %>/public/admin/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path %>/layer-v3.1.0/layer/layer.js"></script>
<script src="<%=path%>/public/agency/js/jquery-validate.js"></script>
<script>
    $('.form_datetime').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ii',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('#birthday').datetimepicker('setEndDate', new Date);//让时间只能选择当天时间以后的时间
    $(function(){
        $("#register-form").validate({
            rules: {
                "sale_time": {
                    required: true
                }, "unit_price": {
                    required: true,
                    maxlength:10
                }, "total_cost": {
                    required: true,
                    maxlength:10
                }
            },
            messages: {
                "sale_time": {
                    required: "请输入销售时间"
                },"unit_price": {
                    required: "请输入销售单价",
                    maxlength:"最大不能超过10位"
                },"total_cost": {
                    required: "请输入销售总价",
                    maxlength:"最大不能超过10位"
                }
            }
        });
    });

    $("#submit").click(function(){
        if ($("#register-form").valid()==true) {
            if($("#customerName").val()==null ||$("#customerName").val() =='' ||$("#customerName").val() ==undefined){
                layer.msg("请选择一个客户");
            }else if($("#roomName").val()==null ||$("#roomName").val() =='' ||$("#roomName").val() ==undefined){
                layer.msg("请选择一个客户");
            }else {
                $.post("<%=path%>/sale/addSale",$("#register-form").serialize(),
                    function (data) {
                        if (data.result.result == 'success') {
                            layer.alert(data.result.msg, {
                                skin: 'layui-layer-lan' //样式类名
                                , closeBtn: 0
                            }, function () {
                                window.location.reload();
                            });
                        } else {
                            layer.msg(data.result.msg);
                        }
                    }, 'json');
            }

        }
    });

    $("#selectCustomer").click(function(){
        layer.ready(function(){
            layer.open({
                type: 2,
                title: '请选择一个客户',
                maxmin: true,
                area: ['1000px', '600px'],
                content: 'cusCheck?select=1',
                cancel: function(){
                    //关闭当前窗口时就进入此方法
                }
            });
        });
    });
    $("#selectRoom").click(function(){
        layer.ready(function(){
            layer.open({
                type: 2,
                title: '请选择一个房号',
                maxmin: true,
                area: ['1000px', '600px'],
                content: 'homeSellChart?select=1',
                cancel: function(){
                    //关闭当前窗口时就进入此方法
                }
            });
        });
    });
</script>
</html>
