import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  static const String routeName = "counter_screen";

  CounterScreen({super.key});

  int counter = 0;

  @override
  State<StatefulWidget> createState() {
    return CounterScreenState();
  }

}

class CounterScreenState extends State<CounterScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(

            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("$widget.counter",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
                onPressed: () {
                  // counter++;
                  counter++;
                }),
            print(counter),
            }

  ,

  child

      :

  Icon

  (

  Icons.add),
  )
  ],
  ),
  ],

  )

  ,

  )

  ,

  );
}

}