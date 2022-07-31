import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, this.onClick}) : super(key: key);

  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    const shape = StadiumBorder();

    return Material(
      color: Colors.transparent,
      shape: shape,
      elevation: 8,
      child: Container(
        decoration: const ShapeDecoration(
            shape: shape,
            gradient: LinearGradient(
                colors: [
                  Color(0xFF9A4A07),
                  Color(0xFFEEBC55),
                  Color(0xFFF6CE94),
                ]
            )
        ),
        child: ElevatedButton(
            style: ButtonStyle(
              padding: getPadding(),
              overlayColor: getColor(Colors.transparent, Color(0x69A1A1A0)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shadowColor: getColor(Colors.transparent, Colors.transparent),
              elevation: getElevation(),
              backgroundColor: getColor(Colors.transparent, Colors.transparent),

            ),
            onPressed: onClick,
            child: const Text('Start', style: TextStyle(fontSize: 22, color: Colors.black),)),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
    final getColor = (Set<MaterialState> states) {
      if(states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<EdgeInsetsGeometry> getPadding() {
    return MaterialStateProperty.resolveWith((_) => EdgeInsets.symmetric(horizontal: 50, vertical: 20));
  }

  MaterialStateProperty<double?> getElevation() {
    return MaterialStateProperty.resolveWith((_) => 0);
  }
}
