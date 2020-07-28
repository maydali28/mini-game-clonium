import 'package:flutter/material.dart';
import 'package:audio_widget/audio_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool sound = true;

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
                  fontFamily: 'Rowdies',
                  color: Color(0xff27bfaa),
                  fontSize: 50,
                ),
              ), //game Name
            ),
            Positioned(
              right: 0.0,
              child: Audio.assets(
                path: "assets/Loveshadow.mp3",
                play: sound,
                child: ButtonTheme(
                  minWidth: 50,
                  height: 50,
                  child: FlatButton(
                    child: Icon(
                      sound ? Icons.volume_up : Icons.volume_off,
                      color: Color(0xff19817e),
                    ),
                    onPressed: () {
                      /*player.play(
                        'http://ccmixter.org/content/Loveshadow/Loveshadow_-_SUPERPOWER_(feat_Siobhan_Dakay).mp3');

                    */
                      setState(() {
                        sound = !sound;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 250.0,
              child: Column(
                children: <Widget>[
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
                        "PLAY",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        
                      },
                    ),
                  ),
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
                        "TUTORIAL",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
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
                        "OPTIONS",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
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
        ),

        drawer: DrawerOnly(), //how to make the drawer appear without appBar
      ),
    );
  }
}

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("User Name"),
          ),
          ListTile(
            title: Text("List of Scores"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Edit user"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
              title: Text("Credit"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
            title: Text("LogOut"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
