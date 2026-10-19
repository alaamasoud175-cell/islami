import 'package:basics/xo/player_colors.dart';
import 'package:flutter/cupertino.dart';

class DividerItem extends StatelessWidget {
  double height;
  double width;

  DividerItem({this.width = double.infinity, this.height = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width, color: PlayerColors.black);
  }
}
