/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-17 15:29:38
 * @LastEditTime: 2022-06-17 16:12:34
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/ReturnBtn.dart
 * @Description: 文件描述
 */
import 'package:flutter/material.dart';

class ReturnBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Container(
        // margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Image.asset(
                'assets/images/arrow_left.png',
                width: 40,
                height: 40,
              ),
            ))));
  }
}
