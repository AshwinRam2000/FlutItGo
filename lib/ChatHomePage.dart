import 'package:flutter/material.dart';

//import 'package:hack2019/camera_screen.dart';
import 'chat_screen.dart';
import 'status_screen.dart';

class ChatHomePage extends StatefulWidget {
  @override
  _ChatHomePageState createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //_tabController = new TabController(vsync: this, initialIndex: 0, length: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter chat"),
        elevation: 0.7,
        /*  bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          
        ), */
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      /* body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          //new camera_screen(),
          new chat_screen(),
          /*new status_screen(),
          new call_screen(), */
        ],
      ), */
      body: chat_screen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
