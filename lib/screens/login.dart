import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF086C74),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset("assets/images/splash.png", 
            height: 329, 
            width: double.infinity
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 87, 87, 87),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  contentPadding: EdgeInsets.all(18),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: const Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 87, 87, 87),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  contentPadding: EdgeInsets.all(18),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: const Color(0xFF5BB59B),
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 87, 87, 87),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5BB59B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  minimumSize: Size(465, 65)
                ),
                child: Text("Login"),
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 150),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Signup >",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
