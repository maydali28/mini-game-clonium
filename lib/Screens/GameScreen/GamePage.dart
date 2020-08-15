import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'Cubes.dart';
import 'Players.dart';
import '../HomeScreen/HomePage.dart';

class Game extends StatefulWidget {
  final int playersNb;
  final List<Color> colorPlayer;
  final int cubesNb;
  Game({this.playersNb = 2, this.colorPlayer, this.cubesNb = 6});
  @override
  _GameState createState() => _GameState(
      playersNb: playersNb, colorPlayer: colorPlayer, cubesNb: cubesNb);
}

class _GameState extends State<Game> {
  int playersNb;
  final List<Color> colorPlayer;
  final int cubesNb;
  List<dynamic> players = List<dynamic>();
  int iterator;
  // playersinit and colorplayer init is used for reset the game
  int playersNbinit;
  List<Color> colorPlayerinit = List<Color>(4);
  _GameState({
    this.playersNb,
    this.colorPlayer,
    this.cubesNb = 6,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // save players color and number in playersNbinit and colorPlayerinit
    playersNbinit = playersNb;
    for (int i = 0; i < playersNbinit; i++) {
      colorPlayerinit[i] = colorPlayer[i];
    }
    this.iterator = 0;
    // initialize players objects
    for (int i = 0; i < playersNb; i++)
      players.add(new Player(number: i, colorPlayer: colorPlayer[i]));
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Stack(children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/game.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ChangeNotifierProvider<Cube>(
            create: (context) => Cube(playersNb, colorPlayer, cubesNb),
            child: Consumer<Cube>(
              builder: (context, cube, child) {
                return Stack(
                  children: <Widget>[
                    buildScoreButton(0, 20, 20, cube),
                    if (playersNb > 2) buildScoreButton(1, 20, 285, cube),
                    // board
                    Positioned(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < cubesNb; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                for (int j = 0; j < cubesNb; j++)
                                  buildCube(i, j, cube),
                              ],
                            ),
                        ],
                      ),
                    ),
                    if (playersNb < 4)
                      buildScoreButton(playersNb - 1, 550, 285, cube),
                    if (playersNb == 4) buildScoreButton(2, 550, 285, cube),
                    if (playersNb == 4) buildScoreButton(3, 550, 20, cube),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  // menu when we press on return button of the phone
  Future<bool> _onBackPressed() {
    Widget w = Row(
      children: [
        ButtonTheme(
          minWidth: 70,
          height: 70,
          child: IconButton(
            icon: Icon(Icons.home, color: Color(0xff81b9da), size: 70),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        Text("     "),
        ButtonTheme(
          minWidth: 80,
          height: 80,
          child: IconButton(
            icon: Icon(Icons.play_arrow, color: Color(0xff81b9da), size: 70),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Text("      "),
        ButtonTheme(
          minWidth: 70,
          height: 70,
          child: IconButton(
            icon: Icon(Icons.repeat, color: Color(0xff81b9da), size: 70),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Game(
                        playersNb: playersNbinit,
                        colorPlayer: colorPlayerinit,
                        cubesNb: cubesNb)),
              );
            },
          ),
        ),
      ],
    );
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        title: w,
        actions: []);
    return showDialog(
            context: context, builder: (BuildContext context) => alert) ??
        false;
  }

  // design of points that appear inside the squares
  Widget point() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50.0)),
      height: 10,
      width: 10,
    );
  }

