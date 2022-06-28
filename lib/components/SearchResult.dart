/*
 * @Author: liuyouxiang<xlfLuminous@163.com>
 * @Date: 2022-06-22 09:30:13
 * @LastEditTime: 2022-06-24 15:11:00
 * @LastEditors: liuyouxiang<xlfLuminous@163.com>
 * @FilePath: /app/lib/components/searchResult.dart
 * @Description: 文件描述
 */
import 'package:app/components/OnlySong.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchResultWidgetState();
  }
}

class SearchResultWidgetState extends State<SearchResult> with TickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(text: '综合'),
    Tab(text: '单曲'),
    Tab(text: '歌单'),
    Tab(text: '视频'),
    Tab(text: '歌手'),
    Tab(text: '播客'),
    Tab(text: '歌词'),
    Tab(text: '专辑'),
    Tab(text: '声音'),
    Tab(text: '话题'),
    Tab(text: '用户'),
  ];
  TabController? _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            tabs: _tabs,
            labelPadding: EdgeInsets.zero,
            // padding: EdgeInsets.symmetric(horizontal: 16),
            labelColor: const Color.fromARGB(255, 51, 51, 51),
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelColor: Color.fromARGB(255, 114, 114, 114),
            unselectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(bottom: 16, top: 30),
            indicator: BoxDecoration(
                color: Color.fromARGB(255, 235, 80, 72), borderRadius: BorderRadius.all(Radius.circular(10))),
            controller: _tabController,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 120,
          child: TabBarView(
            children: [
              Center(child: Text('汽车')),
              OnlySong(),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
              Center(child: Text('自行车')),
            ],
            controller: _tabController,
          ),
        )
      ],
    ));
  }
}
