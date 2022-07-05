/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-27 13:48:55
 * @LastEditTime: 2022-06-29 16:21:31
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/views/playsongcontainer.dart
 * @Description: 文件描述
 */
import 'package:app/components/Playsong.dart';
import 'package:app/controller/current_song_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Playsongcontainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlaysongcontainerState();
  }
}

class PlaysongcontainerState extends State<Playsongcontainer> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(body: Playsong()));
  }
}