  // the color of score button according to the player
  coloringbutton(int i) {
    if (colorPlayer[i] == Colors.red)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff6E0C23), Color(0xffEC728F)]);
    else if (colorPlayer[i] == Colors.green)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff2D9C40), Color(0xff57E695)]);
    else if (colorPlayer[i] == Colors.yellow)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffDAEF55), Color(0xff9FAF35)]);
    else
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff4E0A58), Color(0xffD13DE8)]);
  }

  Widget buildScoreButton(int i, double top, double left, Cube cube) {
    if (players[i] != null) {
      return Positioned(
        top: top,
        left: left,
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: coloringbutton(i),
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                width: 2.5,
                color: cube.edgeScore[i],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    point(),
                    Text(' : ${players[i].points(cube)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(' : ${players[i].cubeNb}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                )
              ],
            )),
      );
    } else
      return Text("");
  }

  boxColoring(int i, int j, Cube c) {
    if (c.colors[i][j] == Colors.white)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffC8D8E6), Color(0xffDEF31E)]);
    else if (c.colors[i][j] == Colors.blue)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff121C7F), Color(0xff727EEC)]);
    else if (c.colors[i][j] == Colors.red)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff6E0C23), Color(0xffEC728F)]);
    else if (c.colors[i][j] == Colors.green)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff61F984), Color(0xff0C6E23)]);
    else if (c.colors[i][j] == Colors.yellow)
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffDAEF55), Color(0xff9FAF35)]);
    else
      return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff4E0A58), Color(0xffD13DE8)]);
  }

  Widget buildCube(int i, int j, Cube cube) {
    return GestureDetector(
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: boxColoring(i, j, cube),
            color: cube.colors[i][j],
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              width: 2.0,
              color: cube.edgeColors[i][j],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (cube.points[i][j] == 1)
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      point(),
                    ])
              else if (cube.points[i][j] == 2)
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      point(),
                      Text(" "),
                      point(),
                    ])
              else if (cube.points[i][j] == 3)
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            point(),
                            Text(" "),
                            point(),
                          ]),
                      point(),
                    ]),
            ],
          )),
      onTap: () {
        List<int> x = List<int>();
        List<int> y = List<int>();
        if (cube.colors[i][j] == colorPlayer[iterator]) {
          cube.increment(i, j, 1);
          if (cube.points[i][j] >= 4) {
            x.add(i);
            y.add(j);
            transformation(i, j, cube, x, y);
          }
          iterator += 1;
        }
        int k = 0;
        while (k < playersNb) {
          players[k].numberCubes(cube);
          if (players[k].cubeNb == 0) {
            players.removeAt(k);
            playersNb -= 1;
            colorPlayer.removeAt(k);
          }
          k += 1;
        }
        if (iterator >= playersNb) iterator = 0;
        cube.playingNow(colorPlayer[iterator]);
        cube.edgeScoreButton(iterator);
        if (playersNb == 1) winner(context);
      },
    );
  }

  // transformation that happen when a square have 4 points
  transformation(int i, int j, Cube c, List<int> x, List<int> y) {
    if (i != 0) {
      c.changeColor(i - 1, j, c.colors[i][j]);
      c.increment(i - 1, j, 1);
      if (c.points[i - 1][j] == 4) {
        x.add(i - 1);
        y.add(j);
      }
    }
    if (i != cubesNb - 1) {
      c.increment(i + 1, j, 1);
      c.changeColor(i + 1, j, c.colors[i][j]);
      if (c.points[i + 1][j] == 4) {
        x.add(i + 1);
        y.add(j);
      }
    }
    if (j != 0) {
      c.increment(i, j - 1, 1);
      c.changeColor(i, j - 1, c.colors[i][j]);
      if (c.points[i][j - 1] == 4) {
        x.add(i);
        y.add(j - 1);
      }
    }
    if (j != cubesNb - 1) {
      c.changeColor(i, j + 1, c.colors[i][j]);
      c.increment(i, j + 1, 1);
      if (c.points[i][j + 1] == 4) {
        x.add(i);
        y.add(j + 1);
      }
    }
    c.changeColor(i, j, Colors.white);
    Future.delayed(const Duration(milliseconds: 80), () {
      c.changeColor(i, j, Colors.blue);
    });
    c.reset(i, j);
    x.removeAt(0);
    y.removeAt(0);
    if (x.length != 0) {
      Future.delayed(const Duration(milliseconds: 300), () {
        transformation(x[0], y[0], c, x, y);
      });
    }
  }

  winner(BuildContext context) {
    Widget w = Row(
      children: [
        ButtonTheme(
          minWidth: 70,
          height: 70,
          child: IconButton(
            icon: Icon(Icons.home, color: Color(0xff81b9da), size: 70),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        ),
        Text("              "),
        ButtonTheme(
          minWidth: 70,
          height: 70,
          child: IconButton(
            icon: Icon(Icons.repeat, color: Color(0xff81b9da), size: 70),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Game(
                        playersNb: playersNbinit,
                        colorPlayer: colorPlayerinit,
                        cubesNb: cubesNb)),
              );
            },
          ),
        ),
      ],
    );
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        title: w,
        actions: []);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
