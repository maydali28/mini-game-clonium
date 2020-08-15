import 'package:flutter/material.dart';
import 'play.dart';
import 'Sound.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Game Name",
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/stars.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title 
            Positioned.fill(
              top: 90.0,
              left: 90,
              child: Text(
                "Game     Name",
                style: TextStyle(
                  fontFamily: 'Game',
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        Color(0xff1549d4),
                        Color(0xff188bb3),
                      ],
                    ),
                  fontSize: 70,
                ),
              ),
            ),
            Positioned.fill(
              top: 320.0,
              child: Column(
                children: <Widget>[
                  new Play(cubesNb:8),
                  SizedBox(height: 30),
                  new Sound(),
                  SizedBox(height: 30),
                  // Exit button
                  ButtonTheme(
                    minWidth: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Color(0xffccffff),
                      highlightColor: Color(0xffcdffcd),
                      splashColor: Color(0xff19817e),
                      animationDuration: Duration(seconds: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          width: 5.0,
                          color: Color(0xff81b9da),
                        ),
                      ),
                      textColor: Color(0xff81b9da),
                      child: Text(
                        "EXIT",
                        style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        SystemChannels.platform
                            .invokeMethod('SystemNavigator.pop');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
