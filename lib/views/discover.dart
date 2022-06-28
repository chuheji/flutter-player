/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-16 10:54:35
 * @LastEditTime: 2022-06-17 09:34:06
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/discover.dart
 * @Description: 文件描述
 */
import "package:flutter/material.dart";
import "package:app/components/Drawerorigin.dart";

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiscoverWidgetState();
  }
}

class DiscoverWidgetState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Drawerorigin(),
          ],
        ),
        Center(
          child: Text('发现'),
        ),
      ],
    ));
  }
}
