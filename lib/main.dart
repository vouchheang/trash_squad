import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_squad/bloc/activity_bloc.dart';
import 'package:trash_squad/bloc/user_bloc.dart';
import 'package:trash_squad/bloc/schedule_bloc.dart';
import 'package:trash_squad/screens/splash.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc()),
        BlocProvider<ActivityBloc>(create: (context) => ActivityBloc()),
        BlocProvider<ScheduleBloc>(
          create: (context) => ScheduleBloc(),
        ),
        // Add other BLoCs here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SplashWedgit(),
      ),
    );
  }
}

// -> Login

// already login -> Home screen
//         Check they have token or not
//             Have token -> Home Screen
//             No token -> Login Screen
