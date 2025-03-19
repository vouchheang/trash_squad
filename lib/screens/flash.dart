import 'package:flutter/material.dart';

class FlashWidget extends StatelessWidget {
  const FlashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xFF086C74),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 150),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
            "assets/images/splash.png",
            height: 281,
            width: 271,
          ),
            const Text(
              "Trash Squad",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: "Jomolhari",
              ),
            ),
          ],
        ),
      ),                                                                         
      );
  }
}