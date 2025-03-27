import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trash_squad/controllers/user_controller.dart';
import 'package:trash_squad/screens/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _agreeToTerms = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegisterController _userController = RegisterController();

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void _register() async {
    final username = _usernameController.text;
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (!isValidEmail(email)) {
      print("Invalid email format");
      return;
    }

    final userRegister = await _userController.register(
      username,
      email,
      password,
      'user',
    ); 
    if (userRegister != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginWidget()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Register failed'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF086C74),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/splash.png',
            width: double.infinity,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: Color(0xFF086C74),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 240, 240, 240),
                contentPadding: const EdgeInsets.all(18),
                hintText: "Username",
                hintStyle: const TextStyle(
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
            margin: EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF086C74),
                ),
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
            margin: EdgeInsets.only(left: 25, right: 25),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined, color: Color(0xFF086C74)),
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

          const SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 87, 87, 87),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5BB59B),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                minimumSize: Size(465, 65),
              ),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 55),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF086C74),
              border: Border.all(color: const Color(0xFF086C74)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _agreeToTerms = !_agreeToTerms;
                    });
                  },
                  child: Container(
                    width: 17, // Increased container size
                    height: 17, // Increased container size
                    decoration: BoxDecoration(
                      color: _agreeToTerms ? Colors.teal : Colors.transparent,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child:
                        _agreeToTerms
                            ? const Center(
                              child: Icon(
                                Icons.check,
                                size: 10,
                                color: Colors.white,
                              ),
                            )
                            : null,
                  ),
                ),
                const SizedBox(width: 12),
                // Terms text
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      children: [
                        const TextSpan(
                          text: 'By registering, you are agreeing with our ',
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: const TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  if (kDebugMode) {
                                    print('Terms of Use Clicked');
                                  }
                                },
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  if (kDebugMode) {
                                    print('Privacy Policy Clicked');
                                  }
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),

          // Login link
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to login page
                    if (kDebugMode) {
                      print('Navigate to login');
                    }
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
