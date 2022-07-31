import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/model/card_model.dart';

class GameLogic extends ChangeNotifier {
  static const cardRock = CardModel(TypeCard.rock, 'assets/images/rock.png');
  static const cardPaper = CardModel(TypeCard.paper, 'assets/images/paper.png');
  static const cardScissors =
      CardModel(TypeCard.scissors, 'assets/images/scissors.png');
  static final rng = Random();
  static TypeCard? _winner;
  static final Map<int, int> _result = <int, int>{0: 2, 1: 0, 2: 1};

  static List<CardModel> _cards = _createList();

  void start() {
    _cards.clear();
    _cards = _createList();
    _winner = _createMessage();
    notifyListeners();
  }

  List<CardModel> get cards => _cards;
  TypeCard? get winner => _winner;

  static TypeCard? _createMessage() {
    final card1 = _cards[0];
    final card2 = _cards[1];

    if (card1 == card2) {
      return null;
    }

    if (_result[card1.typeCard.index] == card2.typeCard.index) {
      return card1.typeCard;
    }

    return card2.typeCard;
  }

  static List<CardModel> _createList() {
    return List<CardModel>.generate(2, (_) => _generate());
  }

  static CardModel _generate() {
    final position = rng.nextInt(3);

    switch (position) {
      case 0:
        return cardRock;
      case 1:
        return cardPaper;
      case 2:
        return cardScissors;
      default:
        throw ArgumentError();
    }
  }
}
