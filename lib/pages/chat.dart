import 'package:flutter/material.dart';

class chatInside extends StatefulWidget {
  @override
  _chatInsideState createState() => _chatInsideState();
}

class _chatInsideState extends State<chatInside> {
  Animation animation;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(children: getSentMessageLayout()
            // : getReceivedMessageLayout(),
            ),
      ),
    );
  }
}

List<Widget> getSentMessageLayout() {
  return <Widget>[
    new Expanded(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Text("kk",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Image.network(
                "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjIuvPEysfiAhVQinAKHVBwDLUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dx_HL0wiK4Zc&psig=AOvVaw1tf0Fi5n_idv-eqWssQRDZ&ust=1559454413780922",
                width: 250.0,
              )
              //: new Text(messageSnapshot.value['text']),
              ),
        ],
      ),
    ),
    new Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  /* messageSnapshot.value['senderPhotoUrl'] */ "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjIuvPEysfiAhVQinAKHVBwDLUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dx_HL0wiK4Zc&psig=AOvVaw1tf0Fi5n_idv-eqWssQRDZ&ust=1559454413780922"),
            )),
      ],
    ),
  ];
}

List<Widget> getReceivedMessageLayout() {
  return <Widget>[
    new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  /* messageSnapshot.value['senderPhotoUrl'] */ "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjIuvPEysfiAhVQinAKHVBwDLUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dx_HL0wiK4Zc&psig=AOvVaw1tf0Fi5n_idv-eqWssQRDZ&ust=1559454413780922"),
            )),
      ],
    ),
    new Expanded(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(/* messageSnapshot.value['senderName'] */ "dd",
              style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child:
                "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjIuvPEysfiAhVQinAKHVBwDLUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dx_HL0wiK4Zc&psig=AOvVaw1tf0Fi5n_idv-eqWssQRDZ&ust=1559454413780922" !=
                        null
                    ? new Image.network(
                        "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjIuvPEysfiAhVQinAKHVBwDLUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dx_HL0wiK4Zc&psig=AOvVaw1tf0Fi5n_idv-eqWssQRDZ&ust=1559454413780922",
                        width: 250.0,
                      )
                    : new Text(/* messageSnapshot.value['text'] */ "hii"),
          ),
        ],
      ),
    ),
  ];
}
