/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 13:52:48
 * @LastEditTime: 2022-06-27 15:23:45
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/model/current_song_model.dart
 * @Description: 文件描述
 */
import 'package:flutter/material.dart';

class CurrentSongModel with ChangeNotifier {
  dynamic currentSong;

  CurrentSongModel(this.currentSong);

  void editCurrentSong(data) {
    print('1234567');
    print(data);
    currentSong = data;
    notifyListeners();
  }
}
