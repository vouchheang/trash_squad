import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trash_squad/components/form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _agreeToTerms = false;

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
          SizedBox(
            width: 430,
            child: Column(
              children: const [
                FormregisterWithShadow(
                  hintText: "Location",
                  iconPath: Icon(Icons.location_on),
                ),
                SizedBox(height: 20),
                FormregisterWithShadow(
                  hintText: "Email",
                  iconPath: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 20),
                FormregisterWithShadow(
                  hintText: "Password",
                  iconPath: Icon(Icons.lock_outlined),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 1,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _agreeToTerms ? () {} : null, // Disable if unchecked
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5BB59B),
                foregroundColor: Colors.white,
                minimumSize: const Size(380, 62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ).copyWith(
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    width: 17,  // Increased container size
    height: 17, // Increased container size
    decoration: BoxDecoration(
      color: _agreeToTerms ? Colors.teal : Colors.transparent,
      border: Border.all(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(4),
    ),
    child: _agreeToTerms
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
                      style: const TextStyle(color: Colors.white, fontSize: 12),
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
