import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  Widget build(BuildContext context) {


    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('data', style: TextStyle(color: Colors.blue),),
            bottom: TabBar(tabs: [
              Tab(child: Text('data' , style: TextStyle(color: Colors.blue),),),
              Tab(child: Text('data' , style: TextStyle(color: Colors.blue),),),
              Tab(child: Text('data' , style: TextStyle(color: Colors.blue),),),
            ]),
          ),
          //body: TabBarView(children:details),
        ));
  }
}
