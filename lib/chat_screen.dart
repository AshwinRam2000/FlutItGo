import 'package:flutter/material.dart';
import 'pages/chat.dart';
import 'pages/chatScreen.dart';
import 'chat.dart';

class chat_screen extends StatefulWidget {
  @override
  _chat_screenState createState() => _chat_screenState();
}

class _chat_screenState extends State<chat_screen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => ChatScreen()));
                },
                child: new ListTile(
                  leading: new CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: new NetworkImage(
                        "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwigmPynw8fiAhUDS48KHVwDA-YQjRx6BAgBEAU&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fman%2Bface&psig=AOvVaw2MNcPw_tD57Ah5g4SD8pNe&ust=1559452473941857"),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        //"Ashwin ",
                        dummyData[i].name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        //"10.10am",
                        dummyData[i].time,
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      //"what is spacer?",
                      dummyData[i].message,
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
    );
    ;
  }
}
