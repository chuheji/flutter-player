/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-16 14:21:10
 * @LastEditTime: 2022-06-16 14:26:43
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/my.dart
 * @Description: 文件描述
 */
import "package:flutter/material.dart";

class My extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('我的'),
      ),
    );
  }
}
