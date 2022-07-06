/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 16:55:10
 * @LastEditTime: 2022-07-05 11:09:41
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/http/http.dart
 * @Description: 文件描述
 */
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///加载动画
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Request {
  // 配置 Dio 实例
  static BaseOptions _options = BaseOptions(
    ///Api地址
    baseUrl: 'http://test.liuyouxiang.site',

    ///打开超时时间
    connectTimeout: 50000,

    ///接收超时时间
    receiveTimeout: 30000,
  );

  // 创建 Dio 实例
  static Dio _dio = Dio(_options);

  // _request 是核心函数，所有的请求都会走这里
  static Future<T> _request<T>(String path, {String? method, data}) async {
    // restful 请求处理
    // if (params != null) {
    //   params.forEach((key, value) {
    //     if (path.indexOf(key) != -1) {
    //       path = path.replaceAll(":$key", value.toString());
    //     }
    //   });
    // }
    try {
      /// 这里对加载弹窗进行重新定义，当然你也可以使用自己的方法
      EasyLoading.instance
        ..loadingStyle = EasyLoadingStyle.custom

        ///背景颜色
        ..backgroundColor = Color(0xfff4f7fb)

        ///进度颜色
        ..indicatorColor = Color(0xff0082CD)
        ..textColor = Color(0xff0082CD)
        ..textStyle = TextStyle(fontSize: 12)
        ..indicatorType = EasyLoadingIndicatorType.wave;

      ///执行加载动画
      EasyLoading.show();

      Response response;

      if (method == 'get') {
        response = await _dio.request(path,
            queryParameters: data,
            options: Options(
              method: method,
              contentType: Headers.formUrlEncodedContentType,
            ));
      } else {
        response = await _dio.request(path,
            data: data,
            options: Options(
              method: method,
              contentType: Headers.formUrlEncodedContentType,
            ));
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        ///如果请求到，则关闭弹窗动画
        EasyLoading.dismiss();

        /// 格式化接收到的数据
        dynamic data = response.data;
        try {
          // return data;
          /// 如果状态吗不等于0，说明错误，则进行提示
          if (data['code'] != 200) {
            EasyLoading.showInfo("提示: ${data['msg']}");
            return Future.error(data['msg']);
          } else if (data['code'] == 404) {
            /// 如果状态丢失了，将用户token数据清空，让引导页可以直接登录
            EasyLoading.showError("当前数据状态丢失，请重新登录");

            /// 这里写你的重新登录逻辑

            return Future.error(data['msg']);
          } else {
            ///其他状态说明正常
            return data;
          }
        } catch (e) {
          return Future.error('解析响应数据异常2');
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showInfo('错误码为${response.statusCode}');
        _handleHttpError(response.statusCode);
        return Future.error('HTTP错误');
      }
    } on DioError catch (e) {
      EasyLoading.showInfo(_dioError(e));
      return Future.error(_dioError(e));
    } catch (e) {
      print(e);
      return Future.error('未知异常');
    }
  }

  // 处理 Dio 异常
  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.receiveTimeout:
        return "服务器异常，请稍后重试！";
      case DioErrorType.sendTimeout:
        return "网络连接超时，请检查网络设置";
      case DioErrorType.response:
        return "服务器异常，请稍后重试！";
      case DioErrorType.cancel:
        return "请求已被取消，请重新请求";
      case DioErrorType.other:
        return "网络异常，请稍后重试！";
      default:
        return "Dio异常";
    }
  }

  // 处理 Http 错误码
  static void _handleHttpError(int? errorCode) {
    String message;
    switch (errorCode) {
      case 400:
        message = '请求语法错误';
        break;
      case 401:
        message = '未授权，请登录';
        break;
      case 403:
        message = '拒绝访问';
        break;
      case 404:
        message = '请求出错';
        break;
      case 408:
        message = '请求超时';
        break;
      case 500:
        message = '服务器异常';
        break;
      case 501:
        message = '服务未实现';
        break;
      case 502:
        message = '网关错误';
        break;
      case 503:
        message = '服务不可用';
        break;
      case 504:
        message = '网关超时';
        break;
      case 505:
        message = 'HTTP版本不受支持';
        break;
      default:
        message = '请求失败，错误码：$errorCode';
    }
    EasyLoading.showError(message);
  }

  static Future<T> get<T>(String path, params) {
    return _request(path, method: 'get', data: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, method: 'post', data: data);
  }
}
