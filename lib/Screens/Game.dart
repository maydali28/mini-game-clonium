import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  int conteur;
  _GameState({
    this.playersNb,
    this.colorPlayer,
    this.cubesNb = 6,
  });
  @override
  Widget build(BuildContext context) {
    this.conteur = 0;
    for (int i = 0; i < playersNb; i++)
      players.add(new Player(number: i, colorPlayer: colorPlayer[i]));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clonium",
      home: Scaffold(
        body: Stack(children: <Widget>[
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < cubesNb; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int j = 0; j < cubesNb; j++)
                            buildCube(i, j, cube),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  boxColoring(int i, int j, Cube c) {
    if (c.colors[i][j] == Colors.blue)
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
                      Image.asset("assets/star.png", width: 15),
                    ])
              else if (cube.points[i][j] == 2)
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/star.png", width: 15),
                      Image.asset("assets/star.png", width: 15),
                    ])
              else if (cube.points[i][j] == 3)
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/star.png", width: 15),
                            Image.asset("assets/star.png", width: 15),
                          ]),
                      Image.asset("assets/star.png", width: 15),
                    ]),
            ],
          )),
      onTap: () {
        List<int> x = List<int>();
        List<int> y = List<int>();
        if (cube.colors[i][j] == colorPlayer[conteur]) {
          cube.increment(i, j, 1);
          if (cube.points[i][j] >= 4) {
            x.add(i);
            y.add(j);
            transformation(i, j, cube, x, y);
          }
          conteur += 1;
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
        if (conteur >= playersNb) conteur = 0;
        cube.playingNow(colorPlayer[conteur]);

        if (playersNb == 1) print("you win!!!!!!!!!!!!!!!!!!!!!!!!!");
      },
    );
  }

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
    c.changeColor(i, j, Colors.blue);
    c.reset(i, j);
    x.removeAt(0);
    y.removeAt(0);
    if (x.length != 0) transformation(x[0], y[0], c, x, y);
  }
}

class Cube with ChangeNotifier {
  List<List<Color>> colors = new List<List<Color>>(12);
  List<List<Color>> edgeColors = new List<List<Color>>(12);
  List<List<int>> points = new List<List<int>>(12);
  final cubesNb;
  final int playersNb;
  final List<Color> colorPlayer;
  Cube(this.playersNb, this.colorPlayer, this.cubesNb) {
    for (int i = 0; i < cubesNb; i++) {
      colors[i] = new List<Color>(12);
      edgeColors[i] = new List<Color>(12);
      for (int j = 0; j < cubesNb; j++) {
        colors[i][j] = Colors.blue;
        edgeColors[i][j] = Color(0xff81b9da);
      }
    }
    edgeColors[1][1] = Colors.white;
    for (int i = 0; i < cubesNb; i++) {
      points[i] = new List<int>(12);
      for (int j = 0; j < cubesNb; j++) points[i][j] = 0;
    }
    if (playersNb == 2) {
      colors[1][1] = colorPlayer[0];
      colors[cubesNb - 2][cubesNb - 2] = colorPlayer[1];
      points[1][1] = 3;
      points[cubesNb - 2][cubesNb - 2] = 3;
    } else if (playersNb == 3) {
      colors[1][1] = colorPlayer[0];
      colors[1][cubesNb - 2] = colorPlayer[1];
      colors[cubesNb - 2][cubesNb - 2] = colorPlayer[2];
      points[1][1] = 3;
      points[1][cubesNb - 2] = 3;
      points[cubesNb - 2][cubesNb - 2] = 3;
    } else if (playersNb == 4) {
      colors[1][1] = colorPlayer[0];
      colors[1][cubesNb - 2] = colorPlayer[1];
      colors[cubesNb - 2][cubesNb - 2] = colorPlayer[2];
      colors[cubesNb - 2][1] = colorPlayer[3];
      points[1][1] = 3;
      points[1][cubesNb - 2] = 3;
      points[cubesNb - 2][1] = 3;
      points[cubesNb - 2][cubesNb - 2] = 3;
    }
  }
  changeColor(int i, int j, Color c) {
    colors[i][j] = c;
    notifyListeners();
  }

  increment(int i, int j, int n) {
    points[i][j] += n;
    notifyListeners();
  }

  reset(int i, int j) {
    points[i][j] -= 4;
    notifyListeners();
  }

  playingNow(Color now) {
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (colors[i][j] == now)
          edgeColors[i][j] = Colors.white;
        else
          edgeColors[i][j] = Color(0xff81b9da);
      }
    }
    notifyListeners();
  }
}

class Player {
  int number;
  int cubeNb;
  Color colorPlayer;
  Player({@required this.number, @required this.colorPlayer, this.cubeNb = 1});
  numberCubes(Cube c) {
    int n = 0;
    for (int i = 0; i < c.cubesNb; i++) {
      for (int j = 0; j < c.cubesNb; j++) {
        if (colorPlayer == c.colors[i][j]) n += 1;
      }
    }
    cubeNb = n;
  }
}
