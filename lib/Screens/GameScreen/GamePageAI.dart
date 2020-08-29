import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'Board.dart';
import 'Players.dart';
import '../HomeScreen/HomePage.dart';
import 'package:threading/threading.dart';

class GameVsAI extends StatefulWidget {
  final List<Color> colorPlayer;
  final int cubesNb;
  final int level;
  GameVsAI({this.colorPlayer, this.cubesNb = 6, this.level = 2});
  @override
  _GameVsAIState createState() =>
      _GameVsAIState(colorPlayer: colorPlayer, cubesNb: cubesNb);
}

class _GameVsAIState extends State<GameVsAI> with WidgetsBindingObserver {
  int iterator = 7; // it's used to make  AI made random 3 steps at beginning
  int playersNb = 2;
  final List<Color> colorPlayer;
  final int cubesNb;
  List<dynamic> players = List<dynamic>();
  // playersinit and colorplayer init is used for reset the game
  List<Color> colorPlayerinit = List<Color>(2);
  bool ai = false;
  bool player = true;
  final int level;
  _GameVsAIState({this.colorPlayer, this.cubesNb = 6, this.level = 2});
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _onBackPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // save players color in colorPlayerinit
    for (int i = 0; i < 2; i++) {
      colorPlayerinit[i] = colorPlayer[i];
    }
    // initialize players objects
    for (int i = 0; i < 2; i++)
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
          ChangeNotifierProvider<Board>(
            create: (context) => Board(2, colorPlayer, cubesNb),
            child: Consumer<Board>(
              builder: (context, cube, child) {
                return Stack(
                  children: <Widget>[
                    buildScoreButton(0, 20, 20, cube),
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
                                  buildCube(i, j, cube, context),
                              ],
                            ),
                        ],
                      ),
                    ),
                    buildScoreButton(1, 550, 285, cube),
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
                    builder: (context) => GameVsAI(
                        colorPlayer: colorPlayerinit, cubesNb: cubesNb)),
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

  Widget buildScoreButton(int i, double top, double left, Board cube) {
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

  boxColoring(int i, int j, Board c) {
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

  Widget buildCube(int i, int j, Board cube, BuildContext context) {
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
                if ((cube.points[i][j] == 1) &&
                    (cube.colors[i][j] != Colors.blue))
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        point(),
                      ])
                else if ((cube.points[i][j] == 2) &&
                    (cube.colors[i][j] != Colors.blue))
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        point(),
                        Text(" "),
                        point(),
                      ])
                else if ((cube.points[i][j] == 3) &&
                    (cube.colors[i][j] != Colors.blue))
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
        onTap: () async {
          if ((!cube.isGameOver()) &&
              (cube.colors[i][j] == colorPlayer[0]) &&
              (player)) {
            var thread1 = new Thread(() {
              this.player = false;
            });
            await thread1.start();
            await thread1.join();
            var thread2 = new Thread(() async {
              await clickCube(i, j, cube, true);
            });
            print("thread2 start");
            await thread2.start();
            print("thread2 end");
            await thread2.join();
            print("thread3 start");
            var thread3 = new Thread(() async {
              players[1].numberCubes(cube);
              if (players[1].cubeNb == 0) {
                winner(context);
              } else {
                cube.playingNow(colorPlayer[1]);
                cube.edgeScoreButton(1);
                var thread4 = new Thread(() async {
                  while (ai == false) {}
                  if (iterator != 0) {
                    Random random = new Random();
                    await Future.delayed(const Duration(milliseconds: 500),
                        () async {
                      iterator -= 1;
                      List<int> positions = cube.postions(1);
                      int p = random.nextInt(positions.length);
                      if (p % 2 == 0) {
                        var thread5 = new Thread(() async {
                          await clickCube(
                              positions[p], positions[p + 1], cube, false);
                          await cube.edgechoosen(
                            positions[p],
                            positions[p + 1],
                          );
                        });
                        await thread5.start();
                        await thread5.join();
                      } else {
                        var thread5 = new Thread(() async {
                          await clickCube(
                              positions[p - 1], positions[p], cube, false);
                          await cube.edgechoosen(
                            positions[p - 1],
                            positions[p],
                          );
                        });
                        await thread5.start();
                        await thread5.join();
                      }
                    });
                  } else {
                    await Future.delayed(const Duration(milliseconds: 300),
                        () async {
                      var thread5 = new Thread(() async {
                        await bestMove(cube);
                      });
                      await thread5.start();
                      await thread5.join();
                    });
                  }
                  // verify if game is over
                  print("thread6 start");
                  var thread6 = new Thread(() {
                    while ((ai == true) || (player == false)) {}
                    players[0].numberCubes(cube);
                    if (!cube.isGameOver()) {
                      print("game still going");
                      cube.playingNow(colorPlayer[0]);
                      cube.edgeScoreButton(0);
                    }
                  });
                  players[0].numberCubes(cube);
                  if (players[0].cubeNb == 0) {
                    winner(context);
                    print("gameend");
                  } else {
                    await thread6.start();
                    await thread6.join();
                  }
                });
                print("thread6 end");
                await thread4.start();
                await thread4.join();
              }
            });
            await thread3.start();
            await thread3.join();
            print("thread3 end");
          }
        });
  }

  transformation(BuildContext context, int i, int j, Board c, List<int> x,
      List<int> y, bool playing) async {
    if (playing)
      print("player now");
    else
      print("ai now");
    if (c.points[i][j] >= 4) {
      print("t1 start");
      if (i != 0) {
        c.changeColor(i - 1, j, c.colors[i][j]);
        c.increment(i - 1, j, 1);
        if (c.points[i - 1][j] > 3) {
          x.add(i - 1);
          y.add(j);
        }
      }
      if (i != cubesNb - 1) {
        c.increment(i + 1, j, 1);
        c.changeColor(i + 1, j, c.colors[i][j]);
        if (c.points[i + 1][j] > 3) {
          x.add(i + 1);
          y.add(j);
        }
      }
      if (j != 0) {
        c.increment(i, j - 1, 1);
        c.changeColor(i, j - 1, c.colors[i][j]);
        if (c.points[i][j - 1] > 3) {
          x.add(i);
          y.add(j - 1);
        }
      }
      if (j != cubesNb - 1) {
        c.changeColor(i, j + 1, c.colors[i][j]);
        c.increment(i, j + 1, 1);
        if (c.points[i][j + 1] > 3) {
          x.add(i);
          y.add(j + 1);
        }
      }
      print("t1 end");
      print("t2 start");
      c.changeColor(i, j, Colors.white);
      await Future.delayed(const Duration(milliseconds: 80), () {
        c.changeColor(i, j, Colors.blue);
      });
      print("t2 end");
      print("t3 start");
      c.reset(i, j);
      print("t3 end");
    }
    x.removeAt(0);
    y.removeAt(0);
    print("t4");
    players[0].numberCubes(c);
    players[1].numberCubes(c);
    if ((x.length != 0) &&
        (players[0].cubeNb != 0) &&
        (players[1].cubeNb != 0)) {
      await Future.delayed(const Duration(milliseconds: 300), () {
        transformation(context, x[0], y[0], c, x, y, playing);
      });
    } else {
      if (ai) {
        players[0].numberCubes(c);
        if (players[0].cubeNb == 0) {
          winner(context);
          this.ai = !ai;
          print("gameend");
        }
      }
      if (!c.isGameOver()) {
        this.ai = !ai;
        print("ai: $ai");
        if (!playing) {
          this.player = true;
        }
      }
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  HomePage()));
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
                    builder: (context) =>  GameVsAI(
                        colorPlayer: colorPlayerinit, cubesNb: cubesNb)),
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

  clickCube(
    int i,
    int j,
    Board cube,
    player,
  ) async {
    List<int> x = List<int>();
    List<int> y = List<int>();
    cube.increment(i, j, 1);
    x.add(i);
    y.add(j);
    await transformation(context, i, j, cube, x, y, player);
  }

  bestMove(Board cube) async {
    int bestScore = 0;
    List<int> move = List<int>(2); //[x,y]
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (cube.colors[i][j] == cube.colorPlayer[1]) {
          VirtualBoard currentBoard = VirtualBoard(cube);
          currentBoard.virtualClick(i, j);
          int score = minimax(level, false, currentBoard);
          if (score > bestScore) {
            bestScore = score;
            move[0] = i;
            move[1] = j;
          }
        }
      }
    }

    if (move[0] == null) {
      List<int> positions = cube.postions(1);
      move[0] = positions[0];
      move[1] = positions[1];
    }
    cube.edgechoosen(move[0], move[1]);
    await clickCube(move[0], move[1], cube, false);
  }

  minimax(int depth, bool isMax, dynamic board) {
    if ((depth == 0) || (board.isGameOver())) {
      if (isMax)
        return board.points(2);
      else
        return board.points(1);
    }
    if (isMax) {
      int bestScore = 0;
      VirtualBoard board1 = VirtualBoard.copy(board);
      for (int i = 0; i < cubesNb; i++) {
        for (int j = 0; j < cubesNb; j++) {
          if (board.vb[i][j][0] == 2) {
            board.virtualClick(i, j);
            int score = minimax(depth - 1, false, board);
            board = board1;
            bestScore = max(bestScore, score);
          }
        }
      }

      return bestScore;
    } else {
      int bestScore = 10000000;
      VirtualBoard board2 = VirtualBoard.copy(board);
      for (int i = 0; i < cubesNb; i++) {
        for (int j = 0; j < cubesNb; j++) {
          if (board.vb[i][j][0] == 1) {
            board.virtualClick(i, j);
            int score = minimax(depth - 1, true, board);
            board = board2;
            bestScore = min(bestScore, score);
          }
        }
      }
      return bestScore;
    }
  }
}
