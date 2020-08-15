import 'package:flutter/material.dart';
import 'Cubes.dart';

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

  int points(Cube c) {
    int n = 0;
    for (int i = 0; i < c.cubesNb; i++) {
      for (int j = 0; j < c.cubesNb; j++)
        if (colorPlayer == c.colors[i][j]) n += c.points[i][j];
    }
    return n;
  }
}
