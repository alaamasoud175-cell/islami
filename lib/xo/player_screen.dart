import 'package:basics/xo/game_screen_board.dart';
import 'package:basics/xo/player_colors.dart';
import 'package:basics/xo/player_symbol.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player_screen';

  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              // spacing: 18,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Pick who goes first?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: PlayerColors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    spacing: 18,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlayerSymbol(
                        symbol: 'x',
                        onSymbolClick: () {
                          Navigator.of(
                            context,
                          ).pushNamed(GameScreenBoard.routeName);
                        },
                      ),
                      PlayerSymbol(
                        symbol: 'o',
                        onSymbolClick: () {
                          Navigator.of(
                            context,
                          ).pushNamed(GameScreenBoard.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
