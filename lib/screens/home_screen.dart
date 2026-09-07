

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color color1 = Colors.deepPurpleAccent;
  Color color2 = Colors.yellow;
  bool isSelected = false;


  int number = 0;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(number.toString(), style: TextStyle(fontSize: 32)),
            SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                number++;
                print("number after pressed is $number");

                
                setState(() {});
              },
              child: Text("press", style: TextStyle(fontSize: 32)),
            ),

            SizedBox(height: 120),
            Container(
              height: 120,
              width: 120,
              color: isSelected ? color1 : color2
               ),
          ],
        ),
      ),
    );
  }
}
