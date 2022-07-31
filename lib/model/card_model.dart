
import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  const CardModel(this._typeCard, this._image);
  final String _image;
  final TypeCard _typeCard;

  String get image => _image;
  TypeCard get typeCard => _typeCard;

  @override
  List<Object?> get props => [_typeCard];
}

enum TypeCard {
  rock,
  paper,
  scissors
}