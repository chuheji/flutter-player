/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 13:48:55
 * @LastEditTime: 2022-06-29 13:35:58
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/playsongcontainer.dart
 * @Description: 文件描述
 */
import 'package:app/components/Playsong.dart';
import 'package:flutter/material.dart';

class Playsongcontainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlaysongcontainerState();
  }
}

class PlaysongcontainerState extends State<Playsongcontainer> {
  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments;
    return (Scaffold(body: Playsong(arguments: arguments)));
  }
}
