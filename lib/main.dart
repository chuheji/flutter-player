/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-09 14:44:59
 * @LastEditTime: 2022-06-15 16:59:05
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/main.dart
 * @Description: 文件描述
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String str = 'initVal';

  getDataTest() async {
    setState(() {
      str = '';
    });
    String url = 'http://test.liuyouxiang.site/song/url?id=33894312';
    Dio dio = new Dio();
    Response response = await dio.get(url);
    setState(() {
      print(response);
      str = response.data.toString();
    });
  }

  void initState() {
    print(222);
    getDataTest();
    super.initState();
  }

  void _incrementCounter() {
    getDataTest();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(color: Color(0xFFeeeeee)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.all(20),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.pink[100],
                        ),
                        Text(
                          '立即登录',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/scan.png',
                      width: 20,
                      height: 20,
                    )
                  ],
                )),
            ListView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.message),
                        title: Text('我的消息'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.filter_center_focus),
                        title: Text('云贝中心'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  decoration:
                      new BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.airplane_ticket),
                        title: Text('云村有票'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_cart_rounded),
                        title: Text('商城'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.queue_music_rounded),
                        title: Text('Beat交易平台'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.computer),
                        title: Text('游戏专区'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.ring_volume),
                        title: Text('口袋彩铃'),
                        trailing: Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
