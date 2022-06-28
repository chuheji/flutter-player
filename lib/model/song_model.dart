/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-24 10:50:40
 * @LastEditTime: 2022-06-27 14:46:12
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/model/song_model.dart
 * @Description: 文件描述
 */
import 'package:app/api/searchApi.dart';
import 'package:flutter/material.dart';

class SongModel with ChangeNotifier {
  bool isLoading;
  List songList = [];
  int offset = -10;
  String searchVal = '';

  SongModel(this.isLoading, this.songList, this.offset);

  Future<void> getSongList() async {
    offset += 10;
    Map<String, dynamic> params = Map();
    params['keywords'] = searchVal;
    params['type'] = 1;
    params['limit'] = 10;
    params['offset'] = offset;
    var data = await SearchApi.searchByKeyword(params);
    for (var item in data['result']['songs']) {
      songList.add(item);
    }
    isLoading = false;
    notifyListeners();
  }

  void setLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  void setSearchVal(data) {
    if (searchVal != data) {
      songList = [];
    }
    searchVal = data;
    notifyListeners();
  }
}