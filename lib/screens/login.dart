import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_squad/bloc/user_bloc.dart';
import 'package:trash_squad/controllers/user_controller.dart';
import 'package:trash_squad/screens/schedule.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _userController = UserController();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final userBloc = BlocProvider.of<UserBloc>(
      context,
    ); // Get UserBloc instance

    final user = await _userController.login(
      username,
      password,
      userBloc,
    ); // Pass UserBloc
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ScheduleWidget()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF086C74),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              "assets/images/splash.png",
              height: 329,
              width: double.infinity,
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
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: Color(0xFF086C74),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  contentPadding: EdgeInsets.all(18),
                  hintText: "Username",
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
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Color(0xFF086C74),
                  ),
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
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5BB59B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  minimumSize: Size(465, 65),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginWidget(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Signup >",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
