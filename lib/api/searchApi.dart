/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 17:06:42
 * @LastEditTime: 2022-06-22 15:48:08
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/api/searchApi.dart
 * @Description: 文件描述
 */
import 'package:app/http/http.dart';

class SearchApi {
  static searchByKeyword(params) {
    return Request.get("/cloudsearch", params);
  }

  static searchHotByKeyword(params) {
    return Request.get("/search/suggest", params);
  }
}
