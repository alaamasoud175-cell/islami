import 'package:flutter/material.dart';

class HotelName extends StatelessWidget {
  String hotelName;
  double verticalpadding;
  double radious;

  HotelName({
    required this.hotelName,
    this.verticalpadding = 8,
    this.radious = 40,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: verticalpadding,
          horizontal: 16,
        ),
        backgroundColor: Color(0xFF024383),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child: Text(
        hotelName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
