import 'package:flutter/material.dart';

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
            fontFamily: 'Rowdies',
            fontSize: 40,
          ),
        ),
        onPressed: () {
          selectPlayer(context);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "P1:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r1 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.red),
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
              child: IconButton(
                iconSize: y1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
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
              child: IconButton(
                iconSize: b1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
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
              child: IconButton(
                iconSize: g1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P2:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r2 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.red),
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
              child: IconButton(
                iconSize: y2 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
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
              child: IconButton(
                iconSize: b2 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
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
              child: IconButton(
                iconSize: g2 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.green),
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
    backgroundColor: Color(0xffccffff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text(
      "Select Your Color",
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Jumpman',
        color: Color(0xff2babb9),
      ),
    ),
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

class ThreePlayers extends StatefulWidget {
  @override
  _Threeplayers createState() => _Threeplayers();
}

class _Threeplayers extends State<ThreePlayers> {
  bool r1 = false;
  bool g1 = false;
  bool y1 = false;
  bool b1 = false;
  bool r2 = false;
  bool g2 = false;
  bool y2 = false;
  bool b2 = false;
  bool r3 = false;
  bool g3 = false;
  bool y3 = false;
  bool b3 = false;
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P1:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r1 == true)
                      r1 = false;
                    else if ((!(g1 || b1 || y1)) && (r2 || r3) == false)
                      r1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y1 == true)
                      y1 = false;
                    else if ((!(g1 || b1 || r1)) && (y2 || y3) == false)
                      y1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b1 == true)
                      b1 = false;
                    else if ((!(g1 || r1 || y1)) && (b2 || b3) == false)
                      b1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g1 == true)
                      g1 = false;
                    else if ((!(r1 || b1 || y1)) && (g2 || g3) == false)
                      g1 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P2:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r2 ? 35.0 : 25.0,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r2 == true)
                      r2 = false;
                    else if ((!(g2 || b2 || y2)) && (r1 || r3) == false)
                      r2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y2 == true)
                      y2 = false;
                    else if ((!(g2 || b2 || r2)) && (y1 || y3) == false)
                      y2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b2 == true)
                      b2 = false;
                    else if ((!(g2 || r2 || y2)) && (b1 || b3) == false)
                      b2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g2 == true)
                      g2 = false;
                    else if ((!(r2 || b2 || y2)) && (g1 || g3) == false)
                      g2 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P3:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r3 == true)
                      r3 = false;
                    else if ((!(g3 || b3 || y3)) && (r1 || r2) == false)
                      r3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y3 == true)
                      y3 = false;
                    else if ((!(g3 || b3 || r3)) && (y1 || y2) == false)
                      y3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b3 == true)
                      b3 = false;
                    else if ((!(g3 || r3 || y3)) && (b1 || b2) == false)
                      b3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g3 == true)
                      g3 = false;
                    else if ((!(r3 || b3 || y3)) && (g1 || g2) == false)
                      g3 = true;
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

threePlayers(BuildContext context) {
  Widget column = new ThreePlayers();
  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xffccffff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text(
      "Select Your Color",
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Jumpman',
        color: Color(0xff2babb9),
      ),
    ),
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

class FourPlayers extends StatefulWidget {
  @override
  _Fourplayers createState() => _Fourplayers();
}

