import 'package:flutter/material.dart';
import 'package:minigame/Screens/HomeScreen/options.dart';
import './play.dart';
import './options.dart';
import './tutorial.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    //AudioPlayer player = AudioPlayer();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Game Name",
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gameBackground.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              top: 70.0,
              left: 110,
              child: Text(
                "Game     Name",
                style: TextStyle(
                  fontFamily: 'Game',
                  color: Color(0xff27bfaa),
                  fontSize: 50,
                ),
              ), 
            ),
            Positioned(
              right: 0.0,
              child: new Sound(),
            ),
            Positioned.fill(
              top: 250.0,
              child: Column(
                children: <Widget>[
                  new Play(),
                  SizedBox(height: 20),
                  new Tutorial(),
                  SizedBox(height: 20),
                  new Options(),
                  SizedBox(height: 20),
                  ButtonTheme(
                    minWidth: 250.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Color(0xffccffff),
                      hoverColor: Color(0xff64e9e9),
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ), //how to make the drawer appear without appBar
      ),
    );
  }
}

