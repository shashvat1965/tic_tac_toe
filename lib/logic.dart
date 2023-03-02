import 'package:flutter/cupertino.dart';

class GameLogic {
  String playerAName;
  String playerBName;
  int playerAScore = 0;
  int playerBScore = 0;
  int moveNumber = 0;
  bool winnerDecided = false;
  String winnerName = "Draw!";
  List<GridTileType> gridDesc = [
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove,
    GridTileType.noMove
  ];
  GameLogic({this.playerAName = "Player A", this.playerBName = "Player B"});


  void restartGame(BuildContext context) {
    Navigator.pop(context);
  }

  void checkWin() {
    //Horizontal Checks
    if (gridDesc[0] == gridDesc[1] && gridDesc[0] == gridDesc[2]) {
      if (gridDesc[0] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[0] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
    if (gridDesc[3] == gridDesc[4] && gridDesc[3] == gridDesc[5]) {
      if (gridDesc[3] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[3] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
    if (gridDesc[6] == gridDesc[7] && gridDesc[6] == gridDesc[8]) {
      if (gridDesc[6] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[6] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }

    //vertical checks
    if (gridDesc[0] == gridDesc[3] && gridDesc[0] == gridDesc[6]) {
      if (gridDesc[0] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[0] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
    if (gridDesc[1] == gridDesc[4] && gridDesc[1] == gridDesc[7]) {
      if (gridDesc[1] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[1] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
    if (gridDesc[2] == gridDesc[5] && gridDesc[2] == gridDesc[8]) {
      if (gridDesc[2] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[2] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }

    //diagonal checks
    if (gridDesc[0] == gridDesc[4] && gridDesc[0] == gridDesc[8]) {
      if (gridDesc[0] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[0] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
    if (gridDesc[2] == gridDesc[4] && gridDesc[2] == gridDesc[6]) {
      if (gridDesc[2] == GridTileType.playerAMove) {
        winnerDecided = true;
        winnerName = playerAName;
        playerAScore++;
        return;
      }
      if (gridDesc[2] == GridTileType.playerBMove) {
        winnerDecided = true;
        winnerName = playerBName;
        playerBScore++;
        return;
      }
    }
  }
}

extension ResetScore on GameLogic {
    void get resetScore {
      playerBScore = 0;
      playerAScore = 0;
    }
}

enum GridTileType {
  noMove,
  playerAMove,
  playerBMove,
}
