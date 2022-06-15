/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-09 14:44:59
 * @LastEditTime: 2022-06-15 10:50:08
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(str),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
