/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 09:18:51
 * @LastEditTime: 2022-06-28 08:56:50
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/Drawerorigin.dart
 * @Description: 文件描述
 */
import 'package:flutter/material.dart';

class Drawerorigin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         stops: [0, 0.4, 1],
        //         colors: [Colors.pink.shade50, Colors.pink.shade50, Colors.white]),
        //     border: Border(bottom: BorderSide(width: 0.5, color: Color(0xFFdddddd)))),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 100),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30,
                icon: Icon(Icons.menu)),
            Expanded(
              child: GestureDetector(
                  onTap: () => {Navigator.of(context).pushNamed('/search')},
                  child: Container(
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Color(0xFFffffff)),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 3, 5, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ),
                        Text(
                          'aaaaa',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 24,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 30,
                icon: Icon(Icons.mic)),
          ],
        )));
  }
}
