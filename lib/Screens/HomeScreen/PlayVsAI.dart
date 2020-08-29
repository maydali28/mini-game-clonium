import 'package:flutter/material.dart';
import '../GameScreen/GamePageAI.dart';

// ignore: must_be_immutable
class Play extends StatelessWidget {
  int playersNb;//players' number
  int cubesNb; //size of the board
  //the 2 colors selected by the player the first one for the player 2nd for AI
  List<Color> playersColor = new List<Color>();
  int level; 
  Play({this.cubesNb});
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
        animationDuration: Duration(seconds: 1),
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
    Color c1 = Colors.white;
    Color c2 = Colors.transparent;
    Color c3 = Colors.transparent;

    Widget selectPlayer = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Colors
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Red button
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff6E0C23), Color(0xffEC728F)]),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2.5,
                      color: (ch1 != "") ? Colors.white : Colors.transparent,
                    ),
                  ),
                ),
                onTap: () {
                  if (playersColor.indexOf(Colors.red) != -1) {
                    playersColor.remove(Colors.red);
                    playersNb -= 1;
                    setState(() => ch1 = "");
                  } else if (playersNb < 2) {
                    playersNb += 1;
                    playersColor.add(Colors.red);
                    setState(() => ch1 = "Player");
                  }
                },
              );
            }),
            Text("     "),//separator
            //Green button
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff2D9C40), Color(0xff57E695)]),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2.5,
                      color: (ch2 != "") ? Colors.white : Colors.transparent,
                    ),
                  ),
                ),
                onTap: () {
                  if (playersColor.indexOf(Colors.green) != -1) {
                    playersColor.remove(Colors.green);
                    playersNb -= 1;
                    setState(() => ch2 = "");
                  } else if (playersNb < 2) {
                    playersNb += 1;
                    playersColor.add(Colors.green);
                    setState(() => ch2 = "Player");
                  }
                },
              );
            }),
            Text("     "),//separator
            //Yellow Color
            StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xffDAEF55), Color(0xff9FAF35)]),
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      width: 2.5,
                      color: (ch3 != "") ? Colors.white : Colors.transparent,
                    ),
                  ),
                ),
                onTap: () {
                  if (playersColor.indexOf(Colors.yellow) != -1) {
                    playersColor.remove(Colors.yellow);
                    playersNb -= 1;
                    setState(() => ch3 = "");
                  } else if (playersNb < 2) {
                    playersNb += 1;
                    playersColor.add(Colors.yellow);
                    setState(() => ch3 = "Player");
                  }
                },
              );
            }),
            Text("     "),//separator
            //Purple Color
            ButtonTheme(
              minWidth: 124.0,
              height: 45.0,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xff4E0A58), Color(0xffD13DE8)]),
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        width: 2.5,
                        color: (ch4 != "") ? Colors.white : Colors.transparent,
                      ),
                    ),
                  ),
                  onTap: () {
                    if (playersColor.indexOf(Colors.purple) != -1) {
                      playersColor.remove(Colors.purple);
                      playersNb -= 1;
                      setState(() => ch4 = "");
                    } else if (playersNb < 2) {
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
        Text(" "),//separator
        // Select board size
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "BOARD   ",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Jumpman',
                fontWeight: FontWeight.bold,
                color: Color(0xffccffff),
              ),
            ),
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 2.5,
                    color: c1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "x8",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  cubesNb = 8;
                  c1 = Colors.white;
                  c2 = Colors.transparent;
                  c3 = Colors.transparent;
                });
              },
            ),
            Text("  "),
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(width: 2.5, color: c2),
                ),
                child: Center(
                  child: Text(
                    "x7",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  cubesNb = 7;
                  c1 = Colors.transparent;
                  c3 = Colors.transparent;
                  c2 = Colors.white;
                });
              },
            ),
            Text("  "),
            GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 2.5,
                    color: c3,
                  ),
                ),
                child: Center(
                  child: Text(
                    "x6",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  cubesNb = 6;
                  c1 = Colors.transparent;
                  c2 = Colors.transparent;
                  c3 = Colors.white;
                });
              },
            ),
          ]);
        }),
        Text(" "),//separator
        //Select Level
        Center(child:Text(
              "LEVEL",
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Jumpman',
                fontWeight: FontWeight.bold,
                color: Color(0xffccffff),
              ),
            ),),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 2.5,
                    color: c1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "EASY",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  level = 1;
                  c1 = Colors.white;
                  c2 = Colors.transparent;
                  c3 = Colors.transparent;
                });
              },
            ),
            Text("  "),
            GestureDetector(
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(width: 2.5, color: c2),
                ),
                child: Center(
                  child: Text(
                    "MEDIUM",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  level=2;
                  c1 = Colors.transparent;
                  c3 = Colors.transparent;
                  c2 = Colors.white;
                });
              },
            ),
            Text("  "),
            GestureDetector(
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffccffff),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 2.5,
                    color: c3,
                  ),
                ),
                child: Center(
                  child: Text(
                    "HARD",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff8DC1EF),
                    ),
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  level=4;
                  c1 = Colors.transparent;
                  c2 = Colors.transparent;
                  c3 = Colors.white;
                });
              },
            ),
          ]);
        }),
        Text(""),
        Text(""),
        // Start button
        ButtonTheme(
          minWidth: 124.0,
          height: 45.0,
          child: RaisedButton(
            color: Color(0xffccffff),
            splashColor: Color(0xff19817e),
            animationDuration: Duration(seconds: 1),
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
              if (playersNb == 2) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new GameVsAI(
                          colorPlayer: playersColor, cubesNb: cubesNb,level:level)),
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
          "Select 2 Colors ",
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
