/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-24 10:50:40
 * @LastEditTime: 2022-06-29 15:13:34
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/controller/song_controller.dart
 * @Description: 文件描述
 */
import 'package:app/api/searchApi.dart';
import 'package:get/get.dart';

class SongController extends GetxController {
  bool isLoading;
  List songList = [];
  int offset = -12;
  String searchVal = '';

  SongController(this.isLoading, this.songList, this.offset);

  Future<void> getSongList() async {
    offset += 12;
    Map<String, dynamic> params = Map();
    params['keywords'] = searchVal;
    params['type'] = 1;
    params['limit'] = 12;
    params['offset'] = offset;
    var data = await SearchApi.searchByKeyword(params);
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
