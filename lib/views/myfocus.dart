/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-16 14:21:18
 * @LastEditTime: 2022-06-16 14:25:37
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/Myfocus.dart
 * @Description: 文件描述
 */
import "package:flutter/material.dart";

class Myfocus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyfocusWidgetState();
  }
}

class MyfocusWidgetState extends State<Myfocus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('关注'),
      ),
    );
  }
}
