import 'package:flutter/material.dart';
import 'package:project/logic/game_logic.dart';
import 'package:project/widgets/game_board.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (_) => 'Rock, Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
       title: const Text('Rock, Paper, Scissors', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
        colors: <Color>[
        Color(0xFF9A4A07),
        Color(0xFFEEBC55)]))),
      ),
      body: ChangeNotifierProvider(
          create: (context) => GameLogic(),
          child: Container(
            width: size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xFFDE7C2F),
                        Color(0xFFEEB327)])),
              child: const GameBoard())),
    );
  }
}
