import 'package:basics/xo/divider_item.dart';
import 'package:basics/xo/game_button.dart';
import 'package:basics/xo/player_colors.dart';
import 'package:flutter/material.dart';

class GameScreenBoard extends StatefulWidget {
  static const String routeName = 'game_screen';

  @override
  State<GameScreenBoard> createState() => _GameScreenBoardState();
}

class _GameScreenBoardState extends State<GameScreenBoard> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;
  String title = "Player 1s Turns";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlayerColors.transparentColor,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [PlayerColors.cyan, PlayerColors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 24,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    color: PlayerColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Player1(X)',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: PlayerColors.black,
                            ),
                          ),
                          Text(
                            'Score:$player1Score',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: PlayerColors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Player2(O)',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: PlayerColors.black,
                            ),
                          ),
                          Text(
                            'Score:$player2Score',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: PlayerColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: PlayerColors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      color: PlayerColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                GameButton(
                                  symbol: boardState[0],
                                  index: 0,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[1],
                                  index: 1,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[2],
                                  index: 2,
                                  onButtonClick: onGameClick,
                                ),
                              ],
                            ),
                          ),
                          DividerItem(height: 2),
                          Expanded(
                            child: Row(
                              children: [
                                GameButton(
                                  symbol: boardState[3],
                                  index: 3,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[4],
                                  index: 4,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[5],
                                  index: 5,
                                  onButtonClick: onGameClick,
                                ),
                              ],
                            ),
                          ),

                          DividerItem(height: 2),
                          Expanded(
                            child: Row(
                              children: [
                                GameButton(
                                  symbol: boardState[6],
                                  index: 6,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[7],
                                  index: 7,
                                  onButtonClick: onGameClick,
                                ),
                                DividerItem(width: 2),
                                GameButton(
                                  symbol: boardState[8],
                                  index: 8,
                                  onButtonClick: onGameClick,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int counter = 0;

  void onGameClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      title = 'Players 2s Turns';
      boardState[index] = 'x';
    } else {
      title = 'Players 1s Turns';
      boardState[index] = 'o';
    }
    counter++;
    if (checkWinner('x')) {
      // title='Players 1s win';
      player1Score++;
      showResultDialog('Player x wins');
      // Future.delayed(Duration(seconds: 1),initBoard);
    } else if (checkWinner('o')) {
      // title='Players 2s win';
      player2Score++;
      showResultDialog('Player o wins');

      // Future.delayed(Duration(seconds: 1),initBoard);
    } else if (counter == 9) {
      // Future.delayed(Duration(seconds: 1),initBoard);
      showResultDialog('Draw');
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
      if (boardState[2] == symbol &&
          boardState[4] == symbol &&
          boardState[6] == symbol) {
        return true;
      }
      if (boardState[0] == symbol &&
          boardState[4] == symbol &&
          boardState[8] == symbol) {
        return true;
      }
    }
    return false;
  }

  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    title = 'players 1s Turns';
    setState(() {});
  }

  void showResultDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: PlayerColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: PlayerColors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: PlayerColors.blue,
              foregroundColor: PlayerColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              initBoard();
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }
}
