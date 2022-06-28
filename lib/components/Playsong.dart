/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 14:31:32
 * @LastEditTime: 2022-06-27 17:26:40
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/Playsong.dart
 * @Description: 文件描述
 */
import 'package:app/api/songApi.dart';
import 'package:app/components/ReturnBtn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/model/current_song_model.dart';
import 'package:just_audio/just_audio.dart';

class Playsong extends StatefulWidget {
  final arguments;

  Playsong(this.arguments);

  @override
  State<StatefulWidget> createState() {
    return PlaysongState();
  }
}

class PlaysongState extends State<Playsong> {
  dynamic songUrl;
  void initState() {
    super.initState();
    // CurrentSongModel provider = Provider.of(context);
    getSong();
  }

  void getSong() async {
    Map<String, dynamic> params = {};
    params['id'] = widget.arguments['id'];
    print(params);
    var res = await SongApi.searchSongUrl(params);
    final player = AudioPlayer();
    final duration = await player.setUrl(res['data'][0]['url']);
    await player.play();
    setState(() {
      songUrl = res['data'][0]['url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentSongModel provider = Provider.of(context);
    return (Builder(builder: (context) {
      if (provider.currentSong.toString() != '{}') {
        return (Container(
          child: Column(
            children: [
              Row(
                children: [ReturnBtn()],
              ),
            ],
          ),
        ));
      } else {
        return (Container(
          child: Column(
            children: [
              Row(
                children: [ReturnBtn()],
              ),
              Text('加载中...')
            ],
          ),
        ));
      }
    }));
  }
}
