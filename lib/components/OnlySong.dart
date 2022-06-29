/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-22 16:21:17
 * @LastEditTime: 2022-06-29 13:39:00
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/OnlySong.dart
 * @Description: 文件描述
 */
import 'package:app/controller/song_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SongItem.dart';

class OnlySong extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OnlySongState();
  }
}

class OnlySongState extends State<OnlySong> {
  ScrollController scrollController = ScrollController();
  final controller = Get.put(SongController(false, [], -12));

  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      // 滑动到底部的关键判断
      if (!controller.isLoading &&
          this.scrollController.position.pixels >= this.scrollController.position.maxScrollExtent) {
        // 开始加载数据
        setState(() {
          controller.setLoadingTrue();
          controller.getSongList();
        });
      }
    });
  }

  Widget renderBottom() {
    if (controller.isLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF333333),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return (ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < controller.songList.length) {
            return SongItem(controller.songList[index]);
          } else {
            return this.renderBottom();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
        itemCount: controller.songList.length + 1));
  }
}
