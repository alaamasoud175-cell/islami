import 'package:flutter/material.dart';

typedef onGameButtonClick = void Function(int);

class GameButton extends StatelessWidget {
  String symbol;
  int index;
  onGameButtonClick onButtonClick;

  GameButton({
    required this.symbol,
    required this.onButtonClick,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onButtonClick(index);
        },

        child: symbol.isEmpty
            ? Container()
            : Image.asset('assets/images/$symbol.png'),
      ),
    );
  }
}
