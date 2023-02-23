import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/logic.dart';

import 'constants.dart';

class GridScreen extends StatefulWidget {
  const GridScreen(
      {Key? key, required this.playerBName, required this.playerAName})
      : super(key: key);
  final String playerAName;
  final String playerBName;
  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  late GameLogic gameLogic = GameLogic(
      playerAName: widget.playerAName, playerBName: widget.playerBName);

  @override
  void initState() {
    super.initState();
  }

  Color? getIconColorForGrid(int index) {
    if (gameLogic.gridDesc[index] == GridTileType.noMove) {
      return null;
    }
    if (gameLogic.gridDesc[index] == GridTileType.playerAMove) {
      return ColorConstants.colourList[1];
    } else {
      return ColorConstants.colourList[2];
    }
  }

  IconData? getIconForGrid(int index) {
    if (gameLogic.gridDesc[index] == GridTileType.noMove) {
      return null;
    }
    if (gameLogic.gridDesc[index] == GridTileType.playerAMove) {
      return Icons.close;
    } else {
      return Icons.circle_outlined;
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
        getSnackBar(gameLogic.winnerName!, context);
        gameLogic.gridDesc = List.from(initialGridDesc);
        gameLogic.moveNumber = 0;
        gameLogic.winnerDecided = false;
        setState(() {});
        gameLogic.winnerName = "Draw";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${gameLogic.playerAName}: ${gameLogic.playerAScore}",
                  style: GoogleFonts.nunito(
                      fontSize: 20, color: ColorConstants.colourList[1]),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text("${gameLogic.playerBName}: ${gameLogic.playerBScore}",
                    style: GoogleFonts.nunito(
                        fontSize: 20, color: ColorConstants.colourList[2]))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 50),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[700]),
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: Icon(
                      getIconForGrid(index),
                      color: getIconColorForGrid(index),
                      size: 60,
                    ),
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
