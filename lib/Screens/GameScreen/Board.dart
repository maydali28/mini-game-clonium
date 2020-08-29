import 'package:flutter/material.dart';

class Board with ChangeNotifier {
  //each cube's color in the board
  List<List<Color>> colors = new List<List<Color>>(12);
  //the edge become white in all the cubes of the player who his turn is up
  List<List<Color>> edgeColors = new List<List<Color>>(12);
  //each cube's points
  List<List<int>> points = new List<List<int>>(12);
  //the score button become also white when it's the player turn
  List<Color> edgeScore = new List<Color>(4);
  //Board size
  final cubesNb;
  //Players Number
  final int playersNb;
  //List of players' colors
  final List<Color> colorPlayer;
  Board(this.playersNb, this.colorPlayer, this.cubesNb) {
    //initial all cubes to be blue
    for (int i = 0; i < cubesNb; i++) {
      colors[i] = new List<Color>(12);
      edgeColors[i] = new List<Color>(12);
      for (int j = 0; j < cubesNb; j++) {
        colors[i][j] = Colors.blue;
        edgeColors[i][j] = Color(0xff81b9da);
      }
    }
    //initial edge of the score button to be transparent
    for (int i = 0; i < 4; i++) {
      edgeScore[i] = Color(0x00000000);
    }
    //initial edge of the score button of first player to be white
    edgeScore[0] = Colors.white;
    //initial color of cube that owned by first player to be white
    edgeColors[1][1] = Colors.white;
    //initial points of the cubes to be 0
    for (int i = 0; i < cubesNb; i++) {
      points[i] = new List<int>(12);
      for (int j = 0; j < cubesNb; j++) points[i][j] = 0;
    }
    //At the beginning of the game each player own a cube that have 3 points on it
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
    print("i: $i, j:$j");
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

  edgeScoreButton(int iterator) {
    for (int i = 0; i < playersNb; i++) {
      if (iterator == i)
        edgeScore[i] = Colors.white;
      else
        edgeScore[i] = Color(0x00000000);
    }
    notifyListeners();
  }

  edgechoosen(int i,int j) async{
    edgeColors[i][j]=Colors.red;
    await Future.delayed(const Duration(milliseconds: 80),(){
        edgeColors[i][j]=Color(0x00000000);
    });
    notifyListeners();
 }
  

  isGameOver() {
    List<Color> existColors = List<Color>();
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (!existColors.contains(colors[i][j])) existColors.add(colors[i][j]);
      }
    }
    return (existColors.length < 3);
  }

  List<int> postions(int playerId) {
    List<int> pos = List<int>();
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (colors[i][j] == colorPlayer[playerId]) {
          pos.add(i);
          pos.add(j);
        }
      }
    }
    return pos;
  }
}

//this class is used in the algo minmax
class VirtualBoard {
  /*matrix that each element {i,j} have inside it list L (L[0]:player number who
  have that cube (0: no one owned,1: the player 1,2: the player 2 "AI") ,L[1]: 
  points inside that element)*/
  List<List<List<dynamic>>> vb = new List<List<List<dynamic>>>(12);
  //size of the matrix
  int cubesNb;

  VirtualBoard(Board b) {
    //make a copy of the board
    this.cubesNb = b.cubesNb;
    for (int i = 0; i < cubesNb; i++) {
      vb[i] = List<List<dynamic>>(12);
      for (int j = 0; j < cubesNb; j++) {
        vb[i][j] = List<dynamic>(2);
        if (b.colors[i][j] == Colors.blue)
          vb[i][j][0] = 0;
        else if (b.colors[i][j] == b.colorPlayer[0])
          vb[i][j][0] = 1; //player1
        else if (b.colors[i][j] == b.colorPlayer[1]) vb[i][j][0] = 2; //player2
        vb[i][j][1] = b.points[i][j];
      }
    }
  }
  VirtualBoard.copy(VirtualBoard b) {
    //make a copy of virtual board
    this.cubesNb = b.cubesNb;
    for (int i = 0; i < cubesNb; i++) {
      vb[i] = List<List<dynamic>>(12);
      for (int j = 0; j < cubesNb; j++) {
        vb[i][j] = List<dynamic>(2);
        vb[i][j][0] = b.vb[i][j][0];
        vb[i][j][1] = b.vb[i][j][1];
      }
    }
  }

  void virtualClick(int i, int j) {
    List<int> x = List<int>();
    List<int> y = List<int>();
    vb[i][j][0] += 1;
    if (vb[i][j][0] >= 4) {
      x.add(i);
      y.add(j);
      transformation(i, j, x, y);
    }
  }

  transformation(int i, int j, List<int> x, List<int> y) {
    if (i != 0) {
      vb[i - 1][j][0] = vb[i][j][0];
      vb[i - 1][j][1] += 1;
      if (vb[i - 1][j][1] > 3) {
        x.add(i - 1);
        y.add(j);
      }
    }
    if (i != cubesNb - 1) {
      vb[i + 1][j][0] = vb[i][j][0];
      vb[i + 1][j][1] += 1;
      if (vb[i + 1][j][1] > 3) {
        x.add(i + 1);
        y.add(j);
      }
    }
    if (j != 0) {
      vb[i][j - 1][0] = vb[i][j][0];
      vb[i][j - 1][1] += 1;
      if (vb[i][j - 1][1] > 3) {
        x.add(i);
        y.add(j - 1);
      }
    }
    if (j != cubesNb - 1) {
      vb[i][j + 1][0] = vb[i][j][0];
      vb[i][j + 1][1] += 1;
      if (vb[i][j + 1][1] > 3) {
        x.add(i);
        y.add(j + 1);
      }
    }
    vb[i][j][0] = 0;
    vb[i][j][1] = 0;
    x.removeAt(0);
    y.removeAt(0);
    if (x.length != 0) {
      transformation(x[0], y[0], x, y);
    }
  }

  int points(int playerId) {
    int p = 0;
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (vb[i][j][0] == playerId) p = p + vb[i][j][1];
      }
    }
    return p;
  }

  isGameOver() {
    List<int> exist = List<int>();
    for (int i = 0; i < cubesNb; i++) {
      for (int j = 0; j < cubesNb; j++) {
        if (!exist.contains(vb[i][j][0])) exist.add(vb[i][j][0]);
      }
    }
    return (exist.length < 2);
  }
}
