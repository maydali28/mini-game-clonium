import 'package:flutter/material.dart';
import '../Game.dart';

// ignore: must_be_immutable
class Play extends StatelessWidget {
  final int cubesNb;
  int playersNb;
  Play({this.cubesNb = 6});
  List<Color> playersColor = new List<Color>();
  @override
  Widget build(BuildContext context) {
    playersNb = 0;
    return ButtonTheme(
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

  selectPlayer(BuildContext context) {
    String ch1 = "";
    String ch2 = "";
    String ch3 = "";
    String ch4 = "";
    Widget selectPlayer = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 124.0,
              height: 45.0,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff911414),
                          Color(0xffF05B5B),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 124.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      ch1,
                      style: TextStyle(
                        fontFamily: 'Jumpman',
                        fontSize: 16,
                        color: Color(0xffccffff),
                      ),
                    ),
                  ),
                  splashColor: Color(0xff103c4b),
                  animationDuration: Duration(seconds: 2),
                  onPressed: () {
                    if (playersColor.indexOf(Colors.red) != -1) {
                      playersColor.remove(Colors.red);
                      playersNb -= 1;
                      setState(() => ch1 = "");
                    } else {
                      playersNb += 1;
                      playersColor.add(Colors.red);
                      setState(() => ch1 = "Player");
                    }
                  },
                );
              }),
            ),
            Text(" "),
            ButtonTheme(
              minWidth: 124.0,
              height: 45.0,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff19702D),
                          Color(0xff4CF373),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 124.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      ch2,
                      style: TextStyle(
                        fontFamily: 'Jumpman',
                        fontSize: 16,
                        color: Color(0xffccffff),
                      ),
                    ),
                  ),
                  color: Colors.greenAccent,
                  splashColor: Color(0xff103c4b),
                  animationDuration: Duration(seconds: 2),
                  onPressed: () {
                    if (playersColor.indexOf(Colors.green) != -1) {
                      playersColor.remove(Colors.green);
                      playersNb -= 1;
                      setState(() => ch2 = "");
                    } else {
                      playersNb += 1;
                      playersColor.add(Colors.green);
                      setState(() => ch2 = "Player");
                    }
                  },
                );
              }),
            ),
          ],
        ),
        Text(""),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 124.0,
              height: 45.0,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xffC4C430),
                          Color(0xffF3F36D),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 124.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      ch3,
                      style: TextStyle(
                        fontFamily: 'Jumpman',
                        fontSize: 16,
                        color: Color(0xffccffff),
                      ),
                    ),
                  ),
                  color: Colors.yellowAccent,
                  splashColor: Color(0xff103c4b),
                  animationDuration: Duration(seconds: 2),
                  onPressed: () {
                    if (playersColor.indexOf(Colors.yellow) != -1) {
                      playersColor.remove(Colors.yellow);
                      playersNb -= 1;
                      setState(() => ch3 = "");
                    } else {
                      playersNb += 1;
                      playersColor.add(Colors.yellow);
                      setState(() => ch3 = "Player");
                    }
                  },
                );
              }),
            ),
            Text(" "),
            ButtonTheme(
              minWidth: 124.0,
              height: 45.0,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xff74167F),
                          Color(0xffEB70F9),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 124.0, minHeight: 45.0),
                    alignment: Alignment.center,
                    child: Text(
                      ch4,
                      style: TextStyle(
                        fontFamily: 'Jumpman',
                        fontSize: 16,
                        color: Color(0xffccffff),
                      ),
                    ),
                  ),
                  color: Colors.blueAccent,
                  splashColor: Color(0xff103c4b),
                  animationDuration: Duration(seconds: 2),
                  onPressed: () {
                    if (playersColor.indexOf(Colors.purple) != -1) {
                      playersColor.remove(Colors.purple);
                      playersNb -= 1;
                      setState(() => ch4 = "");
                    } else {
                      playersNb += 1;
                      playersColor.add(Colors.purple);
                      setState(() => ch4 = "Player");
                    }
                  },
                );
              }),
            ),
          ],
        ),
        Text(""),
        Text(""),
        ButtonTheme(
          minWidth: 124.0,
          height: 45.0,
          child: RaisedButton(
            color: Color(0xffccffff),
            splashColor: Color(0xff19817e),
            animationDuration: Duration(seconds: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
              side: BorderSide(
                width: 2.0,
                color: Color(0xff4FAFDF),
              ),
            ),
            textColor: Color(0xff4FAFDF),
            child: Text(
              "START",
              style: TextStyle(
                fontFamily: 'Rowdies',
                fontSize: 25,
              ),
            ),
            onPressed: () {
              if (playersNb > 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Game(
                          playersNb: playersNb,
                          colorPlayer: playersColor,
                          cubesNb: cubesNb)),
                );
              }
            },
          ),
        ),
      ],
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0xff8DC1EF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      title: Center(
        child: Text(
          "Select Players",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Jumpman',
            color: Color(0xffccffff),
          ),
        ),
      ),
      actions: [
        selectPlayer,
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
}
