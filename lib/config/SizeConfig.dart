/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 14:01:41
 * @LastEditTime: 2022-06-17 14:04:25
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/config/SizeConfig.dart
 * @Description: 文件描述
 */
import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;

  static late double screenWidth;

  static late double screenHeight;

  static late double blockSizeHorizontal;

  static late double blockSizeVertical;

// 初始化方法

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

// flutter系统提供的类，可以查询屏幕方向，屏幕宽、高

// 返回的宽、高，单位： dp, 宽高返回的单位是 dp 哦！！！

// 返回屏幕宽高，是随着屏幕旋转，返回值是不一样的 ！！！

    screenWidth = _mediaQueryData.size.width;

    screenHeight = _mediaQueryData.size.height;

// 屏幕宽高 ，均分 100 份

    blockSizeHorizontal = screenWidth / 100;

    blockSizeVertical = screenHeight / 100;
  }
}
