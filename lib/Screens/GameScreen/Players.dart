import 'package:flutter/material.dart';
import 'package:minigame/Screens/GameScreen/Board.dart';

class Player {
  int number;
  int cubeNb;//Number of cubes that have it now
  Color colorPlayer;
  Player({@required this.number, @required this.colorPlayer, this.cubeNb = 1});
  int numberCubes(dynamic c) {
    int n = 0;
    for (int i = 0; i < c.cubesNb; i++) {
      for (int j = 0; j < c.cubesNb; j++) {
        if (colorPlayer == c.colors[i][j]) n += 1;
      }
    }
    cubeNb = n;
    return n;
  }

  int points(Board c) {
    int n = 0;
    for (int i = 0; i < c.cubesNb; i++) {
      for (int j = 0; j < c.cubesNb; j++)
        if (colorPlayer == c.colors[i][j]) n += c.points[i][j];
    }
    return n;
  }
}
