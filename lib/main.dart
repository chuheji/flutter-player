/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-09 14:44:59
 * @LastEditTime: 2022-06-16 15:08:32
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/main.dart
 * @Description: 文件描述
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app/views/discover.dart';
import 'package:app/views/podcast.dart';
import 'package:app/views/my.dart';
import 'package:app/views/myfocus.dart';
import 'package:app/views/yuncun.dart';

void main() {
  runApp(MyApp());
}

Map<String, WidgetBuilder> routes = {'/discover': (context) => Discover()};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/",
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  // DrawerController drawerController;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = 'initVal';
  int _activeTab = 0;
  final pages = [Discover(), Podcast(), My(), Myfocus(), Yuncun()];

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
    getDataTest();
    super.initState();
  }

  void _handleTap(int index) {
    setState(() {
      _activeTab = index;
    });
  }

  get _drawer => Drawer(
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
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Drawer Demo'),
      // ),
      drawer: _drawer,
      body: Container(
        child: Builder(builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu)),
                  ],
                ),
              ),
              pages[_activeTab]
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: '播客'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: '我的'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt), label: '关注'),
          BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: '云村'),
        ],
        currentIndex: _activeTab,
        onTap: _handleTap,
      ),
    );
  }
}
