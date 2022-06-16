/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-16 14:21:00
 * @LastEditTime: 2022-06-16 14:22:34
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/podcast.dart
 * @Description: 文件描述
 */
import "package:flutter/material.dart";

class Podcast extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PodcastWidgetState();
  }
}

class PodcastWidgetState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('播客'),
      ),
    );
  }
}
