import 'package:flutter/material.dart';
import 'package:tic_tac_toe/logic.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  GameLogic gameLogic = GameLogic(playerAName: "Wow", playerBName: "Wow2");

  @override
  void initState() {
    super.initState();
  }

  String getTextForGrid(int index) {
    if (gameLogic.gridDesc[index] == GridTileType.noMove) {
      return "No Move";
    }
    if (gameLogic.gridDesc[index] == GridTileType.playerAMove) {
      return "Player A";
    } else {
      return "Player B";
    }
  }

  void tapLogic(int index) {
    if (gameLogic.gridDesc[index] == GridTileType.noMove) {
      (gameLogic.moveNumber % 2 == 0)
          ? gameLogic.gridDesc[index] = GridTileType.playerAMove
          : gameLogic.gridDesc[index] = GridTileType.playerBMove;
      gameLogic.checkWin();
      gameLogic.moveNumber++;
      if (!gameLogic.winnerDecided && gameLogic.moveNumber != 9) {
        setState(() {});
      } else {
        gameLogic.gridDesc = initialGridDesc.toList();
        debugPrint(gameLogic.winnerName);
        gameLogic.moveNumber = 0;
        gameLogic.winnerDecided = false;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${gameLogic.playerAName}: ${gameLogic.playerAScore}"),
              const SizedBox(
                width: 40,
              ),
              Text("${gameLogic.playerBName}: ${gameLogic.playerBScore}")
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    tapLogic(index);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text(getTextForGrid(index)),
                  ),
                );
              },
              itemCount: 9,
            ),
          ),
        ],
      ),
    );
  }
}
