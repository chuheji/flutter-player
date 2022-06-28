/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 15:58:24
 * @LastEditTime: 2022-06-27 16:08:45
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/api/songApi.dart
 * @Description: 文件描述
 */
import 'package:app/http/http.dart';

class SongApi {
  static searchSongUrl(params) {
    return Request.get('/song/url', params);
  }
}
