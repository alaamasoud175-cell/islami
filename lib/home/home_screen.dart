import 'package:basics/home/hotel/hotel_widget.dart';
import 'package:basics/model/hotel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<Hotel> hotelsList = [
    Hotel(name: "sharmEl-sheikh", image: "assets/images/sharm_image.png"),
    Hotel(name: "Alexandria", image: "assets/images/alex_image.png"),
    Hotel(name: "Dahab", image: "assets/images/dahab.png"),
    Hotel(name: "marasy", image: "assets/images/marasy.png"),
    Hotel(name: "Nile", image: "assets/images/Nile.png"),
    Hotel(name: "Aswan", image: "assets/images/aswan.png"),
    Hotel(name: "Alexandria", image: "assets/images/alex_image.png"),
    Hotel(name: "sharmEl-sheikh", image: "assets/images/sharm_image.png"),
  ];

  void addHotel() {
    for (int i = 0; i < 1000; i++) {
      hotelsList.add(
        Hotel(name: "SharmEl-sheikh", image: "assets/images/sharm_image.png"),
      );
    }
  }

  HomeScreen() {
    addHotel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemBuilder: (context, index) {
              return HotelWidget(
                hotelName: hotelsList[index].name,
                hotelImage: hotelsList[index].image,
              );
            },
            itemCount: hotelsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
          ),
        ),
      ),
    );
  }
}
