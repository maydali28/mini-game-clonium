import 'package:flutter/material.dart';

class Cube with ChangeNotifier {
  List<List<Color>> colors = new List<List<Color>>(12);
  List<List<Color>> edgeColors = new List<List<Color>>(12);
  List<List<int>> points = new List<List<int>>(12);
  List<Color> edgeScore = new List<Color>(4);
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
    for (int i = 0; i < 4; i++) {
      edgeScore[i] = Color(0x00000000);
    }
    edgeScore[0] = Colors.white;
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

  edgeScoreButton(int iterator) {
    for (int i = 0; i < playersNb; i++) {
      if (iterator == i)
        edgeScore[i] = Colors.white;
      else
        edgeScore[i] = Color(0x00000000);
    }
  }
}
