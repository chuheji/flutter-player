/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 13:52:48
 * @LastEditTime: 2022-06-29 13:32:46
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/controller/current_song_controller.dart
 * @Description: 文件描述
 */
import 'package:get/get_state_manager/get_state_manager.dart';

class CurrentSongController extends GetxController {
  dynamic currentSong;

  CurrentSongController(this.currentSong);

  void editCurrentSong(data) {
    currentSong = data;
    update();
  }
}