class _Fourplayers extends State<FourPlayers> {
  bool r1 = false;
  bool g1 = false;
  bool y1 = false;
  bool b1 = false;
  bool r2 = false;
  bool g2 = false;
  bool y2 = false;
  bool b2 = false;
  bool r3 = false;
  bool g3 = false;
  bool y3 = false;
  bool b3 = false;
  bool r4 = false;
  bool g4 = false;
  bool y4 = false;
  bool b4 = false;
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P1:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r1 == true)
                      r1 = false;
                    else if ((!(g1 || b1 || y1)) && (r2 || r3 || r4) == false)
                      r1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y1 == true)
                      y1 = false;
                    else if ((!(g1 || b1 || r1)) && (y2 || y3 || y4) == false)
                      y1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b1 == true)
                      b1 = false;
                    else if ((!(g1 || r1 || y1)) && (b2 || b3 || b4) == false)
                      b1 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g1 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g1 == true)
                      g1 = false;
                    else if ((!(r1 || b1 || y1)) && (g2 || g3 || g4) == false)
                      g1 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P2:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r2 == true)
                      r2 = false;
                    else if ((!(g2 || b2 || y2)) && (r1 || r3 || r4) == false)
                      r2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y2 == true)
                      y2 = false;
                    else if ((!(g2 || b2 || r2)) && (y1 || y3 || y4) == false)
                      y2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b2 == true)
                      b2 = false;
                    else if ((!(g2 || r2 || y2)) && (b1 || b3 || b4) == false)
                      b2 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g2 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g2 == true)
                      g2 = false;
                    else if ((!(r2 || b2 || y2)) && (g1 || g3 || g4) == false)
                      g2 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P3:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r3 == true)
                      r3 = false;
                    else if ((!(g3 || b3 || y3)) && (r1 || r2 || r4) == false)
                      r3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y3 == true)
                      y3 = false;
                    else if ((!(g3 || b3 || r3)) && (y1 || y2 || y4) == false)
                      y3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b3 == true)
                      b3 = false;
                    else if ((!(g3 || r3 || y3)) && (b1 || b2 || b4) == false)
                      b3 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g3 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g3 == true)
                      g3 = false;
                    else if ((!(r3 || b3 || y3)) && (g1 || g2 || g4) == false)
                      g3 = true;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("P4:\t",
              style: TextStyle(
                  color: Color(0xff27bfaa),
                  fontSize: 22,
                  fontFamily: "Jumpman"),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: r4 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (r4 == true)
                      r4 = false;
                    else if ((!(g4 || b4 || y4)) && (r1 || r2 || r3) == false)
                      r4 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20,
              height: 20,
              child: IconButton(
                iconSize: y4 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.yellow),
                onPressed: () {
                  setState(() {
                    if (y4 == true)
                      y4 = false;
                    else if ((!(g4 || b4 || r4)) && (y1 || y2 || y3) == false)
                      y4 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: b4 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.blue),
                onPressed: () {
                  setState(() {
                    if (b4 == true)
                      b4 = false;
                    else if ((!(g4 || r4 || y4)) && (b1 || b2 || b3) == false)
                      b4 = true;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: 20.0,
              height: 20.0,
              child: IconButton(
                iconSize: g4 ? 35 : 25,
                icon: Icon(Icons.brightness_1, color: Colors.green),
                onPressed: () {
                  setState(() {
                    if (g4 == true)
                      g4 = false;
                    else if ((!(r4 || b4 || y4)) && (g1 || g2 || g3) == false)
                      g4 = true;
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

fourPlayers(BuildContext context) {
  Widget column = new FourPlayers();

  AlertDialog alert = AlertDialog(
    backgroundColor: Color(0xffccffff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text(
      "Select Your Color",
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Jumpman',
        color: Color(0xff2babb9),
      ),
    ),
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

selectPlayer(BuildContext context) async {
  Widget row = Row(
    children: <Widget>[
      ButtonTheme(
        minWidth: 28.0,
        height: 28.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Text(
            "   2\nPlayers",
            style: TextStyle(
              fontFamily: 'Jumpman',
              fontSize: 16,
              color: Color(0xffccffff),
            ),
          ),
          color: Color(0xff81b9da),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 2),
          onPressed: () {
            Navigator.of(context).pop();
            twoPlayers(context);
          },
        ),
      ),
      Text(" "),
      ButtonTheme(
        minWidth: 28.0,
        height: 28.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          color: Color(0xff81b9da),
          child: Text(
            "   3\nPlayers",
            style: TextStyle(
              color: Color(0xffccffff),
              fontFamily: 'Jumpman',
              fontSize: 16,
            ),
          ),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 2),
          onPressed: () {
            Navigator.of(context).pop();
            threePlayers(context);
          },
        ),
      ),
      Text(" "),
      ButtonTheme(
        minWidth: 28.0,
        height: 28.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: Text(
            "   4\nPlayers",
            style: TextStyle(
              color: Color(0xffccffff),
              fontFamily: 'Jumpman',
              fontSize: 16,
            ),
          ),
          color: Color(0xff81b9da),
          hoverColor: Color(0xff8fc8dc),
          splashColor: Color(0xff103c4b),
          animationDuration: Duration(seconds: 2),
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
    backgroundColor: Color(0xffccffff),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    title: Text(
      "Select Players",
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Jumpman',
        color: Color(0xff2babb9),
      ),
    ),
    content: Text(
      "Select number of players",
      style: TextStyle(
        fontFamily: 'Rowdies',
        color: Color(0xff27bfaa),
        fontSize: 19,
      ),
    ),
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
