import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/logic/game_logic.dart';
import 'package:project/model/card_model.dart';
import 'package:project/widgets/start_button.dart';
import 'package:provider/provider.dart';

import 'card_widget.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  @override
  Widget build(BuildContext context) {
    final GameLogic game = context.read<GameLogic>();

    return Consumer<GameLogic>(builder: (_, value, __) {
      return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Expanded(child: CardWidget(value.cards[0].image)),
        const SizedBox(
          height: 20,
        ),
        StartButton(onClick: (){
          game.start();
          showMessage(context, value.winner);
        }),
        const SizedBox(
          height: 20,
        ),
        Expanded(child: CardWidget(value.cards[1].image))
      ]);
    });
  }

  void showMessage(BuildContext context, TypeCard? card) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          decoration: const BoxDecoration(
              color: Color(0xFF7E3702),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card != null ?
                Image.asset('assets/images/${card.name}.png', width: 50, height: 50) :
                SvgPicture.asset('assets/images/flag.svg', width: 50, height: 50),
              const SizedBox(width: 25),
              card != null ?
                Image.asset('assets/images/winner.png', width: 120, height: 80) :
                Image.asset('assets/images/tieGame.png', width: 120, height: 80),
            ],
          )),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(milliseconds: 800),
      width: 300,
    ));
  }
}
