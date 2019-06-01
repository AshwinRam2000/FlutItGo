import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../pages/chat.dart';

var currentUserEmail;
var _scaffoldContext;

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class Msg {
  Msg(this.msg, this.user);
  bool user;
  String msg;
}

class ChatScreenState extends State<ChatScreen> {
  List<Msg> l = [
    Msg("Hi", true),
    Msg("Hi", false),
    Msg("Wanna colab?", true),
    Msg("Why not?", false),
  ];
  final TextEditingController _textEditingController =
      new TextEditingController();
  bool _isComposingMessage = false;
  String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Chat App"),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: ListView.builder(
                itemCount: l.length,
                itemBuilder: (bc, i) {
                  return buildMsg(l[i]);
                },
              )),
              new Divider(height: 1.0),
              new Container(
                decoration:
                    new BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
              new Builder(builder: (BuildContext context) {
                _scaffoldContext = context;
                return new Container(width: 0.0, height: 0.0);
              })
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(
                      top: new BorderSide(
                  color: Colors.grey[200],
                )))
              : null,
        ));
  }

  IconButton getDefaultSendButton() {
    return new IconButton(
        icon: new Icon(Icons.send),
        onPressed: () {
          setState(() {
            getSentMessageLayout();
          });
        });
  }

  void send(String s) {
    setState(() {
      l.insert(l.length, Msg(s, true));
    });
  }

  Widget buildMsg(Msg msg) {
    return msg.user
        ? Row(
            children: <Widget>[Spacer(), Text(msg.msg)],
          )
        : Row(
            children: <Widget>[
              Text(msg.msg),
              Spacer(),
            ],
          );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(
          color: _isComposingMessage
              ? Theme.of(context).accentColor
              : Theme.of(context).disabledColor,
        ),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textEditingController,
                  onChanged: (String messageText) {
                    msg = messageText;
                    setState(() {
                      _isComposingMessage = messageText.length > 0;
                    });
                  },
                  decoration: new InputDecoration.collapsed(
                    hintText: "Send a message",
                  ),
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: getDefaultSendButton(),
              ),
            ],
          ),
        ));
  }
}
