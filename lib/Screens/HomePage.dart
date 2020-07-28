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
                  Play(),
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
        ), //how to make the drawer appear without appBar
      ),
    );
  }
}

class Play extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
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
          showAlertDialog(context);
        },
      ),
    );
  }
}

class TwoPlayers extends StatefulWidget {
  @override
  _Twoplayers createState() => _Twoplayers();
}

class _Twoplayers extends State<TwoPlayers> {
  bool r1 = false;
  bool g1 = false;
  bool y1 = false;
  bool b1 = false;
  bool r2 = false;
  bool g2 = false;
  bool y2 = false;
  bool b2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("P1:\t"),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: FlatButton(
                color: r1 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r1 == true)
                      r1 = false;
                    else if ((!(g1 || b1 || y1)) && r2 == false) r1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: FlatButton(
                color: y1 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y1 == true)
                      y1 = false;
                    else if ((!(g1 || b1 || r1)) && y2 == false) y1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: FlatButton(
                color: b1 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b1 == true)
                      b1 = false;
                    else if ((!(g1 || r1 || y1)) && b2 == false) b1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: FlatButton(
                color: g1 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g1 == true)
                      g1 = false;
                    else if ((!(r1 || b1 || y1)) && g2 == false) g1 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text("P2:\t"),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: FlatButton(
                color: r2 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r2 == true)
                      r2 = false;
                    else if ((!(g2 || b2 || y2)) && r1 == false) r2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: FlatButton(
                color: y2 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y2 == true)
                      y2 = false;
                    else if ((!(g2 || b2 || r2)) && y1 == false) y2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: FlatButton(
                color: b2 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b2 == true)
                      b2 = false;
                    else if ((!(g2 || r2 || y2)) && b1 == false) b2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: FlatButton(
                color: g2 ? Colors.white : null,
                child: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g2 == true)
                      g2 = false;
                    else if ((!(r2 || b2 || y2)) && g1 == false) g2 = true;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

twoPlayers(BuildContext context) {
  Widget column = new TwoPlayers();
  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xff16497d),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text("Select Your Color"),
    actions: [
      column,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

threePlayers(BuildContext context) {
  Widget column = Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Text("P1:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text("P2:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text("P3:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xff16497d),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text("Select Your Color"),
    actions: [
      column,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

fourPlayers(BuildContext context) {
  Widget column = Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Text("P1:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text("P2:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text("P3:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text("P4:\t"),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.red),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20,
            height: 20,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.yellow),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.blue),
              onPressed: () {},
            ),
          ),
          ButtonTheme(
            minWidth: 20.0,
            height: 20.0,
            child: FlatButton(
              child: Icon(Icons.brightness_1, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xff16497d),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text("Select Your Color"),
    actions: [
      column,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog(BuildContext context) {
  Widget row = Row(
    children: <Widget>[
      ButtonTheme(
        minWidth: 20.0,
        height: 40.0,
        child: RaisedButton(
          child: Text("   2\nPlayers"),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 10),
          onPressed: () {
            Navigator.of(context).pop();
            twoPlayers(context);
          },
        ),
      ),
      ButtonTheme(
        minWidth: 20.0,
        height: 40.0,
        child: RaisedButton(
          child: Text("   3\nPlayers"),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 10),
          onPressed: () {
            Navigator.of(context).pop();
            threePlayers(context);
          },
        ),
      ),
      ButtonTheme(
        minWidth: 20.0,
        height: 40.0,
        child: RaisedButton(
          child: Text("  4\nPlayers"),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 10),
          onPressed: () {
            Navigator.of(context).pop();
            fourPlayers(context);
          },
        ),
      ),
    ],
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xff16497d),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text("Select Players"),
    content: Text("Select number of players"),
    actions: [
      row,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
