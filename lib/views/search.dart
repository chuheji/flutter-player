/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 15:16:08
 * @LastEditTime: 2022-06-29 13:35:15
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/search.dart
 * @Description: 文件描述
 */
import 'package:app/components/ReturnBtn.dart';
import 'package:app/components/SearchAssociation.dart';
import 'package:app/components/SearchResult.dart';
import 'package:app/controller/song_controller.dart';
import "package:flutter/material.dart";
import 'package:app/api/searchApi.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  final controller = Get.put(SongController(false, [], -12));
  @override
  State<StatefulWidget> createState() {
    return SearchWidgetState();
  }
}

class SearchWidgetState extends State<Search> {
  var status = 'beforeSearch';
  List hotData = [];

  void initState() {
    super.initState();
  }

  void onSearch(val, context) async {
    final controller = Get.put(SongController(false, [], -12));
    setState(() {
      status = 'afterSearch';
    });
    controller.setSearchVal(val);
    controller.getSongList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 15, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: ReturnBtn(),
                ),
                Expanded(
                    flex: 1,
                    child: TextField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFeeeeee), width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFeeeeee), width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          hintText: '',
                          hintStyle: TextStyle(fontFamily: 'MaterialIcons', fontSize: 16),
                          filled: true,
                          contentPadding: EdgeInsets.only(top: 5, bottom: 5),
                          fillColor: Colors.white),
                      onSubmitted: (val) => onSearch(val, context),
                      onChanged: (value) async {
                        if (value == '') {
                          setState(() {
                            status = 'beforeSearch';
                          });
                          return;
                        }
                        Map<String, dynamic> params = Map();
                        params['keywords'] = value;
                        params['type'] = 'mobile';
                        var data = await SearchApi.searchHotByKeyword(params);
                        var res = [];
                        for (var item in data['result']['allMatch']) {
                          res.add(item['keyword']);
                        }
                        setState(() {
                          status = 'searching';
                          hotData = res;
                        });
                      },
                    ))
              ],
            ),
          ),
          Builder(builder: (context) {
            if (status == 'beforeSearch') {
              return (Container(
                child: Text('beforeSearch'),
              ));
            } else if (status == 'searching') {
              return (Container(
                child: SearchAssociation(
                  textArr: hotData,
                  onSearch: onSearch,
                ),
              ));
            } else {
              return (SearchResult());
            }
          }),
        ],
      ),
    ));
  }
}
