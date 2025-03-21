import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_squad/bloc/user_bloc.dart';
import 'package:trash_squad/screens/login.dart';
import 'package:trash_squad/screens/social.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        // Add other BLoCs here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SocialWidget(),
      ),
    );
  }
}

