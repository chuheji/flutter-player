/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-24 10:50:40
 * @LastEditTime: 2022-07-05 11:41:19
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/controller/song_controller.dart
 * @Description: 文件描述
 */
import 'package:app/api/searchApi.dart';
import 'package:get/get.dart';

class SongController extends GetxController {
  bool isLoading;
  List songList = [];
  int offset = -15;
  String searchVal = '';

  SongController(this.isLoading, this.songList, this.offset);

  Future<void> getSongList() async {
    offset += 15;
    final data = await SearchApi.searchByKeyword({'keywords': searchVal, 'type': 1, 'limit': 15, 'offset': offset});
    print(data['result']['songs']);
    for (var item in (data['result']['songs'] as List<dynamic>)) {
      songList.add(item);
    }
    isLoading = false;
    update();
  }

  void setLoadingTrue() {
    isLoading = true;
    update();
  }

  void setSearchVal(data) {
    if (searchVal != data) {
      songList = [];
    }
    searchVal = data;
    update();
  }
}
