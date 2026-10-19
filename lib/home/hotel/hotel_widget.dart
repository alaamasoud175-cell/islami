import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hotel_name.dart';

class HotelWidget extends StatelessWidget {
  String hotelImage;
  String hotelName;

  HotelWidget({required this.hotelName, required this.hotelImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 6),

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              width: double.infinity,
              fit: BoxFit.fill,
              hotelImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: HotelName(hotelName: hotelName),
          ),
        ],
      ),
    );
  }
}
