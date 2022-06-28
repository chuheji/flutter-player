/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-20 17:24:03
 * @LastEditTime: 2022-06-24 11:22:40
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/SearchAssociation.dart
 * @Description: 文件描述
 */
import 'package:flutter/material.dart';

class SearchAssociation extends StatelessWidget {
  final textArr;
  final Function onSearch;
  SearchAssociation({Key? key, required this.textArr, required this.onSearch}) : super(key: key);
  Widget buildList(context) {
    List<Widget> list = [];
    Widget content;
    for (var text in textArr) {
      list.add(GestureDetector(
        onTap: () {
          onSearch(text, context);
        },
        child: Container(
            height: 50,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Icon(Icons.search),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  width: MediaQuery.of(context).size.width - 60,
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 0.5)),
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ));
    }
    content = Column(children: list);
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: EdgeInsets.only(top: 10),
      child: buildList(context),
    ));
  }
}
