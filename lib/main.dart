import 'package:api_app/view/user_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [BotToastNavigatorObserver()],
        home: UserScreen());
  }
}
