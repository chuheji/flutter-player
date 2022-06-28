/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-16 14:21:25
 * @LastEditTime: 2022-06-17 09:34:21
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/yuncun.dart
 * @Description: 文件描述
 */
import "package:flutter/material.dart";

class Yuncun extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YuncunWidgetState();
  }
}

class YuncunWidgetState extends State<Yuncun> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('云村'),
      ),
    );
  }
}
