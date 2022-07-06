/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-24 11:14:10
 * @LastEditTime: 2022-07-06 10:50:56
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/SongItem.dart
 * @Description: 文件描述
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/current_song_controller.dart';

class SongItem extends StatefulWidget {
  final dynamic songData;
  SongItem(this.songData);
  @override
  State<StatefulWidget> createState() {
    return SongItemState();
  }
}

class SongItemState extends State<SongItem> {
  final currentSongController = Get.put(CurrentSongController({}));
  Widget artistBuildList(data) {
    List list = [];
    Widget content;
    for (var item in data) {
      list.add(item['name']);
    }
    content = Container(
        width: MediaQuery.of(context).size.width - 70,
        child: (Text(
          list.join('/'),
          overflow: TextOverflow.ellipsis,
        )));
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentSongController.editCurrentSong(widget.songData);
        Navigator.of(context).pushNamed('/playsong');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: 60,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      widget.songData['name'],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  artistBuildList(widget.songData['ar']),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  // print(widget.songData);
                },
                icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }

  void buyTicket() {}
}
